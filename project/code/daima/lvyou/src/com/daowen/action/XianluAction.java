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

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;

import com.daowen.util.PagerMetal;

public class XianluAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;

		
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("xianlu", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String chufadi = request.getParameter("chufadi");
		String mudidi = request.getParameter("mudidi");
		String shijiananpai = request.getParameter("shijiananpai");
		String fatuanriqi = request.getParameter("fatuanriqi");
		String jiaotongxinxi = request.getParameter("jiaotongxinxi");
		String shichangjia = request.getParameter("shichangjia");
		String hyjia = request.getParameter("hyjia");
		String des = request.getParameter("des");
		String tupian = request.getParameter("tupian");
		String title = request.getParameter("title");
		SimpleDateFormat sdfxianlu = new SimpleDateFormat("yyyy-MM-dd");
		Xianlu xianlu = new Xianlu();
		xianlu.setChufadi(chufadi == null ? "" : chufadi);
		xianlu.setMudidi(mudidi == null ? "" : mudidi);
		xianlu.setShijiananpai(shijiananpai == null ? "" : shijiananpai);
		xianlu.setFatuanriqi(fatuanriqi == null ? "" : fatuanriqi);
		xianlu.setJiaotongxinxi(jiaotongxinxi == null ? "" : jiaotongxinxi);
		xianlu.setShichangjia(shichangjia == null ? (double) 0 : new Double(
				shichangjia));
		xianlu.setHyjia(hyjia == null ? (double) 0 : new Double(hyjia));
		xianlu.setDes(des == null ? "" : des);
		xianlu.setTupian(tupian == null ? "" : tupian);
		xianlu.setTitle(title == null ? "" : title);
		DALBase.save(xianlu);
		// 保存附件

		if (forwardurl == null) {
			forwardurl = "/admin/xianlumanager.do?actiontype=get";
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
		Xianlu xianlu = (Xianlu) DALBase.load(Xianlu.class, new Integer(id));
		if (xianlu == null)
			return;
		String chufadi = request.getParameter("chufadi");
		String mudidi = request.getParameter("mudidi");
		String shijiananpai = request.getParameter("shijiananpai");
		String fatuanriqi = request.getParameter("fatuanriqi");
		String jiaotongxinxi = request.getParameter("jiaotongxinxi");
		String shichangjia = request.getParameter("shichangjia");
		String hyjia = request.getParameter("hyjia");
		String des = request.getParameter("des");
		String tupian = request.getParameter("tupian");
		String title = request.getParameter("title");
		SimpleDateFormat sdfxianlu = new SimpleDateFormat("yyyy-MM-dd");
		xianlu.setChufadi(chufadi);
		xianlu.setMudidi(mudidi);
		xianlu.setShijiananpai(shijiananpai);
		xianlu.setFatuanriqi(fatuanriqi);
		xianlu.setJiaotongxinxi(jiaotongxinxi);
		xianlu.setShichangjia(shichangjia == null ? (double) 0 : new Double(
				shichangjia));
		xianlu.setHyjia(hyjia == null ? (double) 0 : new Double(hyjia));
		xianlu.setDes(des);
		xianlu.setTupian(tupian);
		xianlu.setTitle(title);
		DALBase.update(xianlu);

		if (forwardurl == null) {
			forwardurl = "/admin/xianlumanager.do?actiontype=get";
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
			Xianlu xianlu = (Xianlu) DALBase.load("xianlu", "where id=" + id);
			if (xianlu != null) {
				request.setAttribute("xianlu", xianlu);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/xianluadd.jsp";
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
		String chufadi = request.getParameter("chufadi");
		if (chufadi != null)
			filter += "  and chufadi like '%" + chufadi + "%'  ";

		int pageindex = 1;// 定义当前是第几页
		int pagesize = 10;// 定义每页要显示的记录数
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
		List<Xianlu> listxianlu = DALBase.getPageEnity("xianlu", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("xianlu", filter == null ? ""
				: filter);
		request.setAttribute("listxianlu", listxianlu);
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
			forwardurl = "/admin/xianlumanager.jsp";
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
