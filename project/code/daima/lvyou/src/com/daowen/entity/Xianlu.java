﻿package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Xianlu
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private String chufadi ;
   public String getChufadi() 
   {
      return chufadi;
  }
   public void setChufadi(String chufadi) 
   {
      this.chufadi= chufadi;
  }
   private String mudidi ;
   public String getMudidi() 
   {
      return mudidi;
  }
   public void setMudidi(String mudidi) 
   {
      this.mudidi= mudidi;
  }
   private String shijiananpai ;
   public String getShijiananpai() 
   {
      return shijiananpai;
  }
   public void setShijiananpai(String shijiananpai) 
   {
      this.shijiananpai= shijiananpai;
  }
   private String fatuanriqi ;
   public String getFatuanriqi() 
   {
      return fatuanriqi;
  }
   public void setFatuanriqi(String fatuanriqi) 
   {
      this.fatuanriqi= fatuanriqi;
  }
   private String jiaotongxinxi ;
   public String getJiaotongxinxi() 
   {
      return jiaotongxinxi;
  }
   public void setJiaotongxinxi(String jiaotongxinxi) 
   {
      this.jiaotongxinxi= jiaotongxinxi;
  }
   private Double shichangjia ;
   public Double getShichangjia() 
   {
      return shichangjia;
  }
   public void setShichangjia(Double shichangjia) 
   {
      this.shichangjia= shichangjia;
  }
   private Double hyjia ;
   public Double getHyjia() 
   {
      return hyjia;
  }
   public void setHyjia(Double hyjia) 
   {
      this.hyjia= hyjia;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
   private String tupian ;
   public String getTupian() 
   {
      return tupian;
  }
   public void setTupian(String tupian) 
   {
      this.tupian= tupian;
  }
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
  }
}
