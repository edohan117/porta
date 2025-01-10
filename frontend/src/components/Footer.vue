<template>
  <footer class="footer">
    <div class="footer-content">
      <div class="footer-section brand">
        <h3>Fuse</h3>
        <p>혁신적인 아이디어의 온상</p>
        <p>Fuse에서 여러분의 창의력을 펼쳐보세요.</p>
      </div>
      <div class="footer-section links">
        <h3>빠른 링크</h3>
        <ul>
          <li><a href="/sitemap">사이트맵</a></li>
          <li><a href="/terms">이용 약관</a></li>
          <li><a href="/privacy">개인정보 처리방침</a></li>
          <li><a href="/support">고객 지원2</a></li>
        </ul>
      </div>
      <div class="footer-section social">
        <h3>소셜 미디어</h3>
        <div class="social-icons">
          <a href="https://www.instagram.com/inno_nest_dohan/" aria-label="Instagram" target="_blank"
            rel="noopener noreferrer">
            <i class="bi bi-instagram"></i>
          </a>
          <a href="https://twitter.com/" aria-label="Twitter" target="_blank" rel="noopener noreferrer">
            <i class="bi bi-twitter"></i>
          </a>
          <a href="https://www.facebook.com/" aria-label="Facebook" target="_blank" rel="noopener noreferrer">
            <i class="bi bi-facebook"></i>
          </a>
          <a href="https://www.youtube.com/" aria-label="Youtube" target="_blank" rel="noopener noreferrer">
            <i class="bi bi-youtube"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; 2024 Fuse. All rights reserved.</p>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'Footer',
};
</script>

<style scoped>
.footer {
  background-color: #1a1a2e;
  color: #fff;
  padding: 4rem 0 2rem;
  font-family: 'Arial', sans-serif;
}

.footer-content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.footer-section {
  flex: 1;
  margin-bottom: 2rem;
  min-width: 200px;
}

.footer-section h3 {
  color: #4ecca3;
  margin-bottom: 1.5rem;
  font-size: 1.2rem;
  font-weight: bold;
}

.footer-section.brand h3 {
  font-size: 2rem;
  margin-bottom: 0.5rem;
}

.footer-section.brand p {
  color: #bbb;
  font-size: 0.9rem;
}

.footer-section ul {
  list-style-type: none;
  padding: 0;
}

.footer-section ul li {
  margin-bottom: 0.8rem;
}

.footer-section a {
  color: #fff;
  text-decoration: none;
  transition: color 0.3s ease;
}

.footer-section a:hover {
  color: #4ecca3;
}

.social-icons {
  display: flex;
  gap: 1rem;
}

.social-icons a {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  background-color: #2c2c44;
  border-radius: 50%;
  transition: all 0.3s ease;
}

.social-icons a:hover {
  background-color: #4ecca3;
  transform: translateY(-3px);
}

.social-icons i {
  font-size: 1.2rem;
}

.footer-bottom {
  text-align: center;
  margin-top: 3rem;
  padding-top: 2rem;
  border-top: 1px solid #2c2c44;
  font-size: 0.9rem;
  color: #bbb;
}

.footer-section.contact p {
  display: flex;
  align-items: center;
  margin-bottom: 0.8rem;
}

.footer-section.contact i {
  margin-right: 10px;
  color: #4ecca3;
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
  }

  .footer-section {
    margin-bottom: 2rem;
  }
}
</style>