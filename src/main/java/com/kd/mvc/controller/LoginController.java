package com.kd.mvc.controller;

import com.kd.mvc.model.FileModel;
import com.kd.mvc.model.User;
import com.kd.mvc.service.*;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private ExcelService eservice;

//    @Autowired
//    private LoginValidateService loginValidate;

    @RequestMapping(value = "login")
    public void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        LoginValidateService loginValidate = new LoginValidateService();

        User user = new User();
        user.setUid(req.getParameter("userName"));
        user.setPassword(req.getParameter("pwd"));

//        user.setUid(req.getParameter("userName"));
//        user.setPassword(req.getParameter("pwd"));
//        req.getSession().setAttribute("userRealName", "lino");
//        req.getRequestDispatcher("WEB-INF/excel.jsp").forward(req, res);

        String loginUser = loginValidate.authenricate(user.getUid(), user.getPassword());
        if (loginUser != null && !loginUser.equals("")) {
            req.getSession().setAttribute("userRealName", loginUser);
            req.getRequestDispatcher("WEB-INF/excel.jsp").forward(req, res);
        } else {
            req.setAttribute("msg", loginValidate.msg);
            req.getRequestDispatcher("index.jsp").forward(req, res);
        }
    }

    @RequestMapping(value = "recover_confirm", method = RequestMethod.POST)
    public void checkRecoverForm(@ModelAttribute("model") FileModel file, HttpServletRequest req, HttpServletResponse
            res) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        Map<String, Object> result = new HashedMap();
        if (!file.getFile().isEmpty()) {
            InputStream is;
            String fileName = ((CommonsMultipartFile) file.getFile()).getFileItem().getName();
            String loginName = (String) httpSession.getAttribute("userRealName");
            try {
                is = file.getFile().getInputStream();
                result = eservice.recoverHandleExcel(is, fileName, loginName);
                httpSession.setAttribute("list", result.get("list"));
            } catch (IOException e) {
                req.setAttribute("reMessage", "文件转换失败！请重新上传!");
                req.getRequestDispatcher("WEB-INF/recoverExcel.jsp").forward(req, res);
                return;
            }
        } else {
            req.setAttribute("reMessage", "文件不存在！请重新上传!");
            req.getRequestDispatcher("WEB-INF/recoverExcel.jsp").forward(req, res);
            return;
        }
        req.setAttribute("reMessage", result.get("result"));
        req.getRequestDispatcher("WEB-INF/recoverExcel.jsp").forward(req, res);
        return;
    }

    @RequestMapping(value = "toUploadSuccess", method = RequestMethod.GET)
    public void toUploadSuccess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(
                "WEB-INF/uploadSuccess.jsp").forward(req, res);
    }

    @RequestMapping(value = "toHpExcel", method = RequestMethod.GET)
    public void toHpExcel(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(
                "WEB-INF/hpExcel.jsp").forward(req, res);
    }

    @RequestMapping(value = "toBonusExcel", method = RequestMethod.GET)
    public void toBonusExcel(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(
                "WEB-INF/bonusExcel.jsp").forward(req, res);
    }

    @RequestMapping(value = "toConsumerExcel", method = RequestMethod.GET)
    public void toConsumerExcel(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(
                "WEB-INF/consumerExcel.jsp").forward(req, res);
    }

    @RequestMapping(value = "toRecoverExcel", method = RequestMethod.GET)
    public void toRecoverExcel(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(
                "WEB-INF/recoverExcel.jsp").forward(req, res);
    }

    @RequestMapping(value = "toExcel", method = RequestMethod.GET)
    public void toExcel(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(
                "WEB-INF/excel.jsp").forward(req, res);
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //销毁session
        if (req.getSession().getAttribute("userRealName") != null) {
            req.getSession().removeAttribute("userRealName");
        }
        req.getRequestDispatcher(
                "index.jsp").forward(req, res);
    }


}
