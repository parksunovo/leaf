package com.leaf.www.dao;

import com.leaf.www.domain.UserDto;

public interface UserDao {
  int delete(String id, String pwd) throws Exception;

  int count() throws Exception // T selectOne(String statement)
  ;

  UserDto select(String id, String pwd) throws Exception;

  int insert(UserDto userDto) throws Exception;

  int update(UserDto userDto) throws Exception;

}
