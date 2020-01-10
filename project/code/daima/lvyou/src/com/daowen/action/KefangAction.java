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

/*客房控制 */
public class KefangAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
	}

	/****************** 信息注销监听支持*********************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("kefang", " where id=" + id);
		binding();
	}

	/******************* 保存动作监听支持*******************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String jdid = request.getParameter("jdid");
		SimpleDateFormat sdfkefang = new SimpleDateFormat("yyyy-MM-dd");
		Kefang kefang = new Kefang();
		kefang.setName(name == null ? "" : name);
		kefang.setPrice(price == null ? (double) 0 : new Double(price));
		kefang.setJdid(jdid == null ? 0 : new Integer(jdid));
		Boolean validateresult = saveValidate(MessageFormat.format("where name=''{0}''  and jdid={1} ",name,jdid));
		if (validateresult) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>已存在的客房信息</label>");
				request.setAttribute("kefang", kefang);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		DALBase.save(kefang);
		if (forwardurl == null) {
			forwardurl = "/admin/kefangmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 新增验证
	private boolean saveValidate(String filter) {
		return DALBase.isExist("kefang", filter);
	}

	/*************** 更新内部支持*********************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Kefang kefang = (Kefang) DALBase.load(Kefang.class, new Integer(id));
		if (kefang == null)
			return;
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		SimpleDateFormat sdfkefang = new SimpleDateFormat("yyyy-MM-dd");
		kefang.setName(name);
		kefang.setPrice(price == null ? (double) 0 : new Double(price));
		DALBase.update(kefang);
		if (forwardurl == null) {
			forwardurl = "/admin/kefangmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/****************** 加载内部支持******************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		String jdid = request.getParameter("jdid");
		if (jdid != null) {
			Jiudian jiudian = (Jiudian) DALBase.load("jiudian", "where id="
					+ jdid);
			if (jiudian != null) {
				request.setAttribute("jiudian", jiudian);
			}
		}
		if (id != null) {
			Kefang kefang = (Kefang) DALBase.load("kefang", "where id=" + id);
			if (kefang != null) {
				request.setAttribute("kefang", kefang);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/kefangadd.jsp";
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

	/******************* 数据绑定内部支持*****************/
	public void binding() {
		String filter = "where 1=1 ";
		String name = request.getParameter("name");
		String jdid=request.getParameter("jdid");
		if (name != null)
			filter += "  and name like '%" + name + "%'  ";
		if(jdid!=null)
			filter += " and jdid="+jdid;
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
		List<Kefang> listkefang = DALBase.getPageEnity("kefang", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("kefang", filter == null ? ""
				: filter);
		request.setAttribute("listkefang", listkefang);
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
			forwardurl = "/admin/kefangmanager.jsp";
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
