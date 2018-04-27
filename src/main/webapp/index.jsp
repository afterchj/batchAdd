<%@page import="org.apache.commons.lang3.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--<%--%>
<%--String path = request.getContextPath();--%>
<%--String basePath = request.getScheme() + "://"--%>
<%--+ request.getServerName() + ":" + request.getServerPort()--%>
<%--+ path + "/";--%>
<%--%>--%>
<html>
<head>
    <%--<base href="<%=basePath%>">--%>

    <title>登陆页面</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
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

    <style>
        body {
            background-color: #f5f5f5;
            background: url('resources-1.0.0/static/images/tokyo.jpg') no-repeat fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            overflow: hidden;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 20px 29px;
            margin: 15% 20% 20px auto;
            background: #fff;
            position: relative;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fff),
            color-stop(100%, #ddd));
            background: -webkit-linear-gradient(top, #fff 0, #ddd 100%);
            background: -moz-linear-gradient(top, #fff 0, #ddd 100%);
            background: -ms-linear-gradient(top, #fff 0, #ddd 100%);
            background: -o-linear-gradient(top, #fff 0, #ddd 100%);
            background: linear-gradient(top, #fff 0, #ddd 100%);
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .form-signin .form-signin-heading, .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin input[type="text"], .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

        .nav_head {
            height: 40px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#username").focus();
            $("#loginForm").validate();
        });
    </script>
</head>

<body>
<div class="navbar navbar-fixed-top navbar-inverse"
     style="opacity: 0.9">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse"
               data-target=".nav-collapse"> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </a> <a class="brand" href="index.jsp">CIMS</a>
        </div>
    </div>
</div>
<div class="container">
    <div id="content" class="span12">
        <div class="nav_head"></div>
        <form id="loginForm" action="login" method="post"
              class="form-signin">
            <!--  <c:if test="${param.msg != null}">
							${param.msg}
	</c:if>-->
            <%
                String msg = (String) request.getAttribute("msg");
                if (StringUtils.isNotBlank(msg)) {
            %>
            <div class="control-group">
                <div class="controls ">
                    <div class="alert alert-error">
                        <button class="close" data-dismiss="alert">×</button>
                        <%=msg%>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            <h2 class="form-signin-heading">登录</h2>
            <div class="control-group">
                <div class="controls">
                    <input type="text" placeholder="帐号" id="username" name="userName"
                           size="50" class="required span3"/>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="password" id="password" placeholder="密码" name="pwd"
                           size="50" class="required span3"/>
                </div>
            </div>
            <label class="checkbox" for="rememberMe"> <input
                    type="checkbox" id="rememberMe" name="rememberMe" checked="checked"/>
                下次自动登录
            </label>
            <div class="control-group">
                <div class="controls">
                    <input id="submit_btn" class="btn btn-large btn-primary" type="submit" value="登录"/>
                </div>
            </div>
        </form>
    </div>
</div>
<script
        src="resources-1.0.0/static/bootstrap/2.1.1/js/bootstraped.min.js"
        type="text/javascript"></script>
</body>

</html>

