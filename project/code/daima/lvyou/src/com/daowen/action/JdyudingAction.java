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
 * 
 *         酒店预订控制
 * 
 */
public class JdyudingAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
		if (actiontype.equals("payment"))
			pament();
	}
//付款
	private void pament() {
		
		
		String ddid = request.getParameter("id");

		String accountname = request.getParameter("accountname");
            
		String errorurl = request.getParameter("errorurl");

		if (ddid != null) {
			Jdyuding dingdan = (Jdyuding) DALBase.load("jdyuding", "where id="
					+ ddid);

			if (accountname != null) {
				Huiyuan hy = (Huiyuan) DALBase.load("huiyuan",
						"where accountname='" + accountname + "'");

				if (hy.getYue() < dingdan.getTotalprice()) {

					request.setAttribute("errormsg",
							"<label class='error'>账户余额不足于支付订单,请充值</label>");
					try {
						request.getRequestDispatcher(errorurl).forward(request,
								response);

						return;
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				} else {

					hy.setYue((float) (hy.getYue() - dingdan.getTotalprice()));
					DALBase.update(hy);

					dingdan.setStatus(2);
					DALBase.update(dingdan);
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
		DALBase.delete("jdyuding", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String jdtitle = request.getParameter("jdtitle");
		String kfname = request.getParameter("kfname");
		String begindate = request.getParameter("begindate");
		String enddate = request.getParameter("enddate");
		String tianshu = request.getParameter("tianshu");
		String ruzhuren = request.getParameter("ruzhuren");
		String shuliang = request.getParameter("shuliang");
		String mobile = request.getParameter("mobile");
		String price = request.getParameter("price");
		String ydren = request.getParameter("ydren");
		SimpleDateFormat sdfjdyuding = new SimpleDateFormat("yyyy-MM-dd");
		Jdyuding jdyuding = new Jdyuding();
		jdyuding.setJdtitle(jdtitle == null ? "" : jdtitle);
		jdyuding.setKfname(kfname == null ? "" : kfname);
		if (begindate != null) {
			try {
				jdyuding.setBegindate(sdfjdyuding.parse(begindate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			jdyuding.setBegindate(new Date());
		}
		if (enddate != null) {
			try {
				jdyuding.setEnddate(sdfjdyuding.parse(enddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			jdyuding.setEnddate(new Date());
		}
		int days=(int)(jdyuding.getEnddate().getTime()-jdyuding.getBegindate().getTime())/(1000*36000);
		days=(days/24)==0?1:(days/24);
		jdyuding.setTianshu(days);
		jdyuding.setRuzhuren(ruzhuren == null ? "" : ruzhuren);
		jdyuding.setShuliang(shuliang == null ? 0 : new Integer(shuliang));
		jdyuding.setMobile(mobile == null ? "" : mobile);
		jdyuding.setStatus(1);
		jdyuding.setPrice(price==null?0:Double.parseDouble(price));
		jdyuding.setTotalprice(jdyuding.getShuliang()*jdyuding.getPrice()*jdyuding.getTianshu());
		jdyuding.setYdren(ydren == null ? "" : ydren);
		DALBase.save(jdyuding);
		if (forwardurl == null) {
			forwardurl = "/admin/jdyudingmanager.do?actiontype=get";
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
		Jdyuding jdyuding = (Jdyuding) DALBase.load(Jdyuding.class,
				new Integer(id));
		if (jdyuding == null)
			return;
		String jdtitle = request.getParameter("jdtitle");
		String kfname = request.getParameter("kfname");
		String begindate = request.getParameter("begindate");
		String enddate = request.getParameter("enddate");
		String tianshu = request.getParameter("tianshu");
		String ruzhuren = request.getParameter("ruzhuren");
		String shuliang = request.getParameter("shuliang");
		String mobile = request.getParameter("mobile");
		String status = request.getParameter("status");
		String ydren = request.getParameter("ydren");
		SimpleDateFormat sdfjdyuding = new SimpleDateFormat("yyyy-MM-dd");
		jdyuding.setJdtitle(jdtitle);
		jdyuding.setKfname(kfname);
		if (begindate != null) {
			try {
				jdyuding.setBegindate(sdfjdyuding.parse(begindate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (enddate != null) {
			try {
				jdyuding.setEnddate(sdfjdyuding.parse(enddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		jdyuding.setTianshu(tianshu == null ? 0 : new Integer(tianshu));
		jdyuding.setRuzhuren(ruzhuren);
		
		jdyuding.setMobile(mobile);
		
		jdyuding.setYdren(ydren);
		DALBase.update(jdyuding);
		if (forwardurl == null) {
			forwardurl = "/admin/jdyudingmanager.do?actiontype=get";
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
			Jdyuding jdyuding = (Jdyuding) DALBase.load("jdyuding", "where id="
					+ id);
			if (jdyuding != null) {
				request.setAttribute("jdyuding", jdyuding);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/jdyudingadd.jsp";
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
		String ydren=request.getParameter("ydren");
		String jdtitle = request.getParameter("jdtitle");
		if (jdtitle != null)
			filter += "  and jdtitle like '%" + jdtitle + "%'  ";	
		Huiyuan huiyuan = (Huiyuan)request.getSession().getAttribute("huiyuan");
		if(huiyuan!=null && huiyuan.getAccountname()!=null)
			filter += "  and ydren ='" + huiyuan.getAccountname() + "'  ";
			
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
		List<Jdyuding> listjdyuding = DALBase.getPageEnity("jdyuding", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("jdyuding",
				filter == null ? "" : filter);
		request.setAttribute("listjdyuding", listjdyuding);
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
			forwardurl = "/admin/jdyudingmanager.jsp";
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
