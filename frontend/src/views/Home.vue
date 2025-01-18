<template>
  <div class="home">
    <main class="main-content">
      <hero-section />
      <user-pin />
      <high-view-count :highViewCount="highViewCount" />
      <recent-posts-main :recentPosts="recentPosts" />
    </main>
  </div>
</template>

<script>
import axios from 'axios';
import HeroSection from '@/components/HeroSection.vue';
import UserPin from '@/components/UserPin.vue';
import HighViewCount from '@/components/HighViewCount.vue';
import RecentPostsMain from '@/components/RecentPostsMain.vue';

export default {
  name: 'Home',
  components: {
    HeroSection,
    HighViewCount,
    RecentPostsMain,
    UserPin,
  },
  data() {
    return {
      highViewCount: [],
      recentPosts: [],
    };
  },
  async mounted() {
    try {
      const response = await axios.get('/api/main/list'); // API 요청
      const data = response.data; // 응답 데이터
      console.log('API 응답 데이터:', response.data); // 응답 데이터 확인
      // 응답 데이터에서 필요한 정보를 추출하여 Vue 인스턴스의 데이터에 할당합니다
      this.highViewCount = data.highViewCount || [];
      this.recentPosts = data.recentPosts || [];
    } catch (error) {
      console.error('데이터를 가져오는 중 오류가 발생했습니다:', error); // 에러 처리
    }
  },
};
</script>

<style scoped>
.home {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 30vh;
  font-family: 'Arial', sans-serif;
  color: #333;
  background-color: #f5f5f5;
}

.main-content {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
  background-color: white;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
</style>
