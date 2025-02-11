<template>
  <section class="room-list">
    <h2>My Likes</h2>
    <div class="room-grid">
      <router-link v-for="room in paginatedRooms" :key="room.ID" :to="{ name: 'RoomDetail', params: { id: room.ID } }"
        class="room-card-link">
        <article class="room-card">
          <div class="room-image-container">
            <img v-if="room.IMG_PATH" :src="room.IMG_PATH" :alt="room.THEME_NM" class="room-image"
              @error="onImageError(room.ID)" />
            <img v-else src="/api/placeholder/150/150" :alt="room.THEME_NM" class="room-image placeholder" />
          </div>
          <div class="room-info">
            <h3 class="room-title">{{ room.THEME_NM }}</h3>
            <p class="room-content">{{ room.ROOM_NM }}</p>
            <div class="room-meta">
              <span class="room-genre">장르: {{ room.GENRE_NM }}</span>
              <span class="room-party">추천 인원: {{ room.MIN_PARTY }}-{{ room.MAX_PARTY }}명</span>
              <span class="room-time">시간: {{ room.RUN_TIME }}분</span>
              <span class="room-price">{{ room.PRICE }}원</span>
            </div>
          </div>
        </article>
      </router-link>
    </div>

    <Pagination :currentPage="currentPage" :totalPages="totalPages" @page-changed="changePage" />
  </section>
</template>

<script>
import axios from 'axios';
import Pagination from '@/components/Pagination.vue';
import { computed } from 'vue';
import { useStore } from 'vuex';

export default {
  name: 'RoomList',
  components: {
    Pagination,
  },
  data() {
    return {
      rooms: [],
      currentPage: 1,
      pageSize: 6,
      searchKeyword: '',
      selectedRegion: '',
      selectedGenre: '',
      regions: [], // 지역 데이터를 여기로 받아옴
      genres: [],  // 장르 데이터를 여기로 받아옴
    };
  },
  setup() {
    const store = useStore();

    const isLoggedIn = computed(() => store.getters.isAuthenticated);
    const user = computed(() => store.getters.user);
    const role = computed(() => store.getters.role);

    return {
      isLoggedIn,
      user,
      role,
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.rooms.length / this.pageSize);
    },
    paginatedRooms() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.rooms.slice(start, end);
    },
    roleAdmin() {
      return this.role === 'ADMIN';
    }
  },
  created() {
    this.fetchRoomList();  // 처음 페이지가 로드될 때 방 목록을 조회
    this.fetchRegions();    // 지역 목록 불러오기
    this.fetchGenres();     // 장르 목록 불러오기
  },
  methods: {
    fetchRoomList() {
      const params = {
        userId: this.user?.id,
        keyword: this.searchKeyword.replace(/\s+/g, '') || '',  // 검색어가 없을 때는 빈 값
        region: this.selectedRegion || '',  // 선택된 지역이 없을 때는 빈 값
        genre: this.selectedGenre || '',    // 선택된 장르가 없을 때는 빈 값
      };

      axios
        .get('api/room/myLikes', { params })
        .then((response) => {
          this.rooms = response.data;
          this.currentPage = 1; // Reset to first page on new search
        })
        .catch((error) => {
          console.error('Error fetching room list:', error);
        });
    },
    fetchRegions() {
      const type = "REGION_CD";
      axios
        .get(`/api/common/code/${type}`)
        .then((response) => {
          this.regions = response.data;
        })
        .catch((error) => {
          console.error('Error fetching regions:', error);
        });
    },
    fetchGenres() {
      const type = "GENRE_CD";
      axios
        .get(`/api/common/code/${type}`)
        .then((response) => {
          this.genres = response.data;
        })
        .catch((error) => {
          console.error('Error fetching genres:', error);
        });
    },
    changePage(page) {
      this.currentPage = page;
    },
    onImageError(id) {
      console.error(`Failed to load image for room ${id}`);
    },
  },
};
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');

.add-room-button {
  display: flex;
  justify-content: center;
  margin-bottom: 2rem;
}

.add-room-button .btn-primary {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
}

.add-room-button .btn-primary:hover {
  background-color: #0056b3;
}

.room-list {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

h2 {
  font-size: 2.5rem;
  color: #333;
  margin-bottom: 2rem;
  text-align: center;
}

.room-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 2rem;
}

.room-card-link {
  text-decoration: none;
  color: inherit;
}

