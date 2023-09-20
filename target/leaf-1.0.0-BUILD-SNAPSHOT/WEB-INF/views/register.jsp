<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false).getAttribute('id')==null ? '' : pageContext.request.getSession(false).getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<c:set var="signInUserInfoLink" value="${loginId=='' ? '/add' : '/userCheck'}"/>
<c:set var="signInUserInfo" value="${loginId=='' ? 'Sign in' : 'MyPage'}"/>
<c:set var="addOrModLink" value="${loginId=='' ? '/add' : '/myPage'}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- SEO -->
  <title>Leaf</title>
  <meta name="description" content="Leaf"/>
  <meta name="author" content="Park"/>
  <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>" type="image/x-icon">

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
  <%--  <script type="module" src="<c:url value='/js/main.js'/>" defer></script>--%>
  <%--  <script type="module" src="<c:url value='/js/projects.js'/>" defer></script>--%>
  <%--  <script type="module" src="<c:url value='/js/type.js'/>" defer></script>--%>
  <!--  jQuery-->
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<!-- Header -->
<header class="header">
  <div class="header__logo">
    <!-- <i class="fa-solid fa-leaf fa-2xl header__logo__img" style="color: #74b573;"></i> -->
    <img src="<c:url value='/images/favicon.ico'/>" alt="Logo" class="header__logo__img">
    <h1 class="header__logo__title"><a href="<c:url value='/'/>"> <strong class="header__logo__title">Leaf</strong></a>
    </h1>
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
<!-- main-->
<main>
<!-- register -->
<section id="home">
  <!-- <i class="fa-solid fa-leaf fa-2xl home__logo" style="color: #74b573;"></i> -->
  <div class="home__container">
    <script>
        let msg = "${msg}";
        if (msg == "REG_ERR") alert("회원가입에 실패했습니다. 다시 시도해주세요.");
    </script>
    <h2 class="home__title"> Leaf</h2>
    <form action="<c:url value="${addOrModLink}"/>" method="post">
      <div class="login">
        <input type="text" name="id" id="id"  autocomplete="off" value="${userDto.id}" placeholder="공백없이 5자 이상"  ${mode=="mod" ? 'readonly="readonly"' : ''}> <label for="id">USER
        ID</label>
      </div>
      <div class="login">
        <input type="text" name="pwd" id="pwd" autocomplete="off" value="${userDto.pwd}" placeholder="공백없이 5자 이상"><label
              for="pwd">PASSWORD</label>
      </div>
      <div class="login">
        <input type="text" name="name" id="name" autocomplete="off" value="${userDto.name}" placeholder="ex)leaf"><label
              for="name">NAME</label>
      </div>
      <div class="login">
        <input type="text" name="email" id="email" autocomplete="off" value="${userDto.email}" placeholder="ex)leaf@leaf.com"><label
              for="email">EMAIL</label>
      </div>
      <div class="login">
        <input type="text" name="phone" id="phone" autocomplete="off" value="${userDto.phone}" placeholder="ex)01011111111"><label
              for="phone">PHONE</label>
      </div>
      <button type="submit">${mode=="mod" ? "회원정보수정" : "회원가입" }</button>
    </form>
  </div>
</section>
</main>
<!-- Footer -->
<footer id="contact" class="section">
  <div class="max-container">
    <h2>Contact</h2>
    <p>sun930325@gmail.com</p>
    <ul class="contact__links">
      <li>
        <a class="contact__link" href="https://github.com/parksunovo" title="github link" target="_blank"><i
                class="fa-brands fa-github"></i></a>
      </li>
    </ul>
    <p>©Park</p>
  </div>
</footer>
</body>
</html>
