package com.leaf.www.controller;

import com.leaf.www.domain.CommentDto;
import com.leaf.www.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
public class CommentController {
  @Autowired
  CommentService service;

  @PatchMapping("/comments/{cno}")
  public ResponseEntity<String> modify(@PathVariable Integer cno,@RequestBody CommentDto commentDto,HttpSession session) {
    String commenter = (String)session.getAttribute("id");
    commentDto.setCommenter(commenter);
    commentDto.setCno(cno);
    System.out.println("commentDto = " + commentDto);
    try {
      int rowCnt = service.modify(commentDto);
      if (rowCnt != 1) throw new Exception("modify failed");

      return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
    }
  }

  @PostMapping("/comments")
  public ResponseEntity<String> write(@RequestBody CommentDto commentDto,Integer bno,HttpSession session){
    String commenter = (String)session.getAttribute("id");
    commentDto.setCommenter(commenter);
    commentDto.setBno(bno);
    System.out.println("commentDto = " + commentDto);
    try {
      int rowCnt = service.write(commentDto);
      if (rowCnt!=1) throw new Exception("write failed");

      return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
    }
  }

  @DeleteMapping("/comments/{cno}")
  public ResponseEntity<String> remove(@PathVariable Integer cno,Integer bno,HttpSession session){
    String commenter = (String) session.getAttribute("id");

    try {
      int rowCnt = service.remove(cno, bno, commenter);

      if (rowCnt!=1) throw new Exception("Delete Failed");

      return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
    }
  }
  @GetMapping("/comments")
  public ResponseEntity<List<CommentDto>> list(Integer bno){
    List<CommentDto> list = null;
    try {
      list = service.getList(bno);
      int totalCnt = service.getCount(bno);
      return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<List<CommentDto>>(list, HttpStatus.BAD_REQUEST);
    }
  }



  @GetMapping("/comments/{cno}")
  public ResponseEntity<List<CommentDto>> listRep(@PathVariable Integer cno){
    List<CommentDto> list = null;
    try {
      System.out.println("cno = " + cno);
      list = service.getRepList(cno);
      return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      return new ResponseEntity<List<CommentDto>>(list, HttpStatus.BAD_REQUEST);
    }
  }
}
