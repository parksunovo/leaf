package com.leaf.www.domain;

import java.util.Date;

public class CommentDto {
    private Integer cno;
    private Integer bno;
    private Integer pcno;
    private String comment;
    private String commenter;
    private Date reg_date;
    private Date up_date;

    public CommentDto(){}
  public CommentDto(Integer bno, Integer pcno, String comment, String commenter) {
    this.bno = bno;
    this.pcno = pcno;
    this.comment = comment;
    this.commenter = commenter;
  }

  public Integer getCno() {
    return cno;
  }

  public void setCno(Integer cno) {
    this.cno = cno;
  }

  public Integer getBno() {
    return bno;
  }

  public void setBno(Integer bno) {
    this.bno = bno;
  }

  public Integer getPcno() {
    return pcno;
  }

  public void setPcno(Integer pcno) {
    this.pcno = pcno;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public String getCommenter() {
    return commenter;
  }

  public void setCommenter(String commenter) {
    this.commenter = commenter;
  }

  public Date getReg_date() {
    return reg_date;
  }

  public void setReg_date(Date reg_date) {
    this.reg_date = reg_date;
  }

  public Date getUp_date() {
    return up_date;
  }

  public void setUp_date(Date up_date) {
    this.up_date = up_date;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    CommentDto that = (CommentDto) o;

    if (getCno() != null ? !getCno().equals(that.getCno()) : that.getCno() != null) return false;
    if (getBno() != null ? !getBno().equals(that.getBno()) : that.getBno() != null) return false;
    if (getPcno() != null ? !getPcno().equals(that.getPcno()) : that.getPcno() != null) return false;
    if (getComment() != null ? !getComment().equals(that.getComment()) : that.getComment() != null) return false;
    return getCommenter() != null ? getCommenter().equals(that.getCommenter()) : that.getCommenter() == null;
  }

  @Override
  public int hashCode() {
    int result = getCno() != null ? getCno().hashCode() : 0;
    result = 31 * result + (getBno() != null ? getBno().hashCode() : 0);
    result = 31 * result + (getPcno() != null ? getPcno().hashCode() : 0);
    result = 31 * result + (getComment() != null ? getComment().hashCode() : 0);
    result = 31 * result + (getCommenter() != null ? getCommenter().hashCode() : 0);
    return result;
  }

  @Override
  public String toString() {
    return "CommentDto{" +
            "cno=" + cno +
            ", bno=" + bno +
            ", pcno=" + pcno +
            ", comment='" + comment + '\'' +
            ", commenter='" + commenter + '\'' +
            ", reg_date=" + reg_date +
            ", up_date=" + up_date +
            '}';
  }
}
