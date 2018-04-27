package com.kd.mvc.utils;


import com.kd.mvc.dao.FAQDao;
import com.kd.mvc.dao.ListBlackDao;
import com.kd.mvc.dao.ListCauseDao;
import com.kd.mvc.entity.DListBlack;
import com.kd.mvc.entity.DListCause;
import com.kd.mvc.entity.FAQ;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.*;
import org.apache.ibatis.session.SqlSession;

import java.io.*;
import java.util.*;


/**
 * Created by hongjian.chen on 2017/10/24.
 */
public class ExcelTool {

    private static SqlSession session = MybatisUtil.getSession();

    public static void importExcel(InputStream is) throws Exception {
        Workbook book = null;
        String reason;
        try {
            book = Workbook.getWorkbook(is);
            Sheet sheet = book.getSheet(0);
            int rows = sheet.getRows();
            System.out.println("rows=" + rows);
            for (int i = 1; i < rows; i++) {
                DListBlack black = new DListBlack();
                DListCause cause = new DListCause();
                Cell[] cell = sheet.getRow(i);
                reason = cell[cell.length - 1].getContents();
                int len = cell.length;
                black.setId(cell[0].getContents());
                black.setTypeId(1);
                black.setAppId("9");
                black.setUpdateDate(new Date());
                cause.setListId(cell[0].getContents());
                cause.setCause(reason);
                session.getMapper(ListBlackDao.class).insertOneBlack(black);
                session.getMapper(ListCauseDao.class).saveOne(cause);
                if (len == 2 || len == 3) {
                    DListBlack black2 = new DListBlack();
                    DListCause cause2 = new DListCause();
                    black2.setId(cell[1].getContents());
                    black2.setTypeId(2);
                    black2.setAppId("9");
                    black2.setUpdateDate(new Date());
                    cause2.setListId(cell[1].getContents());
                    cause2.setCause(reason);
                    session.getMapper(ListBlackDao.class).insertOneBlack(black2);
                    session.getMapper(ListCauseDao.class).saveOne(cause2);
                }
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (book != null) {
                book.close();
            }
            if (session != null) {
                session.close();
            }
        }
    }


    public static List<FAQ> exporpExcel() throws IOException, BiffException, WriteException {
        List<FAQ> list = new ArrayList();
        String filePath = "D:\\b.xls";
        InputStream is = null;
        Workbook rwb = null;

        try {
            is = new FileInputStream(filePath);//定义文本输入流
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        try {
            rwb = Workbook.getWorkbook(is);//打开Workbook
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //获取Excel表的Sheet1区域的数据
        Sheet sht = rwb.getSheet(0);
        int col = sht.getColumns(); //获得Excel列
        int row = sht.getRows(); //获得Excel行
        System.out.println("row=" + row);

        //先将数据按行装入一个一维数组中， 然后将数组逐个加入到ArrayList
        for (int i = 2; i < 5; i++) {
            FAQ faq = new FAQ();
            for (int j = 0; j < col; j++) {
                faq.setId(Integer.parseInt(sht.getCell(0, i).getContents()));
                faq.setQuestion(sht.getCell(1, i).getContents());
                faq.setUrl(sht.getCell(2, i).getContents());
                faq.setAnswer(sht.getCell(3, i).getContents());
                faq.setKeyword(sht.getCell(4, i).getContents());
            }
            list.add(faq);
        }
        return list;
    }

    public static List<String> getAllKey() {
        List<String> list = session.getMapper(FAQDao.class).getAllKey();
        for (int i = 0; i < 6; i++) {
            System.out.println(list.get(i));
        }
        return list;
    }

    public static List<FAQ> selectByKey() {
        Map map = new HashMap();
        map.put("keyword", "%奖金%");
        return session.getMapper(FAQDao.class).selectByKey(map);
    }

    public static void main(String[] args) throws Exception {
        System.out.println(selectByKey().size());
//        InputStream is = new FileInputStream(new File("D:/test/example.xls"));
//        importExcel(is);
//        List<FAQ> list = exporpExcel();
//        session.getMapper(FAQDao.class).insertBatch(list);
    }
}
