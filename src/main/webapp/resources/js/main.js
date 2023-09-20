'use strict';

//Header 페이지아래로 스크롤시 border색상 변경
const header = document.querySelector('.header')
const headerHeight = header.getBoundingClientRect().height;
document.addEventListener('scroll',() => {
  // console.log(window.scrollY);
  if(window.scrollY>headerHeight){
    header.classList.add('header--leaf');
  }else {
    header.classList.remove('header--leaf');
  }
});

// Home섹션을 아래로 스크롤시 투명하게 처리
const home = document.querySelector('.home__container');
const homeHeight = home.offsetHeight;
document.addEventListener('scroll',()=>{
  home.style.opacity = 1 - window.scrollY/homeHeight;
  // console.log(home.style.opacity);
});
// Arrow up버튼을 아래로 스크롤시 투명하게 처리함
const arrowUp = document.querySelector('.arrow-up');
document.addEventListener('scroll',()=>{
  if(window.scrollY> homeHeight / 2){
    arrowUp.style.opacity =1;
  }
  else{
    arrowUp.style.opacity =0;
  }
});
// navbar바 toggle처리
const navbarMenu = document.querySelector('.header__menu');
const navbarToggle = document.querySelector('.header__toggle');
navbarToggle.addEventListener('click',()=>{
  navbarMenu.classList.toggle('open');
});
// Navbar메뉴 클릭시 메뉴를 자동으로 닫아줌
navbarMenu.addEventListener('click',()=>{
  navbarMenu.classList.remove('open');
});