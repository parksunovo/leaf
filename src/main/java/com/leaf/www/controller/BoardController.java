package com.leaf.www.controller;

import com.leaf.www.domain.BoardDto;
import com.leaf.www.domain.PageHandler;
import com.leaf.www.domain.SearchCondition;
import com.leaf.www.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
  @Autowired
  BoardService boardService;

  @GetMapping("/modify")
  public String modify(SearchCondition sc,Integer bno,Model m){
    try {
      BoardDto boardDto = boardService.read(bno);
      m.addAttribute(boardDto);
      m.addAttribute("searchCondition", sc);
      m.addAttribute("mode", "mod");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "upload";
  }

  @PostMapping("/modify")
  public String modify(SearchCondition sc,BoardDto boardDto,HttpSession session,Model m,RedirectAttributes rattr){
    String writer = (String) session.getAttribute("id");
    System.out.println("writer = " + writer);
    System.out.println("boardDto.writer = " + boardDto.getWriter());
    System.out.println("page = " + sc.getPage());
    System.out.println("pageSize = " + sc.getPageSize());
    boardDto.setWriter(writer);
    try {
      int rowCnt = boardService.modify(boardDto);

      if(rowCnt!=1)
        throw new Exception("Modify failed");

      rattr.addFlashAttribute("msg", "MOD_OK");
      return "redirect:/board/list"+sc.getQueryString();
    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute(boardDto);
      m.addAttribute("msg", "MOD_ERR");
      return "upload";
    }
  }

  @PostMapping("/write")
  public String write(BoardDto boardDto,HttpSession session,Model m,RedirectAttributes rattr){
    String writer = (String) session.getAttribute("id");
    boardDto.setWriter(writer);
    System.out.println("boardDto = " + boardDto.getBno());
    try {
      int rowCnt = boardService.write(boardDto);

      if(rowCnt!=1)
        throw new Exception("Write failed");

      rattr.addFlashAttribute("msg", "WRT_OK");
      return "redirect:/board/list";
    } catch (Exception e) {
      e.printStackTrace();
      m.addAttribute(boardDto);
      m.addAttribute("msg", "WRT_ERR");
      return "upload";
    }
  }

  @GetMapping("/write")
  public String write(HttpSession session,Model m){
    String writer = (String) session.getAttribute("id");
    m.addAttribute("writer", writer);
    m.addAttribute("mode", "new");
    return "upload";
  }

  @PostMapping("/remove")
  public String remove(Integer bno,SearchCondition sc, Model m, HttpSession session, RedirectAttributes rattr) {
    String writer = (String) session.getAttribute("id");
    try {
      int rowCnt = boardService.remove(bno, writer);

      if (rowCnt != 1)
        throw new Exception("board remove error");

      rattr.addFlashAttribute("msg", "DEL_OK");
      return "redirect:/board/list"+sc.getQueryString();
    } catch (Exception e) {
      e.printStackTrace();
      rattr.addFlashAttribute("msg", "DEL_ERR");
    }
    return "redirect:/board/list";
  }

  @GetMapping("/read")
  public String read(Integer bno,SearchCondition sc, Model m) {
    try {
      BoardDto boardDto = boardService.read(bno);
      m.addAttribute(boardDto);
      m.addAttribute("searchCondition", sc);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "board";
  }

  @GetMapping("/list")
  public String list(SearchCondition sc,Model m, HttpServletRequest request) {
    if (!loginCheck(request))
      return "redirect:/login?toURL=" + request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

    try {
      System.out.println("sc = " + sc);
      int totalCnt = boardService.getSearchResultCnt(sc);
      m.addAttribute("totalCnt", totalCnt);

      PageHandler pageHandler = new PageHandler(totalCnt, sc);


      List<BoardDto> list = boardService.getSearchResultPage(sc);
      m.addAttribute("list", list);
      m.addAttribute("ph", pageHandler);

      Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
      m.addAttribute("startOfToday", startOfToday.toEpochMilli());
    } catch (Exception e) {
      e.printStackTrace();
    }

    return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
  }

  private boolean loginCheck(HttpServletRequest request) {
    HttpSession session = request.getSession();
    System.out.println("session.getAttribute(\"id\") = " + session.getAttribute("id"));
    return session.getAttribute("id") != null;
  }
}
