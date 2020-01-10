package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Voteitem
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
   private int vcount ;
   public int getVcount() 
   {
      return vcount;
  }
   public void setVcount(int vcount) 
   {
      this.vcount= vcount;
  }
   private int belongid ;
   public int getBelongid() 
   {
      return belongid;
  }
   public void setBelongid(int belongid) 
   {
      this.belongid= belongid;
  }
}
