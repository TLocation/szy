package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Vote
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
   private String pubren ;
   public String getPubren() 
   {
      return pubren;
  }
   public void setPubren(String pubren) 
   {
      this.pubren= pubren;
  }
   private int totalcount ;
   public int getTotalcount() 
   {
      return totalcount;
  }
   public void setTotalcount(int totalcount) 
   {
      this.totalcount= totalcount;
  }
   private Date pubtime ;
   public Date getPubtime() 
   {
      return pubtime;
  }
   public void setPubtime(Date pubtime) 
   {
      this.pubtime= pubtime;
  }
   private String votetype ;
   public String getVotetype() 
   {
      return votetype;
  }
   public void setVotetype(String votetype) 
   {
      this.votetype= votetype;
  }
   private int forid ;
   public int getForid() 
   {
      return forid;
  }
   public void setForid(int forid) 
   {
      this.forid= forid;
  }
   private String tablename ;
   public String getTablename() 
   {
      return tablename;
  }
   public void setTablename(String tablename) 
   {
      this.tablename= tablename;
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
