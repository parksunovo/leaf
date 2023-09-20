package com.leaf.www.domain;

import java.util.Date;

public class BoardDto {
  private Integer bno;
  private String title;
  private String content;
  private String writer;
  private int view_cnt;
  private int comment_cnt;
  private Date reg_date;


  public BoardDto(){}
  public BoardDto(String title, String content, String writer) {
    this.title = title;
    this.content = content;
    this.writer = writer;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    BoardDto boardDto = (BoardDto) o;

    if (getBno() != null ? !getBno().equals(boardDto.getBno()) : boardDto.getBno() != null) return false;
    if (getTitle() != null ? !getTitle().equals(boardDto.getTitle()) : boardDto.getTitle() != null) return false;
    if (getContent() != null ? !getContent().equals(boardDto.getContent()) : boardDto.getContent() != null)
      return false;
    return getWriter() != null ? getWriter().equals(boardDto.getWriter()) : boardDto.getWriter() == null;
  }

  @Override
  public int hashCode() {
    int result = getBno() != null ? getBno().hashCode() : 0;
    result = 31 * result + (getTitle() != null ? getTitle().hashCode() : 0);
    result = 31 * result + (getContent() != null ? getContent().hashCode() : 0);
    result = 31 * result + (getWriter() != null ? getWriter().hashCode() : 0);
    return result;
  }

  @Override
  public String toString() {
    return "BoardDto{" +
            "bno=" + bno +
            ", title='" + title + '\'' +
            ", content='" + content + '\'' +
            ", writer='" + writer + '\'' +
            ", view_cnt=" + view_cnt +
            ", comment_cnt=" + comment_cnt +
            ", reg_date=" + reg_date +
            '}';
  }

  public Integer getBno() {
    return bno;
  }

  public void setBno(Integer bno) {
    this.bno = bno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getWriter() {
    return writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public int getView_cnt() {
    return view_cnt;
  }

  public void setView_cnt(int view_cnt) {
    this.view_cnt = view_cnt;
  }

  public int getComment_cnt() {
    return comment_cnt;
  }

  public void setComment_cnt(int comment_cnt) {
    this.comment_cnt = comment_cnt;
  }

  public Date getReg_date() {
    return reg_date;
  }

  public void setReg_date(Date reg_date) {
    this.reg_date = reg_date;
  }
}
