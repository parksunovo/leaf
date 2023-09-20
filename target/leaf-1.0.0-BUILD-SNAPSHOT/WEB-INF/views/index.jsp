
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false).getAttribute('id')==null ? '' : pageContext.request.getSession(false).getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<c:set var="signInUserInfoLink" value="${loginId=='' ? '/add' : '/userCheck'}"/>
<c:set var="signInUserInfo" value="${loginId=='' ? 'Sign in' : 'MyPage'}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- SEO -->
  <title>Leaf</title>
  <meta name="description" content="Leaf"/>
  <meta name="author" content="Park"/>
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

  <!-- OG - (Open Graph Data) -->
  <meta property="og:title" content="Test Portfolio"/>
  <meta property="og:type" content="website"/>
  <meta property="og:url" content="배포후 생성 "/>
  <meta property="og:" content="배포후 생성"/>
  <!-- Google Font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <!-- Font Awesome -->
  <script src="https://kit.fontawesome.com/e7f1cd1d91.js" crossorigin="anonymous"></script>
  <!-- Typeit -->
  <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
  <!-- Javascript -->
  <script type="module" src="<c:url value='/js/main.js'/>" defer></script>
  <script type="module" src="<c:url value='/js/type.js'/>" defer></script>
</head>
<body>
<!-- Header -->
<header class="header">
  <div class="header__logo">
    <!-- <i class="fa-solid fa-leaf fa-2xl header__logo__img" style="color: #74b573;"></i> -->
    <img src="images/favicon.ico" alt="Logo" class="header__logo__img">
    <h1 class="header__logo__title"><a href="<c:url value='/'/>"> <strong class="header__logo__title">Leaf</strong></a></h1>
  </div>
  <nav class="header__nav">
    <ul class="header__menu">
      <li><a class="header__menu__item active" href="<c:url value='/'/>">Leaf</a></li>
      <li><a class="header__menu__item" href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
      <li><a class="header__menu__item" href="<c:url value='${signInUserInfoLink}'/>">${signInUserInfo}</a></li>
      <li><a class="header__menu__item" href="<c:url value='/board/list'/>">Board</a></li>
      <li><a class="header__menu__item" href="#search">Search</a></li>
      <!-- NightMode cookie에 attribute 추가 -->
      <li><a class="header__menu__item" href=""><i class="fa-solid fa-moon" style="color: #6b7e9e;"></i></a></li>
    </ul>
  </nav>
  <button class="header__toggle" aria-label="navigation menu toggle">
    <i class="fa-solid fa-bars" style="color: #309744;"></i>
  </button>
