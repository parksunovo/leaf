package com.leaf.www.dao;

import com.leaf.www.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Calendar;
import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {
  @Autowired
  UserDao userDao;

  @Test
  public void insertTest() throws Exception{
    Calendar cal = Calendar.getInstance();
    cal.clear();
    cal.set(2021, 1, 1);
    UserDto userDto = new UserDto("test2","1111","test","222@222.com","1111");
    int rowCnt = userDao.insert(userDto);
    assertTrue(rowCnt==1);
  }
}