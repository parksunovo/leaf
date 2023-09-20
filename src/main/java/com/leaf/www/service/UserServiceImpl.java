package com.leaf.www.service;

import com.leaf.www.dao.UserDao;
import com.leaf.www.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
  @Autowired
  UserDao userDao;

  @Override
  public int remove(String id, String pwd) throws Exception {
    return userDao.delete(id, pwd);
  }

  @Override
  public int register(UserDto userDto) throws Exception {
    return userDao.insert(userDto);
  }

  @Override
  public UserDto select(String id, String pwd) throws Exception{
    return userDao.select(id, pwd);
  }
  @Override
  public int modify(UserDto userDto) throws Exception{
    return userDao.update(userDto);
  }

  @Override
  public int getCount() throws Exception{
    return userDao.count();
  }

}
