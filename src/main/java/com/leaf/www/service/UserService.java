package com.leaf.www.service;

import com.leaf.www.domain.UserDto;

public interface UserService {
  int remove(String id, String pwd) throws Exception;

  int register(UserDto userDto) throws Exception;

  UserDto select(String id, String pwd) throws Exception;

  int modify(UserDto userDto) throws Exception;

  int getCount() throws Exception;
}
