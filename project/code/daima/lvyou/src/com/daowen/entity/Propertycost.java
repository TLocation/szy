package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Propertycost
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
   private String accountname ;
   public String getAccountname() 
   {
      return accountname;
  }
   public void setAccountname(String accountname) 
   {
      this.accountname= accountname;
  }
   private String name ;
   public String getName() 
   {
      return name;
  }
   public void setName(String name) 
   {
      this.name= name;
  }
   private String year ;
   public String getYear() 
   {
      return year;
  }
   public void setYear(String year) 
   {
      this.year= year;
  }
   private String jidu ;
   public String getJidu() 
   {
      return jidu;
  }
   public void setJidu(String jidu) 
   {
      this.jidu= jidu;
  }
   private String mianji ;
   public String getMianji() 
   {
      return mianji;
  }
   public void setMianji(String mianji) 
   {
      this.mianji= mianji;
  }
   private Double fee ;
   public Double getFee() 
   {
      return fee;
  }
   public void setFee(Double fee) 
   {
      this.fee= fee;
  }
   private String jbren ;
   public String getJbren() 
   {
      return jbren;
  }
   public void setJbren(String jbren) 
   {
      this.jbren= jbren;
  }
   private Date createtime ;
   public Date getCreatetime() 
   {
      return createtime;
  }
   public void setCreatetime(Date createtime) 
   {
      this.createtime= createtime;
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
