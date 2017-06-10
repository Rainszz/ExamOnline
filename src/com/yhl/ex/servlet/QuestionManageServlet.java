package com.yhl.ex.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yhl.ex.bean.PaperDetail;
import com.yhl.ex.bean.QuestionsItem;
import com.yhl.ex.dao.QuestionsDao;
import com.yhl.ex.dao.impl.QuestionsDaoImpl;

/**
 * Servlet implementation class QuestionManageServlet
 */
public class QuestionManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public QuestionManageServlet() {
		super();
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		if("questions".equals(cmd)){
			getQuestions(request,response);
		}else if("paperDetail".equals(cmd)){
			getPaperDetail(request,response);
		}else if("".equals(cmd)){

		}
	}

	//根据专业方向和阶段获取所有的试卷
	private void getQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		QuestionsDao questionsDao = new QuestionsDaoImpl();
		int mjId = 1;
		int stId = 1;
		String major = request.getParameter("major");
		String stage = request.getParameter("stage");
		if(major != null && !"".equals(major) && stage != null && !"".equals(stage)){
			mjId = Integer.parseInt(major);
			stId = Integer.parseInt(stage);
		}
		List<QuestionsItem> questions = questionsDao.getQuestions(mjId, stId);
		request.getSession().setAttribute("questions", questions);
		request.getRequestDispatcher("jsp/questionsManage.jsp").forward(request, response);
	}

	private void getPaperDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		QuestionsDao questionsDao = new QuestionsDaoImpl();
		int pId = Integer.parseInt(request.getParameter("pid"));
		int qType = Integer.parseInt(request.getParameter("qType"));
		int p = 1;
		String pNow = request.getParameter("p");
		if(pNow != null && !"".equals(pNow)){
			p = Integer.parseInt(pNow);
		}
		PaperDetail paperDetail= questionsDao.getPaperDetail(pId,p,qType);
		request.getSession().setAttribute("paperDetail", paperDetail);	
		if(paperDetail != null){
			request.getSession().setAttribute("qType", qType);
			request.getRequestDispatcher("jsp/paperDetail.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("jsp/pageNull.jsp").forward(request, response);
	}
}

}