.room-card {
  display: flex;
  background-color: #fff;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.room-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.room-image-container {
  flex-shrink: 0;
  width: 100px;
  /* 고정 너비 */
  height: 150px;
  /* 고정 높이 */
  overflow: hidden;
  /* 잘리지 않게 숨김 처리 */
  border-radius: 12px;
  /* 컨테이너에 둥글게 하기 */
}

.room-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  /* 비율을 유지하며 잘림 */
  border-radius: 12px;
  /* 이미지에 둥글게 하기 */
}

.room-image.placeholder {
  object-fit: contain;
  /* 기본 이미지 비율 유지 */
  padding: 1rem;
  background-color: #f0f0f0;
}

.room-info {
  flex-grow: 1;
  padding: 1rem;
  display: flex;
  flex-direction: column;
}

.room-title {
  font-size: 1.2rem;
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.room-content {
  font-size: 1rem;
  color: #34495e;
  margin-bottom: 0.5rem;
  line-height: 1.4;
  flex-grow: 1;
}

.room-meta {
  font-size: 0.9rem;
  color: #7f8c8d;
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.room-meta span {
  background-color: #ecf0f1;
  padding: 0.2rem 0.5rem;
  border-radius: 4px;
}

@media (max-width: 600px) {
  .room-card {
    flex-direction: column;
    /* 모바일에서 세로로 쌓임 */
  }

  .room-image-container {
    width: 100%;
    /* 너비를 100%로 설정 */
    height: 200px;
    /* 높이 조정 */
  }

  .room-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    /* 여기 수정 */
  }
}

.search-container {
  display: flex;
  flex-wrap: wrap;
  /* 요소들이 줄 바꿈 할 수 있도록 설정 */
  gap: 2px;
  /* 요소 간의 간격을 줄여서 겹침 방지 */
  margin-bottom: 30px;
  padding: 20px;
  background-color: #f8f9fa;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.search-input-wrapper,
.select-wrapper {
  flex: 1;
  /* 각 요소가 가능한 공간을 균등하게 차지 */
  min-width: 150px;
  /* 최소 너비를 설정하여 너무 좁아지지 않도록 함 */
  position: relative;
}

.search-input {
  width: 84%;
  /* 너비를 100%로 설정 */
  padding: 12px;
  /* 상하 패딩 */
  border: 1px solid #ced4da;
  border-radius: 5px;
  font-size: 16px;
  transition: border-color 0.3s;

}

.search-select {
  width: 95%;
  /* 너비를 100%로 설정 */
  padding: 12px;
  /* 상하 패딩 */
  border: 1px solid #ced4da;
  border-radius: 5px;
  font-size: 16px;
  transition: border-color 0.3s;
  -webkit-appearance: none;
  /* Safari 및 Chrome의 기본 스타일 제거 */
  -moz-appearance: none;
  /* Firefox의 기본 스타일 제거 */
  appearance: none;
  /* 모든 브라우저의 기본 스타일 제거 */
  background-color: white;
  /* 배경 색 설정 (선택 사항) */
}

.search-input:focus,
.search-select:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.select-wrapper::after {
  content: '';
  /* 화살표 아이콘 대체 */
  position: absolute;
  right: 30px;
  /* 오른쪽에서 간격 설정 */
  top: 50%;
  /* 세로 중앙 정렬 */
  transform: translateY(-50%);
  /* 세로 중앙 정렬 */
  width: 0;
  height: 0;
  border-left: 5px solid transparent;
  /* 화살표 모양을 만들기 위해 */
  border-right: 5px solid transparent;
  /* 화살표 모양을 만들기 위해 */
  border-top: 5px solid #000;
  /* 화살표 색상 설정 */
  pointer-events: none;
  /* 클릭 방지 */
}

.search-icon {
  position: absolute;
  right: 12px;
  top: 50%;
  transform: translateY(-50%);
  color: #6c757d;
  pointer-events: none;
  /* 아이콘이 입력을 방해하지 않도록 설정 */
}

.search-btn {
  padding: 12px 25px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.search-btn:hover {
  background-color: #0056b3;
}

/* 모바일 디바이스에 대한 스타일 */
@media (max-width: 768px) {
  .search-container {
    flex-direction: column;
    /* 요소들을 세로로 쌓이도록 설정 */
    align-items: stretch;
    /* 각 요소가 부모 너비를 다 차지하도록 설정 */
  }
}
</style>