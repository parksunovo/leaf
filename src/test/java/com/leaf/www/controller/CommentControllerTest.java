package com.leaf.www.controller;

import com.leaf.www.service.CommentService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentControllerTest {
  @Autowired
  CommentService service;

  public void delete() throws Exception{
    int rowCnt = service.remove(10, 411, "leaf");

    assertTrue(rowCnt==1);
  }

}