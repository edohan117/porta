<template>
  <header :class="['header', { 'scrolled': isScrolled }]">
    <div class="container">
      <div class="logo">
        <router-link to="/" class="logo-link">Fuse ESCAPE</router-link>
      </div>
      <nav class="nav">
        <!-- 드롭다운 -->
        <div class="dropdown">
          <span 
            class="nav-link dropdown-toggle" 
            @click="toggleDropdown"
          >
            카테고리
          </span>
          <!-- 드롭다운 메뉴 -->
          <ul 
            class="dropdown-menu" 
            v-if="dropdownOpen"
          >
            <li><router-link to="/category/news" class="dropdown-item" @click="closeDropdown">뉴스</router-link></li>
            <li><router-link to="/category/shopping" class="dropdown-item" @click="closeDropdown">쇼핑</router-link></li>
            <li><router-link to="/category/entertainment" class="dropdown-item" @click="closeDropdown">엔터테인먼트</router-link></li>
            <li><router-link to="/category/learning" class="dropdown-item" @click="closeDropdown">학습 자료</router-link></li>
          </ul>
        </div>
        <router-link to="/roomList" class="nav-link">추천</router-link>
        <router-link to="/roomRank" class="nav-link">즐겨찾기</router-link>
        <router-link to="/noticeList" class="nav-link">공지사항</router-link>
        <router-link to="/inquiries" class="nav-link">문의하기</router-link>
        <div v-if="roleAdmin">
          <router-link to="/inquiriesList" class="nav-link">문의목록</router-link>
        </div>
      </nav>
      <div class="search-bar">
        <input
          type="text"
          v-model="searchQuery"
          placeholder="검색어를 입력하세요"
          class="search-input"
          @keyup.enter="handleSearch"
        />
        <button @click="handleSearch" class="btn-search">검색</button>
      </div>
      <div class="auth">
        <div v-if="isLoggedIn && user && user.id" class="user-profile" @click="toggleProfileMenu">
          <span class="sessionId">{{ user.nickname }} 님</span>
          <div v-if="profileMenuOpen" class="profile-menu">
            <router-link to="/myProfile" @click="closeMenu" class="profile-menu-link">Profile</router-link>
            <router-link to="/myLikes" @click="closeMenu" class="profile-menu-link">MyLikes</router-link>
            <router-link to="/myRecords" @click="closeMenu" class="profile-menu-link">MyRecords</router-link>
            <router-link v-if="roleAdmin" to="/memberList" class="profile-menu-link">Member</router-link>
          </div>
        </div>
        <button v-if="!isLoggedIn" @click="goToLogin" class="btn btn-login">Login</button>
        <button v-else @click="logoutAndCloseMenu" class="btn btn-logout">Logout</button>
      </div>
      <button class="menu-toggle" @click="toggleMenu" aria-label="Toggle menu" :aria-expanded="isMenuOpen">
        <span class="menu-icon"></span>
      </button>
    </div>
    <div class="mobile-menu" :class="{ 'is-active': isMenuOpen }">
      <router-link to="/newThemeList" class="mobile-nav-link" @click="closeMenu">신규테마</router-link>
      <router-link to="/rcmdThemeList" class="mobile-nav-link" @click="closeMenu">추천테마</router-link>
      <router-link to="/roomList" class="mobile-nav-link" @click="closeMenu">LIST♤</router-link>
      <router-link to="/roomRank" class="mobile-nav-link" @click="closeMenu">RANK♧</router-link>
      <router-link to="/noticeList" class="mobile-nav-link" @click="closeMenu">공지사항</router-link>
      <router-link to="/myProfile" class="mobile-nav-link" @click="closeMenu">Profile</router-link>
      <router-link v-if="roleAdmin" to="/memberList" class="mobile-nav-link" @click="closeMenu">Member</router-link>
    </div>
  </header>
</template>

<script>
import { computed, ref, onMounted, onUnmounted } from 'vue';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';

export default {
  name: 'Header',
  emits: ['search'],
  setup() {
    const store = useStore();
    const router = useRouter();
    
    const isLoggedIn = computed(() => store.getters.isAuthenticated);
    const user = computed(() => store.getters.user);
    const role = computed(() => store.getters.role);
    
    const isMenuOpen = ref(false);
    const profileMenuOpen = ref(false);
    const isScrolled = ref(false);
    const dropdownOpen = ref(false);
    const searchQuery = ref('');

    // 드롭다운 메뉴를 보여줌
    const showDropdown = () => {
      dropdownOpen.value = true;
    };

    // 드롭다운 메뉴를 숨김
    const hideDropdown = () => {
      dropdownOpen.value = false;
    };

    // 드롭다운 유지
    const keepDropdown = () => {
      dropdownOpen.value = true;
    };

    const goToLogin = () => {
      router.push('/loginForm');
    };

    const goToLoginMobile = () => {
      router.push('/loginForm');
      closeMenu();
    };

    const logout = async () => {
      await store.dispatch('logout');
      router.push('/');
    };

    const logoutAndCloseMenu = async () => {
      await logout();
      closeMenu();
    };

    const toggleMenu = () => {
      isMenuOpen.value = !isMenuOpen.value;
    };

    const closeMenu = () => {
      isMenuOpen.value = false;
      profileMenuOpen.value = false;
    };

    const toggleProfileMenu = () => {
      profileMenuOpen.value = !profileMenuOpen.value;
    };

    const closeDropdown = () => {
      dropdownOpen.value = false;
    };

    const handleScroll = () => {
      isScrolled.value = window.scrollY > 50;
    };

    onMounted(() => {
      window.addEventListener('click', handleClickOutside);
      window.addEventListener('scroll', handleScroll);
    });

    onUnmounted(() => {
      window.removeEventListener('click', handleClickOutside);
      window.removeEventListener('scroll', handleScroll);
    });
    
    const toggleDropdown = () => {
    dropdownOpen.value = !dropdownOpen.value;
    };

    const handleClickOutside = (event) => {
      const dropdownElement = document.querySelector('.dropdown');
      if (dropdownElement && !dropdownElement.contains(event.target)) {
        dropdownOpen.value = false;
      }
    };

    const handleSearch = () => {
      if (searchQuery.value.trim()) {
        router.push({ path: '/search', query: { q: searchQuery.value } });
        searchQuery.value = ''; // 검색창 초기화
      }
    };
    return {
      closeDropdown,
      showDropdown,
      hideDropdown,
      dropdownOpen,
      keepDropdown,
      toggleDropdown,
      searchQuery,
      handleSearch,
      isLoggedIn,
      user,
      role,
      goToLogin,
      goToLoginMobile,
      logoutAndCloseMenu,
      isMenuOpen,
      toggleMenu,
      closeMenu,
      toggleProfileMenu,
      profileMenuOpen,
      isScrolled,
    };
  },
  computed: {
    roleAdmin() {
      return this.role === 'ADMIN';
    }
  },
};
</script>

