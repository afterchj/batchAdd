package com.kd.mvc.service;

import com.kd.mvc.dao.ListBlackDao;
import com.kd.mvc.entity.*;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Service("excelService")
public class ExcelService {

    @Autowired
    ListBlackDao listBlackDao;

    public Map<String, Object> recoverHandleExcel(InputStream is, String fileName, String loginName) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Map<String, Object> map = new HashMap<>();
        List<DListBlack> listBlacks = new ArrayList<>();
        jxl.Workbook readwb = null;
        int rsRows = 0;
        try {
            readwb = Workbook.getWorkbook(is);
            Sheet readsheet = readwb.getSheet(0);
//            int rsColumns = 2;
            rsRows = readsheet.getRows();
            System.out.println("开始时间：" + format.format(new Date()));
            for (int i = 0; i < rsRows; i++) {
                DListBlack dListBlack = new DListBlack();
                for (int j = 0; j < 1; j++) {
                    Cell cell = readsheet.getCell(j, i);
                    if (cell.getContents().trim() == "") {
                        continue;
                    }
                    dListBlack.setId(cell.getContents().trim());
                    dListBlack.setAppId("9");
                    dListBlack.setTypeId(2);
                    dListBlack.setUpdateDate(new Date());
                    DListBlack listBlack = listBlackDao.findBlackById(dListBlack);
                    if (listBlack != null) {
                        continue;
                    }
                    if (listBlack == null) {
                        listBlackDao.insertOneBlack(dListBlack);
                        System.out.println(dListBlack);
                    }
                }
            }
            System.out.println("结束时间：" + format.format(new Date()));
            map.put("result", "成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("result", "失败！");
        }
        return map;
    }
}
