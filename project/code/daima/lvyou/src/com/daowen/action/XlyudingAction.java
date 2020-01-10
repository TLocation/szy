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

public class XlyudingAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
		// 如果是获取表单数据

		if (actiontype.equals("payfor"))
			fukuan();

	}
	
//付款功能
	private void fukuan() {

		String ddid = request.getParameter("xlydid");//获取线路id

		String accountname = request.getParameter("accountname");//获取账户名

		String errorurl = request.getParameter("errorurl");//出错提示

		if (ddid != null) {//判断线路id是否为空
			Xlyuding dingdan = (Xlyuding) DALBase.load("xlyuding", "where id="
					+ ddid);//加载数据库中线路预定表中的id字段并赋给dingdan
			//判断账户名是否为空
			if (accountname != null) {
				//加载数据库中会员表中的accountname字段并赋给hy
				Huiyuan hy = (Huiyuan) DALBase.load("huiyuan",
						"where accountname='" + accountname + "'");
               //判断会员现有的余额是否小于付款订单金额
				if (hy.getYue() < dingdan.getJine()) {
                     //如果是则会出现提示信息
					request.setAttribute("errormsg",
							"<label class='error'>账户余额不足于支付订单,请充值</label>");
					try {
						request.getRequestDispatcher(errorurl).forward(request,
								response);

						return;
					} catch (ServletException e) {//异常处理
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else {
					//用当前余额减去付款订单金额就等到最终剩下的余额
					hy.setYue((float) (hy.getYue() - dingdan.getJine()));
					DALBase.update(hy);//更新hy字段
					dingdan.setStatus("已付款");//更改订单状态为已付款
					DALBase.update(dingdan);//更新dingdan表
					request.getSession().setAttribute("huiyuan", hy);
				}

			}

		}
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl != null)
			try {
				response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
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
		DALBase.delete("xlyuding", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String xlid = request.getParameter("xlid");
		String xltitle = request.getParameter("xltitle");
		String yddate = request.getParameter("yddate");
		String renshu = request.getParameter("renshu");
		String hyname = request.getParameter("hyname");
		String lianxiren = request.getParameter("lianxiren");
		String mobile = request.getParameter("mobile");
		String jine = request.getParameter("jine");
		String fangjiashu = request.getParameter("fangjiashu");
		String status = request.getParameter("status");
		SimpleDateFormat sdfxlyuding = new SimpleDateFormat("yyyy-MM-dd");
		Xlyuding xlyuding = new Xlyuding();
		xlyuding.setXlid(xlid == null ? 0 : new Integer(xlid));
		xlyuding.setXltitle(xltitle == null ? "" : xltitle);
		if (yddate != null) {
			try {
				xlyuding.setYddate(sdfxlyuding.parse(yddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			xlyuding.setYddate(new Date());
		}
		xlyuding.setRenshu(renshu == null ? 0 : new Integer(renshu));
		xlyuding.setHyname(hyname == null ? "" : hyname);
		xlyuding.setLianxiren(lianxiren == null ? "" : lianxiren);
		xlyuding.setMobile(mobile == null ? "" : mobile);
		xlyuding.setJine(jine == null ? (double) 0 : new Double(jine));
		xlyuding.setFangjiashu(fangjiashu == null ? 0 : new Integer(fangjiashu));
		xlyuding.setStatus(status == null ? "" : status);
		DALBase.save(xlyuding);
		// 保存附件
		// attachments(request,response,new
		// Integer(xlyuding.getId()).toString());
		if (forwardurl == null) {
			forwardurl = "/admin/xlyudingmanager.do?actiontype=get";
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
		Xlyuding xlyuding = (Xlyuding) DALBase.load(Xlyuding.class,
				new Integer(id));
		if (xlyuding == null)
			return;
		String xlid = request.getParameter("xlid");
		String xltitle = request.getParameter("xltitle");
		String yddate = request.getParameter("yddate");
		String renshu = request.getParameter("renshu");
		String hyname = request.getParameter("hyname");
		String lianxiren = request.getParameter("lianxiren");
		String mobile = request.getParameter("mobile");
		String jine = request.getParameter("jine");
		String fangjiashu = request.getParameter("fangjiashu");
		String status = request.getParameter("status");
		SimpleDateFormat sdfxlyuding = new SimpleDateFormat("yyyy-MM-dd");
		xlyuding.setXlid(xlid == null ? 0 : new Integer(xlid));
		xlyuding.setXltitle(xltitle);
		if (yddate != null) {
			try {
				xlyuding.setYddate(sdfxlyuding.parse(yddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		xlyuding.setRenshu(renshu == null ? 0 : new Integer(renshu));
		xlyuding.setHyname(hyname);
		xlyuding.setLianxiren(lianxiren);
		xlyuding.setMobile(mobile);
		xlyuding.setJine(jine == null ? (double) 0 : new Double(jine));
		xlyuding.setFangjiashu(fangjiashu == null ? 0 : new Integer(fangjiashu));
		xlyuding.setStatus(status);
		DALBase.update(xlyuding);
		// attachments(request,response,new
		// Integer(xlyuding.getId()).toString());
		if (forwardurl == null) {
			forwardurl = "/admin/xlyudingmanager.do?actiontype=get";
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
			Xlyuding xlyuding = (Xlyuding) DALBase.load("xlyuding", "where id="
					+ id);
			if (xlyuding != null) {
				request.setAttribute("xlyuding", xlyuding);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/xlyudingadd.jsp";
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
		String status = request.getParameter("status");
		String accountname=request.getParameter("accountname");
		if (status != null)
			filter += "  and status like '%" + status + "%'  ";
		Huiyuan huiyuan = (Huiyuan)request.getSession().getAttribute("huiyuan");
		if(huiyuan!=null && huiyuan.getAccountname()!=null)
			filter+="  and hyname='"+huiyuan.getAccountname()+"'";
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
		List<Xlyuding> listxlyuding = DALBase.getPageEnity("xlyuding", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("xlyuding",
				filter == null ? "" : filter);
		request.setAttribute("listxlyuding", listxlyuding);
		
		System.out.println("filter;;--------------"+filter);

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
			forwardurl = "/admin/xlyudingmanager.jsp";
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
