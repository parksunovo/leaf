package com.leaf.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RestController {
  @GetMapping("/commentTest")
  public String test(){
    return "commentTest";
  }
}
