<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true" %>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'logout'}"/>
<c:set var="signInUserInfoLink" value="${loginId=='' ? '/add' : '/userCheck'}"/>
<c:set var="signInUserInfo" value="${loginId=='' ? 'Sign in' : 'MyPage'}"/>
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
  <script type="module" src="<c:url value='/js/main.js'/>" defer></script>
  <script type="module" src="<c:url value='/js/type.js'/>" defer></script>
  <!--  jQuery-->
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<!-- Header -->
<header class="header">
  <div class="header__logo">
    <!-- <i class="fa-solid fa-leaf fa-2xl header__logo__img" style="color: #74b573;"></i> -->
    <img src="<c:url value='/images/favicon.ico'/>" alt="Logo" class="header__logo__img">
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
<!-- main-->
<main>
  <!-- Board -->
  <section id="home">
    <!-- <i class="fa-solid fa-leaf fa-2xl home__logo" style="color: #74b573;"></i> -->
    <div class="home__container">
      <script>
        let msg = "${msg}";
        if (msg == "WRT_ERR") alert("게시물 등록이 실패했습니다. 다시 시도해주세요.");
        if (msg == "MOD_ERR") alert("게시물 수정에 실패했습니다. 다시 시도해주세요.");

      </script>
      <h2 class="home__title"> Leaf</h2>
      <form action="" id="form">
        <div class="board">
          <input type="hidden" name="bno" value="${boardDto.bno}" readonly="readonly">
          <label for="title">제목</label><input type="text" id="title" name="title" value="<c:out value='${boardDto.title}'/>" >
          <label for="writer">작성자</label><input type="text" id="writer" name="writer" value="<c:out value='${boardDto.writer}'/>" readonly="readonly"><br>
          <textarea name="content" cols="30" rows="10" ><c:out value="${boardDto.content}"/></textarea>
          <c:if test="${mode eq 'new'}">
            <button type="button" id="writeBtn" >등록</button>
          </c:if>
          <c:if test="${mode eq 'mod'}">
            <button type="button" id="modifyBtn" >수정</button>
            <button type="button" id="removeBtn" >삭제</button>
          </c:if>
          <button type="button" id="listBtn">목록</button>
        </div>
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
<script>
  $(document).ready(function(){
    let formCheck = function() {
      let form = document.getElementById("form");
      if(form.title.value=="") {
        alert("제목을 입력해 주세요.");
        form.title.focus();
        return false;
      }

      if(form.content.value=="") {
        alert("내용을 입력해 주세요.");
        form.content.focus();
        return false;
      }
      return true;
    }

    $("#writeBtn").on("click", function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/board/write'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });

    $("#modifyBtn").on("click", function(){

      let form = $("#form");
      form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });

    $("#removeBtn").on("click", function(){
      if(!confirm("정말로 삭제하시겠습니까?")) return;

      let form = $("#form");
      form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
      form.attr("method", "post");
      form.submit();
    });

    $("#listBtn").on("click", function(){
      location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
    });

  });
</script>