package com.daowen.action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.daowen.bll.SystemParam;
import com.daowen.dal.DALBase;
import com.daowen.entity.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminLogin extends ActionSupport {

	public String execute() {
		
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype.equals("login")) {
			login(request, response);
		}

		return null;
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {

		String usertype = request.getParameter("usertype");//获取用户类型

		String validcode = (String) request.getSession().getAttribute(
				"validcode");//获取保存在session中的验证码

		String inputvalidcode = request.getParameter("validcode");//获取验证码
        //判断验证码是否为空，并且判断输入的验证码是否和保存在session中的验证码一致
		if (validcode != null && !validcode.equals(inputvalidcode)) {

			System.out.println("系统验证错误");
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>系统验证码错误");//显示错误信息

			// 分发请求参数
			dispatchParams(request, response);
			try {
				request.getRequestDispatcher("/admin/login.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return;

		}

		System.out.println("验证码=" + validcode);

		if (usertype != null && usertype.equals("0")) {
			adminLogin(request, response);

		}

		

	}
//编写servlet方法，实现管理员登录
	private void adminLogin(HttpServletRequest request,
			HttpServletResponse response) {

		String username = request.getParameter("username");//获取账户名
		String password = request.getParameter("password");//获取密码
		String usertype = request.getParameter("usertype");//获取用户类型

		String action = request.getParameter("action");//获取单击登录按钮的行为

		Users u = (Users) DALBase.load("users", " where username='" + username
				+ "' and password='" + password + "'");//获取数据库中users表的账户名与密码并赋给u

		if (u != null) {    //判断u是否为空

			HttpSession session = request.getSession();
			u.setLogtimes(u.getLogtimes() + 1);//登录次数+1
			DALBase.update(u);//更新数据库
			session.setAttribute("users", u);//

			try {
				response.sendRedirect(SystemParam.getSiteRoot()
						+ "/admin/index.jsp");
			} catch (IOException e) {   //异常处理
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {

			// 分发
			dispatchParams(request, response);
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>用户名与密码不匹配");//保存错误提示信息到request中

			System.out.println("系统用户登录失败");
			//转到管理员登录页面
			try {
				request.getRequestDispatcher("/admin/login.jsp").forward(
						request, response);
			} catch (ServletException e) {  //异常处理
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	


	public void dispatchParams(HttpServletRequest request,
			HttpServletResponse response) {
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String paramname = params.nextElement().toString();
			String value = request.getParameter(paramname);
			request.setAttribute(paramname, value);

		}
	}

}
