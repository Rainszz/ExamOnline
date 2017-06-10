package com.yhl.ex.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yhl.ex.bean.Account;
import com.yhl.ex.dao.AccountDao;
import com.yhl.ex.dao.impl.AccountDaoImpl;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("user.name");
		String userpwd = request.getParameter("user.pwd");
		int role = 1;
		role = Integer.parseInt(request.getParameter("user.role"));
		Account account = new Account();
		account.setaName(username);
		account.setaPwd(userpwd);
		account.setrType(role);
		AccountDao accountDao = new AccountDaoImpl();
		Object obj = accountDao.login(account);
		if(obj != null){
			request.getSession().setAttribute("account", account);
			request.getSession().setAttribute("person", obj);
			request.getSession().setAttribute("role", role);
			request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("login.jsp?error=yes").forward(request, response);
		}
	}
}


