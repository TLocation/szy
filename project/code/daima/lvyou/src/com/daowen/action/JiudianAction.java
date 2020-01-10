package com.daowen.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import com.daowen.dal.*;
import com.daowen.bll.*;
import com.daowen.entity.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;
import com.daowen.util.PagerMetal;

/**************************

 *         酒店控制
 * 
 */
public class JiudianAction extends PageActionBase {
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
		DALBase.delete("jiudian", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String brand = request.getParameter("brand");
		String jibie = request.getParameter("jibie");
		String tupian = request.getParameter("tupian");
		String city = request.getParameter("city");
		String des = request.getParameter("des");
		String address = request.getParameter("address");
		SimpleDateFormat sdfjiudian = new SimpleDateFormat("yyyy-MM-dd");
		Jiudian jiudian = new Jiudian();
		jiudian.setTitle(title == null ? "" : title);
		jiudian.setBrand(brand == null ? "" : brand);
		jiudian.setJibie(jibie == null ? "" : jibie);
		jiudian.setTupian(tupian == null ? "" : tupian);
		jiudian.setCity(city == null ? "" : city);
		jiudian.setDes(des == null ? "" : des);
		jiudian.setAddress(address == null ? "" : address);
		DALBase.save(jiudian);
		if (forwardurl == null) {
			forwardurl = "/admin/jiudianmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Jiudian jiudian = (Jiudian) DALBase.load(Jiudian.class, new Integer(id));
		if (jiudian == null)
			return;
		String title = request.getParameter("title");
		String brand = request.getParameter("brand");
		String jibie = request.getParameter("jibie");
		String tupian = request.getParameter("tupian");
		String city = request.getParameter("city");
		String des = request.getParameter("des");
		String address = request.getParameter("address");
		SimpleDateFormat sdfjiudian = new SimpleDateFormat("yyyy-MM-dd");
		jiudian.setTitle(title);
		jiudian.setBrand(brand);
		jiudian.setJibie(jibie);
		jiudian.setTupian(tupian);
		jiudian.setCity(city);
		jiudian.setDes(des);
		jiudian.setAddress(address);
		DALBase.update(jiudian);
		if (forwardurl == null) {
			forwardurl = "/admin/jiudianmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
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
			Jiudian jiudian = (Jiudian) DALBase.load("jiudian", "where id="
					+ id);
			if (jiudian != null) {
				request.setAttribute("jiudian", jiudian);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> city_datasource = DALBase.getEntity("areacity", "");
		request.setAttribute("city_datasource", city_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/jiudianadd.jsp";
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
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
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
		List<Jiudian> listjiudian = DALBase.getPageEnity("jiudian", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("jiudian",
				filter == null ? "" : filter);
		request.setAttribute("listjiudian", listjiudian);
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
			forwardurl = "/admin/jiudianmanager.jsp";
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
