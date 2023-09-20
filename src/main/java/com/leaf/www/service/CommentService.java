package com.leaf.www.service;

import com.leaf.www.domain.CommentDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CommentService {
  int getCount(Integer bno) throws Exception;

  int getCountRep(Integer cno) throws Exception;

  @Transactional(rollbackFor = Exception.class)
  int remove(Integer cno, Integer bno, String commenter) throws Exception;

  @Transactional(rollbackFor = Exception.class)
  int write(CommentDto commentDto) throws Exception;

  List<CommentDto> getList(Integer bno) throws Exception;

  List<CommentDto> getRepList(Integer cno) throws Exception;

  CommentDto read(Integer cno) throws Exception;

  int modify(CommentDto commentDto) throws Exception;
}