</header>
<!-- Main -->
<main>
  <!-- Home -->
  <section id="homeM">
    <!-- <i class="fa-solid fa-leaf fa-2xl home__logo" style="color: #74b573;"></i> -->
    <div class="home__container">
      <img src="images/favicon.ico" alt="">
      <h2 class="home__title"> Leaf</h2>
      <p class="home__description"><Strong class="home__title--strong">Leaf</Strong> 는 누구나 자유롭게 생각을 공유할 수 있는 웹기반 sns입니다.</p>
      <a class="home__contact" href="#contact">Contact</a>
    </div>
    <script>
        let msg = "${msg}";
        if (msg=="REG_OK") alert("회원가입 성공 !")
    </script>
  </section>
  <!-- About -->
  <section id="about">
    <div class="section max-container">
      <h2 class="title">About <strong class="about__logo">Leaf</strong></h2>
      <p class="description">leaf 개발에 사용한 기술 스택을 정리해봤습니다.</p>
      <ul class="majors">
        <li class="major">
          <i class="fa-brands fa-html5 major__icon"></i>
          <p class="major__title">Front-end</p>
          <p class="major__content">HTML, CSS, Javascript Es6, Jquery</p>
        </li>
        <li class="major">
          <i class="fa-solid fa-server major__icon"></i>
          <p class="major__title">Back-end</p>
          <p class="major__content">Java,&nbsp;SpringFrameWork,&nbsp;SpringBoot</p>
        </li>
        <li class="major">
          <i class="fa-solid fa-layer-group major__icon"></i>
          <p class="major__title">Server</p>
          <p class="major__content">&nbsp;&nbsp;Tomcat9.0,&nbsp;MySQL,&nbsp;AWS,&nbsp;MyBatis&nbsp;</p>
        </li>
      </ul>
    </div>
  </section>
  <!-- Skills -->
  <section id="skills" class="section">
    <div class="max-container">
      <h2 class="title">My Skills</h2>
      <p class="description">제가 사용가능한 기술 스택들입니다.</p>
      <p></p>
      <div class="skills">
        <section class="skills__coding">
          <h3 class="skills__title">Coding Skills</h3>
          <ul>
            <li class="bar">
              <div class="bar__metadata"><span>HTML</span><span></span></div>
              <div class="bar__bg"><div class="bar__value"></div></div>
            </li>
            <li class="bar">
              <div class="bar__metadata"><span>CSS</span><span></span></div>
              <div class="bar__bg"><div class="bar__value"></div></div>
            </li>
            <li class="bar">
              <div class="bar__metadata"><span>Javascript</span><span></span></div>
              <div class="bar__bg"><div class="bar__value"></div></div>
            </li>
            <li class="bar">
              <div class="bar__metadata"><span>Java</span><span></span></div>
              <div class="bar__bg"><div class="bar__value"></div></div>
            </li>
            <li class="bar">
              <div class="bar__metadata"><span>Spring</span><span></span></div>
              <div class="bar__bg"><div class="bar__value"></div></div>
            </li>
            <li class="bar">
              <div class="bar__metadata"><span>Springboot</span><span>학습중</span></div>
              <div class="bar__bg"><div class="bar__value" style="width: 70%"></div></div>
            </li>
          </ul>
        </section>
        <section class="skills__tools">
          <h3 class="skills__title">Tools</h3>
          <ul>
            <li>Visual Studio Code</li>
            <li>Eclipse</li>
            <li>IntelliJ</li>
            <li>DBeaver</li>
            <li>MySQL Workbench</li>
          </ul>
        </section>
        <section class="skills__etc">
          <h3 class="skills__title">Etc</h3>
          <ul>
            <li>Git</li>
            <li>AWS</li>
            <li>MySQL</li>
          </ul>
        </section>
      </div>
  </section>
  <!-- Work -->
  <section id="work" class="section">
    <div class="max-container">
      <h2 class="title">업데이트 내역()</h2>
      <p class="description"></p>
      <ul class="categories">
        <li><button class="category">All<span class="category__count">8</span></button></li>
        <li><button class="category">Front-end<span class="category__count"></span></button></li>
        <li><button class="category">Back-end<span class="category__count"></span></button></li>
      </ul>
      <ul class="projects">
        <li class="project"><a href="#" target="_blank">
          <img src="images/projects/project1.webp" alt="Sample" class="project__img">
          <div class="project__metadata">
            <h3 class="project__title">Project Sample</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta, possimus.</p>
          </div>
        </a></li>
        <li class="project"><a href="#" target="_blank">
          <img src="images/projects/project1.webp" alt="Sample" class="project__img">
          <div class="project__metadata">
            <h3 class="project__title">Project Sample</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta, possimus.</p>
          </div>
        </a></li>
        <li class="project"><a href="#" target="_blank">
          <img src="images/projects/project1.webp" alt="Sample" class="project__img">
          <div class="project__metadata">
            <h3 class="project__title">Project Sample</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta, possimus.</p>
          </div>
        </a></li>
        <li class="project"><a href="#" target="_blank">
          <img src="images/projects/project1.webp" alt="Sample" class="project__img">
          <div class="project__metadata">
            <h3 class="project__title">Project Sample</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta, possimus.</p>
          </div>
        </a></li>
        <li class="project"><a href="#" target="_blank">
          <img src="images/projects/project1.webp" alt="Sample" class="project__img">
          <div class="project__metadata">
            <h3 class="project__title">Project Sample</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta, possimus.</p>
          </div>
        </a></li>
      </ul>
    </div>
    </div>
    </div>
  </section>
  <!-- Etc -->
  <!-- <section id="etc"></section> -->
  <!-- Arrow up -->
  <aside>
    <a class="arrow-up" href="#" title="back to top"><i class="fa-solid fa-arrow-up"></i></a>
  </aside>
</main>
<!-- Footer -->
<footer id="contact" class="section">
  <div class="max-container">
    <h2>Contact</h2>
    <p>sun930325@gmail.com</p>
    <ul class="contact__links">
      <li>
        <a class="contact__link" href="https://github.com/parksunovo" title="github link" target="_blank"><i class="fa-brands fa-github"></i></a>
      </li>
    </ul>
    <p>©Park</p>
  </div>
</footer>
</body>
</html>
