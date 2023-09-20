package com.leaf.www.service;

import com.leaf.www.dao.*;
import com.leaf.www.domain.*;
import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import java.util.*;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentServiceImplTest {
  @Autowired
  CommentService commentService;
  @Autowired
  CommentDao commentDao;
  @Autowired
  BoardDao boardDao;

  @Test
  public void remove() throws Exception {
    boardDao.deleteAll();

    BoardDto boardDto = new BoardDto("hello", "hello", "leaf");
    assertTrue(boardDao.insert(boardDto) == 1);
    Integer bno = boardDao.selectAll().get(0).getBno();
    System.out.println("bno = " + bno);

    commentDao.deleteAll(bno);
    CommentDto commentDto = new CommentDto(bno,0,"hi","leaf");

    assertTrue(boardDao.select(bno).getComment_cnt() == 0);
    assertTrue(commentService.write(commentDto)==1);
    assertTrue(boardDao.select(bno).getComment_cnt() == 1);

    Integer cno = commentDao.selectAll(bno).get(0).getCno();

    // �Ϻη� ���ܸ� �߻���Ű�� Tx�� ��ҵǴ��� Ȯ���ؾ�.
    int rowCnt = commentService.remove(cno, bno, commentDto.getCommenter());
    assertTrue(rowCnt==1);
    assertTrue(boardDao.select(bno).getComment_cnt() == 0);
  }

  @Test
  public void write() throws  Exception {
    boardDao.deleteAll();

    BoardDto boardDto = new BoardDto("hello", "hello", "leaf");
    assertTrue(boardDao.insert(boardDto) == 1);
    Integer bno = boardDao.selectAll().get(0).getBno();
    System.out.println("bno = " + bno);

    commentDao.deleteAll(bno);
    CommentDto commentDto = new CommentDto(bno,0,"hi","leaf");

    assertTrue(boardDao.select(bno).getComment_cnt() == 0);
    assertTrue(commentService.write(commentDto)==1);

    Integer cno = commentDao.selectAll(bno).get(0).getCno();
    assertTrue(boardDao.select(bno).getComment_cnt() == 1);
  }
}