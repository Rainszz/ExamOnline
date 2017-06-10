package com.yhl.ex.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;

import com.yhl.ex.bean.QuestionsItem;
import com.yhl.ex.dao.QuestionsDao;
import com.yhl.ex.dao.impl.QuestionsDaoImpl;

public class Test {
	
	public static void main(String[] args) {
		String sheetTile = "题库列表";
		String[] title = {"科目","阶段","机试题总数","笔试题总数"};
		QuestionsDao qDao = new QuestionsDaoImpl();
		List<QuestionsItem> data = qDao.getQuestions(1, 1);
		//1，创建工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		//2，创建工作表
		HSSFSheet sheet = workbook.createSheet();
		//创建第一行
		HSSFRow row = sheet.createRow(0);
		//合并第一行的0-3的单元格,并设置整个表格的标题
		CellRangeAddress region1 = new CellRangeAddress(0, 0, (short) 0, (short) 3); //参数1：起始行 参数2：终止行 参数3：起始列 参数4：终止列   
		sheet.addMergedRegion(region1); 
		//新建单元格样式
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框    
		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框    
		cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框    
		cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框 
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中  
		HSSFFont font = workbook.createFont();    
		font.setFontName("仿宋_GB2312");    
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体显示    
		font.setFontHeightInPoints((short) 16);  //字体大小  
		cellStyle.setFont(font);//选择需要用到的字体格式   
//		sheet.setColumnWidth(0, 3000);   
		HSSFCell cell = row.createCell(0);
		cell.setCellValue(sheetTile);
		cell.setCellStyle(cellStyle);
		//创建标题行,索引为1
		row = sheet.createRow(1);
		//并通过for循环为标题行的每一个单元格设置标题
		for (int i = 0; i < title.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(title[i]);
			cell.setCellStyle(cellStyle);
		}
		for (int i = 2; i < data.size()+2; i++) {
			QuestionsItem questionsItem = data.get(i-2);
			//创建当前行
			row = sheet.createRow(i);
			//创建当前行的每一个单元格并赋值
			cell = row.createCell(0);
			cell.setCellValue(questionsItem.getPaper().getQsId());
			cell.setCellStyle(cellStyle);
			cell = row.createCell(1);
			cell.setCellValue(questionsItem.getPaper().getStId());
			cell.setCellStyle(cellStyle);
			cell = row.createCell(2);
			cell.setCellValue(questionsItem.getMachineCount());
			cell.setCellStyle(cellStyle);
			cell = row.createCell(3);
			cell.setCellValue(questionsItem.getChoiceCount());
			cell.setCellStyle(cellStyle);
		}
		
		File file = new File("e:/papers.xls");
		try {
			file.createNewFile();
			FileOutputStream fileOutputStream = new FileOutputStream(file);
			workbook.write(fileOutputStream);
			fileOutputStream.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
