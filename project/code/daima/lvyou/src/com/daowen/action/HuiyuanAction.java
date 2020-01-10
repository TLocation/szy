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


public class HuiyuanAction extends PageActionBase {
	
	
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		
        //如果触发的是"登录"请求
		if (actiontype.equals("login")) {
			login();
		}
		//如果触发的是"退出"请求
		if (actiontype.equals("exit")) {
			exit();
		}
		//如果触发的是"修改密码"请求
		if (actiontype.equals("modifyPw")) {
			modifyPw();
		}
		//如果触发的是"充值"请求
		if (actiontype.equals("chongzhi")) {
			chongzhi();
		}
		
	}
//充值功能的实现
	private void chongzhi() {
		String jine = request.getParameter("jine");//获取金额
		String forwardurl = request.getParameter("forwardurl");

		String id = request.getParameter("id");//获取会员id号
		if (id == null || id == "")//判断id是否为空
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase
				.load(Huiyuan.class, new Integer(id));//加载数据库中会员表信息并赋给huiyuan
		//判断会员是否为空
		if (huiyuan != null) {
			//会员的余额等于现有的余额加现充值的金额
			huiyuan.setYue(huiyuan.getYue() + Float.parseFloat(jine));
			DALBase.update(huiyuan);//更新会员信息表
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				if (forwardurl != null)
					response.sendRedirect(SystemParam.getSiteRoot()
							+ forwardurl);
			} catch (IOException e) {//异常处理

				e.printStackTrace();
			}
		}

	}
//修改密码
	private void modifyPw() {

		String password1=request.getParameter("password1");//获取原始密码
		String  forwardurl=request.getParameter("forwardurl");
		String repassword1=request.getParameter("repassword1");//获取新密码
		String repassword2=request.getParameter("repassword2");
		String id = request.getParameter("id");//获取会员id号
		if (id == null||id=="")//判断id号是否为空
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase.load(Huiyuan.class, new Integer(id));
		if(huiyuan!=null)
		{
			huiyuan.setPassword(repassword1);//
			DALBase.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			try {
				response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
			} catch (IOException e) {//异常处理
				
				e.printStackTrace();
			}
		}
		

	}
//退出系统
	private void exit() {

		if (request.getSession().getAttribute("huiyuan") != null) {

			System.out.println("系统退出");
			request.getSession().removeAttribute("huiyuan");


		}
		 if(request.getSession().getAttribute("zhongjie")!=null){
				
				
				request.getSession().removeAttribute("zhongjie");
				
				
				
			}

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("huiyuan", " where id=" + id);
		binding();
	}

	private void login() {

		String usertype = request.getParameter("usertype");

		if (usertype != null && usertype.equals("0")) {
			huiyuanLogin();
		}
		
		
		

	}

