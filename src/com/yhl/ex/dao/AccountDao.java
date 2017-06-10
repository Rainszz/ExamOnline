package com.yhl.ex.dao;

import java.util.List;

import com.yhl.ex.bean.Account;
import com.yhl.ex.bean.PaperDetail;
import com.yhl.ex.bean.QuestionsItem;

public interface AccountDao {
	//登录
	public Object login(Account account);

}
