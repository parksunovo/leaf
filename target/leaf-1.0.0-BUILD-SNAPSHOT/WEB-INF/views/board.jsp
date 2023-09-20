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
<%--  <script type="module" src="<c:url value='/js/main.js'/>" defer></script>--%>
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
    <h2 class="home__title"> Leaf</h2>
    <form action="" id="form">
      <div class="board">
      <input type="hidden" name="bno" value="${boardDto.bno}" readonly="readonly">
        <label for="title">제목</label><input type="text" id="title" name="title" value="<c:out value='${boardDto.title}'/>" ${mode=="new" ? '' : 'readonly="readonly"'}>
        <label for="writer">작성자</label><input type="text" id="writer" name="writer" value="<c:out value='${boardDto.writer}'/>" readonly="readonly"><br>
      <textarea name="content" cols="30" rows="10" readonly="readonly"><c:out value="${boardDto.content}"/></textarea>
        <c:if test="${boardDto.writer eq loginId}">
          <button type="button" id="modifyBtn" >수정</button>
          <button type="button" id="removeBtn" >삭제</button>
        </c:if>
      <button type="button" id="listBtn">목록</button>
      </div>
    </form>
    <div id="comment">
      <p>댓글</p>
      <form id="commentForm">
        <input type="text" name="comment">
        <button type="button" id="sendBtn">등록</button>
      </form>
    <div id="commentList">
    </div>
      <div id="replyForm" style="display: none">
        <input type="text" name="replyComment">
        <button id="wrtRepBtn" type="button">등록</button>
      </div>
      <div id="replyModForm" style="display: none">
        <input type="text" name="replyModComment">
        <button id="modBtn" type="button">수정</button>
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
<script>

    let bno = ${boardDto.bno};

    let showList = function (bno){
      $.ajax({
        type:'GET',
        url:'/leaf/comments?bno='+bno,
        success: function (result){
          $("#commentList").html(toHtml(result));
        },
        error : function (){alert("error")}
      });// ajax
    }
    let toHtml = function (comments){
      let tmp = "<ul>";
      comments.forEach(function (comment){
        tmp += '<li data-cno=' + comment.cno
        tmp += ' data-pcno=' + comment.pcno
        tmp += ' data-bno=' + comment.bno +'>'
        if(comment.cno!=comment.pcno)
          tmp += 'ㄴ';
        tmp += '<span class="commenter>">' + comment.commenter + ': </span>'
        tmp += '<span class="comment">' + comment.comment + '</span>'
        tmp += '<button class="delBtn">삭제</button>'
        tmp += '<button class="modBtn">수정</button>'
        tmp += '<button class="replyBtn">답글</button>'
        tmp += '</li>'
        tmp += '<div class=' +comment.cno+ '>'
        tmp += '</div>'
      })
      return tmp + "</ul>";
    }

    // let showListRep = function (cno){
    //   $.ajax({
    //     type:'GET',
    //     url:'/leaf/comments/'+cno,
    //     success: function (result){
    //       // $("#cno").html(toHtmlRep(result));
    //       // $(this).parent().html(toHtml(result))
    //       $(".cno").html(toHtmlRep(result));
    //       // $(this).parent().html(toHtmlRep(result));
    //     },
    //     error : function (){alert("error")}
    //   });// ajax
    // }
    // let toHtmlRep = function (comments){
    //   let tmp = "<ul>";
    //
    //   comments.forEach(function (comment){
    //     tmp += '<li data-cno=' + comment.cno
    //     tmp += ' data-pcno=' + comment.pcno
    //     tmp += ' data-bno=' + comment.bno +'>'
    //     tmp += '<span class="commenter>"> ㄴ ' + comment.commenter + ': </span>'
    //     // tmp += ' up_date= ' + comment.up_date+'<br>'
    //     tmp += '<span class="comment">' + comment.comment + '</span>'
    //     tmp += '<button type="button" id="modifyBtn" >수정</button>'
    //     tmp += '<button type="button" id="removeBtn" >삭제</button>'
    //     tmp += '<button class="replyBtn">답글</button>'
    //     tmp += '</li>'
    //   })
    //   return tmp + "</ul>";
    // }

    $(document).ready(function(){

        $("#modifyBtn").on("click", function(){
          location.href="<c:url value='/board/modify${searchCondition.queryString}&bno=${boardDto.bno}'/>";
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

        showList(bno);

      $("#sendBtn").click(function (){
        let comment = $("input[name=comment]").val();
        if (comment.trim()==''){
          alert("댓글을 입력해주세요.");
          $("input[name=comment]").focus()
          return;
        }
        $.ajax({
          type: 'POST',
          url: '/leaf/comments?bno='+bno,
          headers: {"content-type": "application/json"},
          data: JSON.stringify({bno:bno, comment:comment}),
          success: function (result){
            alert(result);
            showList(bno);
          },
          error: function (){
            alert("error");}
        }) //ajax
      })// POST


      $("#wrtRepBtn").click(function () {
        let comment = $("input[name=replyComment]").val();
        let pcno = $("#replyForm").parent().attr("data-pcno");

        if (comment.trim() == '') {
          alert("댓글을 입력해주세요.");
          $("input[name=replyComment]").focus()
          return;
        }
        $.ajax({
          type: 'POST',
          url: '/leaf/comments?bno=' + bno,
          headers: {"content-type": "application/json"},
          data: JSON.stringify({pcno: pcno, bno: bno, comment: comment}),
          success: function (result) {
            alert(result);
            showList(bno);
          },
          error: function () {
            alert("error");
          }
        }) //ajax
      });

      $("#modBtn").click(function (){
        let comment = $("input[name=replyModComment]").val();
        let cno = $(this).attr("data-cno");

        if (comment.trim()==''){
          alert("댓글을 입력해주세요.");
          $("input[name=replyModComment]").focus()
          return;
        }

        $.ajax({
          type: 'PATCH',
          url: '/leaf/comments/'+cno,
          headers: {"content-type": "application/json"},
          data: JSON.stringify({cno:cno, comment:comment}),
          success: function (result){
            alert(result);
            showList(bno);
          },
          error: function (){
            alert("error");}
        }) //ajax
      })

        $("#commentList").on("click", ".modBtn", function () {
          let cno = $(this).parent().attr("data-cno");
          let comment = $("span.comment", $(this).parent()).text();
          let commenter = $("span.commenter", $(this).parent()).text();

          $("#replyModForm").appendTo($(this).parent());
          $("#replyModForm").css("display", "block");

          $("input[name=replyModComment]").val(comment);
          $("#modBtn").attr("data-cno", cno);

        })

        $("#commentList").on("click", ".replyBtn", function () {
          $("#replyForm").appendTo($(this).parent());

          $("#replyForm").css("display", "block");
        })

        $("#commentList").on("click", ".delBtn", function () {
          let cno = $(this).parent().attr("data-cno");
          let bno = $(this).parent().attr("data-bno");

          $.ajax({
            type: 'DELETE',
            url: '/leaf/comments/' + cno + '?bno=' + bno,
            success: function (result) {
              alert(result);
              showList(bno);
            },
            error: function (result) {
              alert(result)
            }
          });// ajax
        });
        });



</script>
</body>
</html>