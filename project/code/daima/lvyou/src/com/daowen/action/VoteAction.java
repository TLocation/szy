package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import com.daowen.dal.*;
import com.daowen.bll.*;
import com.daowen.entity.*;

import com.daowen.util.HibernateSessionFactory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;
import com.daowen.util.PagerMetal;


public class VoteAction extends PageActionBase {
	
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
		if (actiontype.equals("vote")) {
			vote();
		}
		
	}

	
    //投票
	private void vote() {
		
		String forid=request.getParameter("forid");
		String votetype=request.getParameter("votetype");
		
        String[] voteids = request.getParameterValues("voteids");
		// 查找
		List<Vote> existvotelist = DALBase.getEntity("vote", MessageFormat.format("where forid={0} and votetype=''{1}''", forid,votetype));
		
		for(String voteid : voteids){
			
			String voteitemtitle=request.getParameter(voteid);
			
			Voteitem temVoteitem=(Voteitem)DALBase.load("voteitem", MessageFormat.format("where title=''{0}'' and belongid={1} ",voteitemtitle,voteid));
			
			if(temVoteitem!=null)
			{
				temVoteitem.setVcount(temVoteitem.getVcount()+1);
				DALBase.update(temVoteitem);
				
				Vote vote=(Vote)DALBase.load("vote", "where id="+voteid);
				vote.setTotalcount(vote.getTotalcount()+1);
				DALBase.update(vote);
				
			}
			
			
		}
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/voteadd.jsp";
		}
		
		try {
			request.getRequestDispatcher(forwardurl).forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("vote", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		
		String forwardurl = request.getParameter("forwardurl");
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String votetype = request.getParameter("votetype");
		String forid = request.getParameter("forid");
		String tablename = request.getParameter("tablename");
		String des = request.getParameter("des");
		Vote vote = new Vote();
		vote.setTitle(title == null ? "" : title);
		vote.setPubren(pubren == null ? "" : pubren);
		vote.setTotalcount(0);
	    vote.setPubtime(new Date());
		vote.setVotetype(votetype == null ? "" : votetype);
		vote.setForid(new Integer(forid));
		vote.setTablename(tablename == null ? "" : tablename);
		vote.setDes(des == null ? "" : des);
		DALBase.save(vote);
		
	    String[] voteitems=request.getParameterValues("votechoiceitems");
	    if(voteitems!=null){
		    for(String item : voteitems){
		    	
		    	Voteitem voteitem =new Voteitem();
		    	voteitem.setTitle(item);
		    	voteitem.setVcount(0);
		        voteitem.setBelongid(vote.getId());
		        DALBase.save(voteitem);
		    }
	    }
	
		
		binding();
		
	}

	

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		
		String forid = request.getParameter("forid");
		
		String votetype=request.getParameter("votetype");

		// 投票选项ID集合
		String[] voteids = request.getParameterValues("voteids");

		

		// 查找
		List<Vote> existvotelist = DALBase.getEntity("vote", MessageFormat.format("where forid={0} and votetype=''{1}''", forid,votetype));
		
		// 如果投票ID集合存在
		if (voteids != null)
		// 修改当前页面提交投票数据
			for (String voteid : voteids) {
	
				// 获取投票主题
				String title = request.getParameter("voteid");
	
				Vote currentvote = null;
	
				for (Vote temvote : existvotelist) {
					if (temvote.getId() == new Integer(voteid)) {
						currentvote = temvote;
						break;
					}
				}
				currentvote.setTitle(title);
	
				// 修改投票选项
				String[] voteitems = request.getParameterValues(String
						.valueOf(currentvote.getId()));
	
				if (voteitems != null) {
					for (String item : voteitems) {
						// 如果不存在则进行加入投票选项
						if (!DALBase.isExist("voteitem", "where title='" + item
								+ "'")) {
							Voteitem voteitem = new Voteitem();
							voteitem.setTitle(item);
							voteitem.setVcount(0);
							voteitem.setBelongid(currentvote.getId());
							DALBase.save(voteitem);
						}
					}
				}
			}
		//删除当前页面不存在的投票选项
		if(existvotelist!=null)
		    for(Vote vote  : existvotelist){
		    	
		    	boolean isexist=false;
		    	System.out.println("投票标题："+vote.getTitle());
		    	
		    	if(voteids!=null)
			    	for(String voteid : voteids){
			    		System.out.println("页面主题="+voteid);
			    		if(voteid.equals(String.valueOf(vote.getId())))
			    			isexist=true;
			    		
			    	}
		    	// 如果当前页面不存在的投票项则进行删除
		    	if(!isexist)
		    	{
		    		
		    		DALBase.delete("voteitem", "where belongid="+vote.getId());
		    		DALBase.delete(vote);
		    	}
		    
		    }
		
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/votemanager.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
		
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Vote vote = (Vote) DALBase.load("vote", "where id=" + id);
			if (vote != null) {
				request.setAttribute("vote", vote);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/voteadd.jsp";
		}
		
		try {
			request.getRequestDispatcher("voteadd.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "where 1=1 ";
		String forid = request.getParameter("forid");
		String votetype=request.getParameter("votetype");
		if (forid != null)
			filter += "  and forid ="+forid;
		if(votetype!=null)
			filter += "  and votetype ='"+votetype+"'";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Vote> listvote = DALBase.getPageEnity("vote", filter, pageindex,
				pagesize);
		int recordscount = DALBase.getRecordCount("vote", filter == null ? ""
				: filter);
		request.setAttribute("listvote", listvote);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/votemanager.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
