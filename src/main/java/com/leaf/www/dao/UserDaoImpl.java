package com.leaf.www.dao;

import com.leaf.www.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {
  @Autowired
  private SqlSession session;

  private String namespace = "com.leaf.www.dao.UserMapper.";
  @Override
  public int delete(String id, String pwd) throws Exception {
    Map map = new HashMap();
    map.put("id", id);
    map.put("pwd", pwd);
    return session.delete(namespace + "delete", map);
  }

  @Override
  public int count() throws Exception {
    return session.selectOne(namespace+"count");
  } // T selectOne(String statement)

  @Override
  public UserDto select(String id,String pwd) throws Exception {
    Map map = new HashMap();
    map.put("id", id);
    map.put("pwd", pwd);
    return session.selectOne(namespace + "select", map);
  }

  // 사용자 정보를 user_info테이블에 저장하는 메서드
  @Override
  public int insert(UserDto userDto) throws Exception {
    return session.insert(namespace + "insert", userDto);
  }

  @Override
  public int update(UserDto userDto) throws Exception {
    return session.update(namespace + "update", userDto);
  }


}