//会员登录	
	private void huiyuanLogin() {

		String accountname = request.getParameter("accountname");//获取提交的账户名
		String password = request.getParameter("password");//获取提交的密码

		String filter = MessageFormat.format(
				"where accountname=''{0}'' and password=''{1}''", accountname,
				password);

		Huiyuan huiyuan = (Huiyuan) DALBase.load("huiyuan", filter);
		String errorurl=request.getParameter("errorurl");
		String forwardurl=request.getParameter("forwardurl");
        //判断用户名和密码是否和数据库huiyuan表中数据一致
		if (huiyuan != null && huiyuan.getPassword().equals(password)) {

			try {
              
				huiyuan.setLogtimes(huiyuan.getLogtimes() + 1);//登录次数+1
				DALBase.update(huiyuan);
				//把huiyuan信息保存到session里
				request.getSession().setAttribute("huiyuan", huiyuan);
				if (forwardurl != null)
					response.sendRedirect(SystemParam.getSiteRoot()
							+ forwardurl);

				else {
                   //转发至会员中心页面
					response.sendRedirect(SystemParam.getSiteRoot() + "/e/huiyuan/accountinfo.jsp");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
            
			dispatchParams(request, response);
			//否则记录集为空，表明失败，提示错误信息
			request.setAttribute("message", "<label class='error'>用户名与密码不匹配</label>");
			try {

				request.getRequestDispatcher(errorurl).forward(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	
	
	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String accountname = request.getParameter("accountname");//获取账户名
		String password = request.getParameter("password");//获取密码
		String xtype = request.getParameter("xtype");

		String email = request.getParameter("email");//获取邮箱
       //判断账户名是否重复，即在huiyuan表存在
		if (DALBase.isExist("huiyuan", "where accountname='" + accountname
				+ "'")) {
			try {
				//如存在则提示错误提示信息
				request.setAttribute("errormsg",
						"<label class='error'>用户名已经存在</label>");
				dispatchParams(request, response);
				//转发至注册页面
				request.getRequestDispatcher("/e/register.jsp").forward(
						request, response);
			} catch (ServletException e) {//异常处理
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

		Huiyuan huiyuan = new Huiyuan();
		huiyuan.setAccountname(accountname == null ? "" : accountname);
		huiyuan.setPassword(password == null ? "" : password);
		huiyuan.setXtype("");
		huiyuan.setNickname(accountname);

		huiyuan.setRegdate(new Date());

		huiyuan.setLogtimes(0);
		huiyuan.setTouxiang(SystemParam.getSiteRoot()
				+ "/upload/nopic.jpg");
		huiyuan.setEmail(email == null ? "" : email);
		huiyuan.setMobile("");
		huiyuan.setSex("男");
		huiyuan.setAddress("");
		huiyuan.setJibie("初级");
		huiyuan.setName("");
		huiyuan.setZhiye("");
		huiyuan.setAihao("");
		huiyuan.setStatus(1);
		huiyuan.setYue(0);
		huiyuan.setXtype("普通会员");
		DALBase.save(huiyuan);//保存用户信息到数据库
		try {
			//转发至注册结果界面
			response.sendRedirect("../e/regresult.jsp");
		} catch (IOException e) {//异常处理
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Huiyuan huiyuan = (Huiyuan) DALBase
				.load(Huiyuan.class, new Integer(id));
		if (huiyuan == null)
			return;
		String accountname = request.getParameter("accountname");
		
		String nickname = request.getParameter("nickname");
		String forwardurl = request.getParameter("forwardurl");
	
		String touxiang = request.getParameter("touxiang");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String jibie = request.getParameter("jibie");
		String name = request.getParameter("name");
		String zhiye = request.getParameter("zhiye");
		String aihao = request.getParameter("aihao");
		String status = request.getParameter("status");
		SimpleDateFormat sdfhuiyuan = new SimpleDateFormat("yyyy-MM-dd");
		huiyuan.setAccountname(accountname);

		huiyuan.setNickname(nickname);

		huiyuan.setTouxiang(touxiang);
		huiyuan.setEmail(email);
		huiyuan.setMobile(mobile);
		huiyuan.setSex(sex);
		huiyuan.setAddress(address);
		huiyuan.setJibie(jibie);
		huiyuan.setName(name);
		huiyuan.setZhiye(zhiye);
		huiyuan.setAihao(aihao);

		DALBase.update(huiyuan);
		request.getSession().setAttribute("huiyuan", huiyuan);
		try {
		   if(forwardurl!=null)
			  response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		   else
			  response.sendRedirect(SystemParam.getSiteRoot()+"/e/huiyuan/modifyinfores.jsp");
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
		if (id != null) {
			Huiyuan huiyuan = (Huiyuan) DALBase.load("huiyuan", "where id="
					+ id);
			if (huiyuan != null) {
				request.setAttribute("huiyuan", huiyuan);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		try {
			request.getRequestDispatcher("huiyuanadd.jsp").forward(request,
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
		String filter = "";
		//
		int pageindex = 1;// 定义当前是第几页
		int pagesize = 10;// 定义每页要显示的记录数
		// 获取当前分页

		String accountname = request.getParameter("accountname");

		if (accountname != null)
			filter = "  where accountname like '%" + accountname + "%'  ";

		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Huiyuan> listhuiyuan = DALBase.getPageEnity("huiyuan", filter,
				pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("huiyuan",
				filter == null ? "" : filter);
		request.setAttribute("listhuiyuan", listhuiyuan);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		try {
			request.getRequestDispatcher("/admin/huiyuanmanager.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
