import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/Home.vue';
import LoginForm from '@/views/LoginPage.vue';
import RoomList from '@/views/RoomList.vue';
import MyLikes from '@/views/MyLikes.vue';
import MyRecords from '@/views/MyRecords.vue';
import RoomSubmit from '@/views/RoomSubmit.vue';
import RoomDetail from '@/views/RoomDetail.vue';
import RoomEdit from '@/views/RoomEdit.vue';
import RcmdThemeList from '@/views/RcmdThemeList.vue';
import RoomRank from '@/views/RoomRank.vue';
import NoticeList from '@/views/NoticeList.vue';
import NoticeDetail from '@/views/NoticeDetail.vue';
import NoticeEdit from '@/views/NoticeEdit.vue';
import NoticeCreate from '@/views/NoticeCreate.vue';
import Register from '@/views/RegisterPage.vue';
import MemberList from '@/views/MemberList.vue';
import MyProfile from '@/views/MyProfile.vue';
import Inquiries from '@/views/Inquiries.vue';
import RoomReviews from '@/views/RoomReviews.vue';

const routes = [
  { path: '/', name: 'Home', component: Home, meta: { title: 'Porta' } },
  { path: '/loginForm', name: 'LoginForm', component: LoginForm, meta: { title: '로그인' } },
  { path: '/roomList', name: 'RoomList', component: RoomList, meta: { title: '방탈출 목록' } },
  { path: '/myLikes', name: 'MyLikes', component: MyLikes, meta: { title: '나의 좋아요' } },
  { path: '/myRecords', name: 'MyRecords', component: MyRecords, meta: { title: '나의 기록' } },
  { path: '/roomSubmit', name: 'RoomSubmit', component: RoomSubmit, meta: { requiresAuth: true, admin: true, title: '방탈출 정보 등록' } },
  { path: '/roomDetail/:id', name: 'RoomDetail', component: RoomDetail, meta: { title: '방탈출 상세 정보' } },
  { path: '/roomEdit/:id', name: 'RoomEdit', component: RoomEdit, meta: { requiresAuth: true, admin: true, title: '방탈출 정보 수정' } },
  { path: '/roomRank', name: 'RoomRank', component: RoomRank, meta: { title: '방탈출 평점 순위' } },
  { path: '/rcmdThemeList', name: 'RcmdThemeList', component: RcmdThemeList, meta: { title: '추천/신규 테마 목록' } },
  { path: '/noticeList', name: 'NoticeList', component: NoticeList, meta: { title: '공지 목록' } },
  { path: '/noticeDetail/:id', name: 'NoticeDetail', component: NoticeDetail, meta: { title: '공지 상세 정보' } },
  { path: '/noticeEdit/:id', name: 'NoticeEdit', component: NoticeEdit, meta: { requiresAuth: true, admin: true, title: '공지 수정' } },
  { path: '/noticeCreate', name: 'NoticeCreate', component: NoticeCreate, meta: { requiresAuth: true, admin: true, title: '공지 등록' } },
  { path: '/register', name: 'Register', component: Register, meta: { title: '회원가입' } },
  { path: '/memberList', name: 'MemberList', component: MemberList, meta: { requiresAuth: true, admin: true, title: '회원 목록' } },
  { path: '/myProfile', name: 'MyProfile', component: MyProfile, meta: { title: '내 프로필' } },
  { path: '/inquiries', name: 'Inquiries', component: Inquiries, meta: { requiresAuth: true, admin: false, title: '문의하기' }},
  { path: '/room/:id/reviews', name: 'RoomReviews', component: RoomReviews, meta: { title: '리뷰 목록' } },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

router.afterEach((to) => {
  document.title = to.meta.title || '기본 제목'; // 기본 제목을 설정
});

router.beforeEach((to, from, next) => {
  const user = JSON.parse(sessionStorage.getItem('user'));
  const isAuthenticated = !!user;
  const role = sessionStorage.getItem('role');

  // 이전 경로 저장
  if (to.meta.requiresAuth) {
    to.meta.previous = from.fullPath; 
  }

  if (to.meta.requiresAuth && !isAuthenticated) {
    console.log(to.meta.requiresAuth);
    next('/loginForm'); 
  } else if (to.meta.admin && role !== 'ADMIN') {
    alert('접근할 수 있는 권한이 아닙니다'); 
    next('/'); 
  } else {
    next();
  }
});

export default router;
