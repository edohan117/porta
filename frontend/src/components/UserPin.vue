<template>
  <section class="hero" :style="{ backgroundImage: 'url(' + slides[currentSlide].background + ')' }">
    <div class="arrow left" @click="prevSlide">&#10094;</div>
    <div v-for="(slide, index) in slides" :key="index" v-show="currentSlide === index" class="slide">
      <h2>{{ slide.title }}</h2>
      <p>{{ slide.description }}</p>
      <a href="#" @click.prevent="checkLoginAndNavigate(slide.buttonLink)" class="cta-button">{{ slide.buttonText }}</a>
    </div>
    <div class="arrow right" @click="nextSlide">&#10095;</div>
  </section>
</template>

<script>
import { computed, onMounted, ref } from 'vue';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';

export default {
  name: 'HeroSection',
  setup() {
    const store = useStore();
    const router = useRouter();

    const isLoggedIn = computed(() => store.getters.isAuthenticated);
    const checkLoginAndNavigate = (path) => {
      if (!isLoggedIn.value) {
        router.push('/loginForm');
      } else {
        router.push(path);
      }
    };

    const slides = ref([
      {
        title: '여기가 바로 포르다',
        description: 'Share your innovative ideas and connect with like-minded individuals',
        buttonText: 'Start Sharing',
        buttonLink: '/newThemeList',
        background: require('@/img/image_01.jpg'),
      },
      {
        title: '여기가 바로 포르다',
        description: 'Collaborate with a community of thinkers and creators',
        buttonText: 'Join Us',
        buttonLink: '/roomList',
        background: require('@/img/image_02.jpg'),
      },
      {
        title: '여기가 바로 포르다',
        description: 'Turn your dreams into reality with our platform',
        buttonText: 'Get Started',
        buttonLink: '/noticeList',
        background: require('@/img/image_03.jpg'),
      },
    ]);

    const currentSlide = ref(0);

    const nextSlide = () => {
      currentSlide.value = (currentSlide.value + 1) % slides.value.length;
    };

    const prevSlide = () => {
      currentSlide.value = (currentSlide.value - 1 + slides.value.length) % slides.value.length;
    };

    onMounted(() => {
      setInterval(nextSlide, 5000); // 5초마다 슬라이드 자동 전환
    });

    return {
      checkLoginAndNavigate,
      slides,
      currentSlide,
      nextSlide,
      prevSlide,
    };
  },
};
</script>

<style scoped>
.hero {
  position: relative;
  margin-top: 30px;
  /* 추가된 여백 */
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  width: 100%;
  height: 30vh;
  color: #fff;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border-radius: 20px;
  overflow: hidden;
  transition: background-image 1s ease;
}

.slide {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 2rem;
  /* 내부 패딩 조정 */
}

h2 {
  font-size: 2.2rem;
  /* 제목 크기를 약간 키움 */
  margin-bottom: 1rem;
}

p {
  font-size: 1.1rem;
  /* 본문 크기를 약간 키움 */
  margin-bottom: 2rem;
}

.cta-button {
  background-color: #fff;
  color: #3498db;
  border: none;
  padding: 1rem 2rem;
  font-size: 1.2rem;
  font-weight: bold;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;
  text-decoration: none;
  text-shadow: none;
  /* 버튼은 그림자 없음 */
}

.cta-button:hover {
  background-color: #2980b9;
  color: #fff;
}

/* 슬라이드 컨트롤 버튼 */
.arrow {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  font-size: 2rem;
  color: #fff;
  cursor: pointer;
  user-select: none;
  /* 선택 방지 */
  z-index: 1;
  /* 화살표 버튼을 위에 표시 */
}

.arrow.left {
  left: 40px;
  /* 왼쪽 화살표 위치 */
}

.arrow.right {
  right: 40px;
  /* 오른쪽 화살표 위치 */
}

/* 반응형 디자인 설정 */
@media (max-width: 768px) {
  .hero {
    padding: 2rem 1.5rem;
    /* 패딩 조정 */
    height: 50vh;
    /* 높이 줄이기 */
  }

  h2 {
    font-size: 1.8rem;
    /* 제목 크기 조정 */
  }

  p {
    font-size: 1rem;
    /* 본문 크기 조정 */
  }

  .cta-button {
    padding: 0.5rem 1rem;
    /* 버튼 패딩 조정 */
    font-size: 0.9rem;
    /* 버튼 글자 크기 조정 */
  }
}

@media (max-width: 480px) {
  .hero {
    padding: 2rem 1rem;
    height: 40vh;
    /* 높이 줄이기 */
  }

  h2 {
    font-size: 1.5rem;
    /* 제목 크기 조정 */
  }

  p {
    font-size: 0.9rem;
    /* 본문 크기 조정 */
  }

  .cta-button {
    padding: 0.5rem 0.75rem;
    /* 버튼 패딩 조정 */
    font-size: 0.8rem;
    /* 버튼 글자 크기 조정 */
  }
}
</style>
