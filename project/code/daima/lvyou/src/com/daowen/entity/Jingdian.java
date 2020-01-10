package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Jingdian
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
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
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
   private String city ;
   public String getCity() 
   {
      return city;
  }
   public void setCity(String city) 
   {
      this.city= city;
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
}
