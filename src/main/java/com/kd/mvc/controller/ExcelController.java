package com.kd.mvc.controller;

import com.kd.mvc.utils.ExcelTool;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import sun.rmi.runtime.Log;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 * Created by hongjian.chen on 2017/10/24.
 */
@Controller
public class ExcelController {

    private static Logger logger = Logger.getLogger(ExcelTool.class);

    @RequestMapping(value = "/uploadExcel")
    public void saveExcel(MultipartFile file, HttpServletResponse rep) {
        rep.setContentType("text/html;charset=utf-8");
        InputStream is;
        PrintWriter pw = null;
        try {
            pw = rep.getWriter();
            is = file.getInputStream();
            ExcelTool.importExcel(is);
            pw.write("<script>alert('文件导入成功！');location.href='toRecoverExcel'</script>");
        } catch (Exception e) {
            pw.write("<script>alert('文件可能已损坏！请重新上传！');history.back()</script>");
            logger.error(e.getMessage());
            e.printStackTrace();
        }
    }
}
