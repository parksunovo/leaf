package com.leaf.www.controller;

import com.leaf.www.domain.UserDto;
import com.leaf.www.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
  @Autowired
  UserService userService;

  @GetMapping("/login")
  public String login(){
    return "loginForm";
  }

  @PostMapping("/login")
  public String login(String id, String pwd, String toURL, boolean rememberId, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rattr) throws Exception{
    if(!loginCheck(id,pwd)){
      rattr.addFlashAttribute("msg","LOG_ERR");
      return "redirect:/login";
    }

    HttpSession session = request.getSession();
    session.setAttribute("id",id);

    if (rememberId){
      Cookie cookie = new Cookie("id", id);
      cookie.setMaxAge(3000);
      response.addCookie(cookie);
    }else {
      Cookie cookie = new Cookie("id", id);
      cookie.setMaxAge(0);
      response.addCookie(cookie);
    }
    rattr.addFlashAttribute("msg", "LOG_OK");

//    if(toURL == null || toURL.equals(""))

    System.out.println("toURL = " + toURL);
    toURL = (toURL == null || toURL.equals("") ? "/" : toURL);

    return "redirect:"+toURL;
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }

  @GetMapping("/userCheck")
  public String userCheck(HttpServletRequest request,Model m){
    m.addAttribute("msg", "USR_MOD");
    m.addAttribute("mode", "mod");
    return "loginForm";
  }

  @PostMapping("/userCheck")
  public String userCheck(String id, String pwd,Model m,RedirectAttributes rattr){
    try {
      UserDto userDto = userService.select(id,pwd);
      m.addAttribute(userDto);
      m.addAttribute("mode", "mod");
      return "register";
    } catch (Exception e){
      e.printStackTrace();
      rattr.addFlashAttribute("msg", "LOG_ERR");
      return "redirect:/userCheck";
    }
  }

  @GetMapping("/myPage")
  public String userInfo(HttpServletRequest request,Model m){
    HttpSession session = request.getSession();
    String id = (String) session.getAttribute("id");

    return "register";
  }

  @PostMapping("/myPage")
  public String userInfo(UserDto userDto,Model m, RedirectAttributes rattr){
    try{
      int rowCnt = userService.modify(userDto);
      rattr.addFlashAttribute("msg", "MOD_OK");
      return "redirect:/";
    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute(userDto);
      m.addAttribute("msg", "MOD_ERR");
      return "register";
    }
  }

  @GetMapping("/add")
  public String register(HttpServletRequest request) {
    System.out.println("getID =" +request.getSession().getAttribute("id"));
    return "register";
  }

  @PostMapping("/add")
  public String register(UserDto userDto, Model m, RedirectAttributes rattr) {
    try {
      System.out.println("userDto = " + userDto);
      int rowCnt = userService.register(userDto);


      rattr.addFlashAttribute("msg", "REG_OK");
      return "redirect:/";
    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute(userDto);
      m.addAttribute("msg", "REG_ERR");
      return "register";
    }
  }

  private boolean loginCheck(String id, String pwd){
    UserDto userDto = null;
    try {
      userDto = userService.select(id,pwd);
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
    return true;
  }//loginCheck

}
