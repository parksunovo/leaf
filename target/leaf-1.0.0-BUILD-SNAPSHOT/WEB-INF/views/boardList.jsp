<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <img src="<c:url value='/images/favicon.ico'/>" alt="">
    <h2 class="home__title"> Leaf</h2>
    <script>
        let msg = "${msg}";
        if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
        if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
        if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");

        if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
        if(msg=="WRT_OK")    alert("성공적으로 등록되었습니다.");
        if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
    </script>
    <div class="board">
    <form action="<c:url value="/board/list"/>" class="search-form" method="get">
      <select class="search-option" name="option">
        <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
        <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
        <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
      </select>

      <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
      <button type="submit" id="searchBtn">검색</button>
    </form>
      <button type="button" id="writeBtn" onclick="location.href='<c:url value="/board/write"/>'">글쓰기</button>
      <table>
        <tr>
          <th>제목</th>
          <th>이름</th>
          <th>등록일</th>
          <th>조회수</th>
        </tr>
        <c:forEach var="boardDto" items="${list}">
          <tr>
            <td><a href="<c:url value="/board/read${ph.sc.queryString}&bno=${boardDto.bno}"/>"><c:out value="${boardDto.title}"/></a></td>
            <td>${boardDto.writer}</td>
            <c:choose>
              <c:when test="${boardDto.reg_date.time >= startOfToday}">
                <td><fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm" type="time"/></td>
              </c:when>
              <c:otherwise>
                <td><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
              </c:otherwise>
            </c:choose>
            <td>${boardDto.view_cnt}</td>
          </tr>
        </c:forEach>
      </table>
      <br>
      <div class="paging-container">
        <div class="paging">
          <c:if test="${totalCnt==null || totalCnt==0}">
            <div> 게시물이 없습니다. </div>
          </c:if>
          <c:if test="${totalCnt!=null && totalCnt!=0}">
            <c:if test="${ph.showPrev}">
              <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
              <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
              <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
            </c:if>
          </c:if>
        </div>
      </div>
    </div>
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