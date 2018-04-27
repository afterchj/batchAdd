<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>黑名单文件处理界面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript"
            src="js/jquery-1.11.3.js"></script>
    <link type="image/x-icon"
          href="resources-1.0.0/static/images/favicon.ico" rel="shortcut icon">
    <link
            href="resources-1.0.0/static/bootstrap/2.1.1/css/bootstraped.min.css"
            type="text/css" rel="stylesheet"/>
    <link
            href="resources-1.0.0/static/bootstrap/2.1.1/css/bootstraped-responsive.min.css"
            type="text/css" rel="stylesheet"/>
    <link href="resources-1.0.0/static/css/mini-web.css" type="text/css"
          rel="stylesheet"/>
    <link
            href="resources-1.0.0/static/jquery-validation/1.10.0/validate.css"
            rel="stylesheet">
    <script
            src="resources-1.0.0/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
    <script
            src="resources-1.0.0/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
    <script src="resources-1.0.0/static/bootstrap/2.1.1/js/bootstraped.min.js" type="text/javascript"></script>
    <script src="resources-1.0.0/static/bootstrap/2.1.1/js/bootstrap-datepicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        function checkFile() {
            var name = $('#file').val();
            var str = name.substring(name.lastIndexOf('.'));
            if (str == '.xls') {
                return true;
            }else {
                alert("请选择.xls格式的excel文件！");
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <%@ include file="/WEB-INF/header.jsp" %>
    <div class="row-fluid" style="margin-top: 10px;">
        <%@ include file="/WEB-INF/left.jsp" %>
        <div id="recover" class="row-fluid"
             style="text-align: center;">
            <form method="post" action="uploadExcel" enctype="multipart/form-data">
                <h1>黑名单EXCEL:</h1>
                <br> <input type="file" name="file" id="file"/>
                <input type="submit" value="确认文件" onclick="return checkFile()"/>
            </form>
            <p class="required" style="position: absolute;left: 1500px;top: 134px" id="message">${reMessage}</p>
        </div>
    </div>
</div>
</body>
</html>

