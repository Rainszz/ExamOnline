package com.yhl.ex.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import com.yhl.ex.bean.Account;
import com.yhl.ex.bean.Manager;
import com.yhl.ex.bean.PaperDetail;
import com.yhl.ex.bean.QuestionsItem;
import com.yhl.ex.bean.Student;
import com.yhl.ex.bean.Teacher;
import com.yhl.ex.dao.AccountDao;
import com.yhl.ex.util.DBManager;

public class AccountDaoImpl implements AccountDao {
	private Connection con;
	private PreparedStatement ps;

	@Override
	public Object login(Account account) {
		// TODO Auto-generated method stub
		con = DBManager.getConnection();
		String sql = "select * from t_account where aName = ? and aPwd = ? and rType = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, account.getaName());
			ps.setString(2, account.getaPwd());
			ps.setInt(3, account.getrType());
			ResultSet rs = ps.executeQuery();
			account = new Account();
			if(rs.next()){
				account.setaID(rs.getInt("aID"));
				account.setaName(rs.getString("aName"));
				account.setaPwd(rs.getString("aPwd"));
				account.setId(rs.getInt("id"));
				account.setrType(rs.getInt("rType"));
			}
			if(account != null){
				return getLoginInfo(account);
			}
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

	private Object getLoginInfo(Account account){
		int rType = account.getrType();
		int id = account.getId();
		String sql = "";
		switch(rType){
		case 1:
			sql = "select * from t_student where sID = ?";
			break;
		case 2:
			sql = "select * from t_teacher where tID = ?";
			break;
		case 4:
			sql = "select * from t_manager where mID = ?";
			break;
		}
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				return getInfo(rType,rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	private Object getInfo(int rType,ResultSet rs){
		try {
			switch(rType){
			case 1:
				Student student = new Student();
				student.setsID(rs.getInt("sID"));
				student.setClassId(rs.getInt("classId"));
				student.setEntrance(rs.getString("entrance"));
				student.setMajorId(rs.getInt("majorId"));
				student.setrID(rs.getInt("rID"));
				student.setsName(rs.getString("sName"));
				student.setsSex(rs.getString("sSex"));
				//TODO
				return student;
			case 2:
				Teacher teacher = new Teacher();
				teacher.settID(rs.getInt("tID"));
				teacher.setrID(rs.getInt("rID"));
				teacher.settName(rs.getString("tName"));
				teacher.settPos(rs.getInt("tPos"));
				teacher.settSex(rs.getString("tSex"));
				//TODO
				return teacher;
			case 4:
				Manager manager = new Manager();
				manager.setmID(rs.getInt("mID"));
				manager.setmName(rs.getString("mName"));
				manager.setrID(rs.getInt("rID"));
				//TODO
				return manager;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


}
