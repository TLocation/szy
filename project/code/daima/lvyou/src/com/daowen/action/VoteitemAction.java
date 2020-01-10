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

/**************************
 
 */
public class VoteitemAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("voteitem", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String title = request.getParameter("title");
		String vcount = request.getParameter("vcount");
		String belongid = request.getParameter("belongid");
		SimpleDateFormat sdfvoteitem = new SimpleDateFormat("yyyy-MM-dd");
		Voteitem voteitem = new Voteitem();
		voteitem.setTitle(title == null ? "" : title);
		voteitem.setVcount(new Integer(vcount));
		voteitem.setBelongid(new Integer(belongid));
		DALBase.save(voteitem);
		// 保存附件

		if (forwardurl != null)
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
		else {
			binding();
		}
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Voteitem voteitem = (Voteitem) DALBase.load(Voteitem.class,
				new Integer(id));
		if (voteitem == null)
			return;
		String title = request.getParameter("title");
		String vcount = request.getParameter("vcount");
		String belongid = request.getParameter("belongid");
		SimpleDateFormat sdfvoteitem = new SimpleDateFormat("yyyy-MM-dd");
		voteitem.setTitle(title);
		voteitem.setVcount(new Integer(vcount));
		voteitem.setBelongid(new Integer(belongid));
		DALBase.update(voteitem);
		// attachements(request,response,new
		// Integer(voteitem.getId()).toString());
		if (forwardurl != null)
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
		else {
			binding();
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
			Voteitem voteitem = (Voteitem) DALBase.load("voteitem", "where id="
					+ id);
			if (voteitem != null) {
				request.setAttribute("voteitem", voteitem);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("voteitemadd.jsp").forward(request,
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
		List<Voteitem> listvoteitem = DALBase.getPageEnity("voteitem", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("voteitem",
				filter == null ? "" : filter);
		request.setAttribute("listvoteitem", listvoteitem);
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
			forwardurl = "/admin/voteitemmanager.jsp";
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
