package com.yhl.ex.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yhl.ex.bean.PageBean;
import com.yhl.ex.bean.Paper;
import com.yhl.ex.bean.PaperDetail;
import com.yhl.ex.bean.Question;
import com.yhl.ex.bean.QuestionsItem;
import com.yhl.ex.dao.QuestionsDao;
import com.yhl.ex.util.DBManager;

public class QuestionsDaoImpl implements QuestionsDao{
	private Connection con;
	private PreparedStatement ps;

	@Override
	public List<QuestionsItem> getQuestions(int mjId, int stId) {
		// TODO Auto-generated method stub
		List<QuestionsItem> list = new ArrayList<QuestionsItem>();
		con = DBManager.getConnection();
		
		String sql = "select * from t_paper where mjId = ? and stId = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, mjId);
			ps.setInt(2, stId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				QuestionsItem questionsItem = new QuestionsItem();
				Paper paper = new Paper();
				paper.setMjId(rs.getInt("mjId"));
				paper.setpId(rs.getInt("pId"));
				paper.setpName(rs.getString("pName"));
				paper.setPsId(rs.getInt("psId"));
				paper.setpTime(rs.getInt("pTime"));
				paper.setpTotalScore(rs.getInt("pTotalScore"));
				paper.setqNumber(rs.getInt("qNumber"));
				paper.setqScore(rs.getInt("qScore"));
				paper.setQsId(rs.getInt("qsId"));
				paper.setStId(rs.getInt("stId"));
				int machineCount = getMachineCount(paper.getpId());
				int choiceCount = getChoiceCount(paper.getpId());
//				String mjName = getMajorName(paper.getMjId());
				String subName = getSubName(paper.getQsId());
				String stName = getStageName(paper.getStId());
				questionsItem.setPaper(paper);
				questionsItem.setSubName(subName);
				questionsItem.setStageName(stName);
				questionsItem.setChoiceCount(choiceCount);
				questionsItem.setMachineCount(machineCount);
				list.add(questionsItem);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	private String getSubName(int qsId) {
		// TODO Auto-generated method stub
		String subName = "";
		String sql = "select qsName from t_qSub where qsId = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, qsId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				subName = rs.getString(1);
			}
			return subName;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private int getMachineCount(int pid){
		int count = 0;
		String sql = "select count(*) from t_question where qid in (select qId from t_paper_question where pId = ?) and qtId = 3;";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	private int getChoiceCount(int pid){
		int count = 0;
		String sql = "select count(*) from t_question  where qid in (select qId from t_paper_question where pId = ?) and qtId = 1 or qtId = 2;";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	private String getMajorName(int mjId){
		String sql = "select mjName from t_major where mjId = ?";
		String majorName = "";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, mjId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				majorName = rs.getString("mjName");
			}
			return majorName;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private String getStageName(int stId){
		String sql = "select stName from t_stage where stId = ?";
		String stName = "";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, stId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				stName = rs.getString("stName");
			}
			return stName;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PaperDetail getPaperDetail(int pId,int p,int qType) {
		// TODO Auto-generated method stub
		PaperDetail paperDetail = new PaperDetail();
		PageBean pageBean = new PageBean();
		List<Object> list = new ArrayList<Object>();
		con = DBManager.getConnection();
		Paper paper = getPaper(pId);
		String subName = getSubName(paper.getQsId());
		int pageSize = pageBean.getPageSize();
		int count = getCount(pId,qType);
		if(count == 0){
			return null;
		}
		pageBean.setCount(count);
		pageBean.setP(p);
		String sql = "";
		/*
		 * 根据类型来查询数据库
		 * qType=1：查询机试题
		 * qType=2:查询笔试题
		 * */
		if(qType == 1){
			sql = "select "
					+ "top "+pageSize+" "
					+"* "
					+"from "
					+"(select * from t_question where qtId = 3 and qId in (select qId from t_paper_question where pId = ?)) t_q "
					+ "where "
					+ "qId not in ( "
					+ "select "
					+ "top "+(pageSize*(pageBean.getP()-1))+" "
					+ "qId from (select * from t_question where qtId = 3 and qId in (select qId from t_paper_question where pId = ?)) t_q "
					+ ")";
		}else{
			sql = "select "
					+ "top "+pageSize+" "
					+"* "
					+"from "
					+"(select * from t_question where qtId <> 3 and qId in (select qId from t_paper_question where pId = ?)) t_q "
					+ "where "
					+ "qId not in ( "
					+ "select "
					+ "top "+(pageSize*(pageBean.getP()-1))+" "
					+ "qId from (select * from t_question where qtId <> 3 and qId in (select qId from t_paper_question where pId = ?)) t_q "
					+ ")";
		}
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, pId);
			ps.setInt(2, pId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Question question = new Question();
				question.setAnswer(rs.getString("answer"));
				question.setOptionA(rs.getString("optionA"));
				question.setOptionB(rs.getString("optionB"));
				question.setOptionC(rs.getString("optionC"));
				question.setOptionD(rs.getString("optionD"));
				question.setQdId(rs.getInt("qdId"));
				question.setqId(rs.getInt("qId"));
				question.setQsId(rs.getInt("qsId"));
				question.setQtId(rs.getInt("qtId"));
				question.setqTitle(rs.getString("qTitle"));
				list.add(question);
			}
			paperDetail.setPaper(paper);
			pageBean.setData(list);
			paperDetail.setSubName(subName);
			paperDetail.setPageBean(pageBean);
			return paperDetail;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	//根据pid获取paper对象的所有数据
	private Paper getPaper(int pId){
		Paper paper = null;
		String sql = "select * from t_paper where pId = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, pId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				paper = new Paper();
				paper.setMjId(rs.getInt("mjId"));
				paper.setpId(rs.getInt("pId"));
				paper.setpName(rs.getString("pName"));
				paper.setPsId(rs.getInt("psId"));
				paper.setpTime(rs.getInt("pTime"));
				paper.setpTotalScore(rs.getInt("pTotalScore"));
				paper.setqNumber(rs.getInt("qNumber"));
				paper.setqScore(rs.getInt("qScore"));
				paper.setQsId(rs.getInt("qsId"));
				paper.setStId(rs.getInt("stId"));
			}
			return paper;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	//获取总共多少条数据
	private int getCount(int pId,int qType){
		int count = 1;
		String sql = "";
		if(qType == 1){
			sql  = "select count(*) from t_question where qtId = 3 and qId in (select qId from t_paper_question where pId = ?);";
		}else{
			sql = "select count(*) from t_question where qtId <> 3 and qId in (select qId from t_paper_question where pId = ?);";
		}
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, pId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
}
