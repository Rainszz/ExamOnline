package com.yhl.ex.dao;

import java.util.List;

import com.yhl.ex.bean.PaperDetail;
import com.yhl.ex.bean.QuestionsItem;

public interface QuestionsDao {
	//根据专业和阶段来查询所有的题库
	public List<QuestionsItem> getQuestions(int mjId,int stId);
	//根据试卷编号查询所有的机试题
	public PaperDetail getPaperDetail(int pId, int p,int qType);

}
