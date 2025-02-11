<template>
  <section class="room-list">
    <h2>Showcase</h2>
    <div v-if="roleAdmin" class="edit-delete-buttons">
      <div class="add-room-button">
        <router-link to="/roomSubmit" class="btn btn-primary">
          새 사이트 등록
        </router-link>
      </div>
    </div>
    <div class="search-container">
      <div class="search-input-wrapper">
        <input type="text" v-model="searchKeyword" placeholder="검색어를 입력하세요" class="search-input"
          @keyup.enter="fetchRoomList" />
      </div>
      <div class="select-wrapper">
        <select v-model="selectedRegion" class="search-select">
          <option value="">카테고리를 선택하세요</option>
          <option v-for="region in regions" :key="region.CODE_VAL" :value="region.CODE_VAL">
            {{ region.CODE_NM }}
          </option>
        </select>
      </div>
      <button @click="fetchRoomList" class="btn btn-primary search-btn">
        검색
      </button>
    </div>

    <div class="room-grid">
      <router-link v-for="room in paginatedRooms" :key="room.ID" :to="{ name: 'RoomDetail', params: { id: room.ID } }"
        class="room-card-link">
        <article class="room-card">
          <div class="room-image-container">
            <img v-if="room.IMG_PATH" :src="room.IMG_PATH" :alt="room.THEME_NM" class="room-image"
              @error="onImageError(room.ID)" />
            <img v-else src="/api/placeholder/150/150" :alt="room.THEME_NM" class="room-image placeholder" />
          </div>
          <div class="room-details">
            <h3 class="room-title">{{ room.THEME_NM }}</h3>
            <div class="room-tags">
              <span class="room-tag">{{ room.GENRE_NM }}</span>
              <span class="room-tag">{{ room.MIN_PARTY }}-{{ room.MAX_PARTY }}명</span>
              <span class="room-tag">{{ room.PRICE }}원</span>
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
      pageSize: 35,
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
        keyword: this.searchKeyword.trim() || '',  // 공백 제거
        region: this.selectedRegion || '',
        genre: this.selectedGenre || '',
      };

      axios
        .get('api/room/list', { params })
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
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: 1rem;
}

.room-card-link {
  text-decoration: none;
  color: inherit;
}

.room-card {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  background-color: #fff;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  text-align: center;
}

.room-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
}

.room-image-container {
  width: 100%;
  height: 120px;
  overflow: hidden;
  border-radius: 8px;
}

.room-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.room-details {
  padding: 0.5rem;
  background-color: #f8f9fa;
  width: 100%;
}

.room-image.placeholder {
  object-fit: contain;
  /* 기본 이미지 비율 유지 */
  padding: 1rem;
  background-color: #f0f0f0;
}

.room-info {
  padding: 0.5rem;
  /* 패딩을 조금 줄임 */
  display: flex;
  flex-direction: column;
}

.room-tags {
  display: flex;
  justify-content: center;
  gap: 0.3rem;
  flex-wrap: wrap;
}

.room-tag {
  font-size: 0.75rem;
  /* 태그 글꼴 크기 줄이기 */
  color: #555;
  background-color: #ecf0f1;
  padding: 0.1rem 0.3rem;
  border-radius: 4px;
}

.room-title {
  font-size: 0.9rem;
  font-weight: bold;
  margin: 0.3rem 0;
  color: #333;
}

.room-content {
  font-size: 0.9rem;
  /* 내용 크기 감소 */
  line-height: 1.3;
}

.room-meta {
  font-size: 0.8rem;
  /* 메타 정보 크기 감소 */
}

.room-meta span {
  background-color: #ecf0f1;
  padding: 0.2rem 0.5rem;
  border-radius: 4px;
}

@media (max-width: 768px) {
  .room-grid {
    grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
    /* 작은 화면에서는 최소 100px로 조정 */
    gap: 0.8rem;
  }

  .room-image-container {
    height: 100px;
    /* 모바일에서 이미지 크기 줄이기 */
  }

  .room-title {
    font-size: 0.8rem;
  }

  .room-tag {
    font-size: 0.7rem;
    padding: 0.1rem 0.2rem;
  }
}

.search-container {
  display: flex;
  flex-wrap: wrap;
  gap: 2px;
  margin-bottom: 30px;
  padding: 20px;
  background-color: #f8f9fa;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.search-input-wrapper,
.select-wrapper {
  flex: 1;
  min-width: 150px;
  position: relative;
}

.search-input {
  width: 84%;
  padding: 12px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  font-size: 16px;
  transition: border-color 0.3s;

}

.search-select {
  width: 95%;
  padding: 12px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  font-size: 16px;
  transition: border-color 0.3s;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-color: white;
}

.search-input:focus,
.search-select:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.select-wrapper::after {
  content: '';
  position: absolute;
  right: 30px;
  top: 50%;
  transform: translateY(-50%);
  width: 0;
  height: 0;
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid #000;
  pointer-events: none;
}

.search-icon {
  position: absolute;
  right: 12px;
  top: 50%;
  transform: translateY(-50%);
  color: #6c757d;
  pointer-events: none;
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