<style scoped>
.header {
  background-color: #333;
  color: #fff;
  padding: 1rem;
  position: sticky;
  top: 0;
  width: 100%;
  z-index: 1000;
  transition: background-color 0.3s;
}

.header.scrolled {
  background-color: #222;
}

.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
}

.logo-link {
  font-size: 1.5rem;
  font-weight: bold;
  color: #fff;
  text-decoration: none;
}

.nav {
  display: flex;
  gap: 1rem;
}

.nav-link {
  color: #fff;
  text-decoration: none;
  transition: color 0.3s ease;
}

.nav-link:hover {
  color: #f39c12;
}

.auth {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.user-profile {
  position: relative;
  cursor: pointer;
  white-space: nowrap;
}

.profile-menu {
  display: none;
  position: absolute;
  top: 100%;
  right: 0;
  background-color: #333;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
  border-radius: 4px;
}

.profile-menu-link {
  color: #fff;
  text-decoration: none;
  display: block;
  padding: 0.5rem 1rem;
  white-space: nowrap;
  /* 이 속성을 추가하여 텍스트가 한 줄에 나오도록 강제합니다 */
  overflow: hidden;
  text-overflow: ellipsis;
}

.profile-menu-link:hover {
  background-color: #444;
}

.profile-menu-link:last-of-type {
  border-top: 1px solid #444;
}

.user-profile:hover .profile-menu {
  display: block;
}

.btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 4px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn-login {
  background-color: #3498db;
  color: #fff;
}

.btn-login:hover {
  background-color: #2980b9;
}

.btn-logout {
  background-color: #e74c3c;
  color: #fff;
}

.btn-logout:hover {
  background-color: #c0392b;
}

.menu-toggle {
  display: none;
  background: none;
  border: none;
  cursor: pointer;
}

.menu-icon {
  width: 25px;
  height: 2px;
  background-color: #fff;
  position: relative;
  transition: background-color 0.3s ease;
}

.menu-icon::before,
.menu-icon::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 2px;
  background-color: #fff;
  transition: transform 0.3s ease;
}

.menu-icon::before {
  top: -8px;
}

.menu-icon::after {
  bottom: -8px;
}

.mobile-menu {
  display: none;
  flex-direction: column;
  background-color: #333;
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  padding: 1rem;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s ease;
  transform: translateY(-100%);
}

.mobile-menu.is-active {
  display: flex;
  transform: translateY(0);
}

.mobile-nav-link {
  color: #fff;
  text-decoration: none;
  padding: 0.5rem 0;
  font-size: 1.2rem;
}

.mobile-nav-link:hover {
  color: #f39c12;
}

@media (max-width: 768px) {
  .nav {
    display: none;
  }

  .menu-toggle {
    display: block;
  }
}

.auth .sessionId {
  white-space: nowrap;
  /* 사용자 이름도 두 줄로 나오지 않게 설정 */
  overflow: hidden;
  /* 텍스트가 컨테이너를 넘지 않도록 설정 */
  text-overflow: ellipsis;
  /* 필요 시 말줄임표 표시 */
}

/* 드롭다운 메뉴 스타일 */
/* 드롭다운 스타일 */
.dropdown {
  position: relative;
}

.dropdown-toggle {
  cursor: pointer;
  color: #fff;
  text-decoration: none;
}

.dropdown-menu {
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #333;
  border: 1px solid #444;
  border-radius: 4px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  display: flex;
  flex-direction: column; /* 세로 정렬 */
  width: 200px; /* 적당한 넓이 설정 */
}

.dropdown-item {
  padding: 0.5rem 1rem; /* 상하 간격과 좌우 여백 설정 */
  color: #fff;
  text-decoration: none;
  transition: background-color 0.3s ease;
  white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.dropdown-item:hover {
  background-color: #444;
}

/* 드롭다운 메뉴 안의 텍스트를 중앙 정렬 */
.dropdown-item {
  text-align: left; /* 텍스트가 자연스럽게 좌측 정렬되도록 설정 */
  display: block; /* 블록 레벨 요소로 변경 */
}

/* 드롭다운 메뉴 간격 조정 */
.dropdown-item:not(:last-child) {
  border-bottom: 1px solid #444; /* 메뉴 항목 구분선 추가 */
}

/* 검색창 스타일 */
.search-bar {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.search-input {
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.btn-search {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 4px;
  background-color: #3498db;
  color: #fff;
  cursor: pointer;
}

.btn-search:hover {
  background-color: #2980b9;
}


</style>
