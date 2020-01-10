package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Dingdan
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
   private String chepaino ;
   public String getChepaino() 
   {
      return chepaino;
  }
   public void setChepaino(String chepaino) 
   {
      this.chepaino= chepaino;
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
   private String idcardno ;
   public String getIdcardno() 
   {
      return idcardno;
  }
   public void setIdcardno(String idcardno) 
   {
      this.idcardno= idcardno;
  }
   private String mobile ;
   public String getMobile() 
   {
      return mobile;
  }
   public void setMobile(String mobile) 
   {
      this.mobile= mobile;
  }
   private int tianshu ;
   public int getTianshu() 
   {
      return tianshu;
  }
   public void setTianshu(int tianshu) 
   {
      this.tianshu= tianshu;
  }
   private Date begindate ;
   public Date getBegindate() 
   {
      return begindate;
  }
   public void setBegindate(Date begindate) 
   {
      this.begindate= begindate;
  }
   private Date enddate ;
   public Date getEnddate() 
   {
      return enddate;
  }
   public void setEnddate(Date enddate) 
   {
      this.enddate= enddate;
  }
   private Double danjia ;
   public Double getDanjia() 
   {
      return danjia;
  }
   public void setDanjia(Double danjia) 
   {
      this.danjia= danjia;
  }
   private Double totalfee ;
   public Double getTotalfee() 
   {
      return totalfee;
  }
   public void setTotalfee(Double totalfee) 
   {
      this.totalfee= totalfee;
  }
   private String ddno ;
   public String getDdno() 
   {
      return ddno;
  }
   public void setDdno(String ddno) 
   {
      this.ddno= ddno;
  }
   private Date xdtime ;
   public Date getXdtime() 
   {
      return xdtime;
  }
   public void setXdtime(Date xdtime) 
   {
      this.xdtime= xdtime;
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
   private int status ;
   public int getStatus() 
   {
      return status;
  }
   public void setStatus(int status) 
   {
      this.status= status;
  }
}
