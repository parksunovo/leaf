package com.leaf.www.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
  private String id;
  private String pwd;
  private String name;
  private String email;
  private String phone;
  private Date reg_date;

  public UserDto(){}
  public UserDto(String id, String pwd, String name, String email, String phone) {
    this.id = id;
    this.pwd = pwd;
    this.name = name;
    this.email = email;
    this.phone = phone;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    UserDto userDto = (UserDto) o;
    return id.equals(userDto.id) && Objects.equals(pwd, userDto.pwd) && Objects.equals(name, userDto.name) && Objects.equals(email, userDto.email) && Objects.equals(phone, userDto.phone);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, pwd, name, email, phone, reg_date);
  }

  @Override
  public String toString() {
    return "User{" +
            "id='" + id + '\'' +
            ", pwd='" + pwd + '\'' +
            ", name='" + name + '\'' +
            ", email='" + email + '\'' +
            ", phone='" + phone + '\'' +
            '}';
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public Date getReg_date() {
    return reg_date;
  }

  public void setReg_date(Date reg_date) {
    this.reg_date = reg_date;
  }
}