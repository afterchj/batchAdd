<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>处理结果详细页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
	<style>
		#d1 {
			width:450px;
			border: 1px solid black;
			table-layout:fixed;
			top: 130px;
			left: 474px;
			position: absolute;
		}

		#d1 td {
			text-align:left;
			border: 1px solid black;
			width:132px;text-overflow:ellipsis;overflow:hidden;
		}
	</style>

<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<link type="image/x-icon"
	  href="resources-1.0.0/static/images/favicon.ico" rel="shortcut icon">
<link
	href="resources-1.0.0/static/bootstrap/2.1.1/css/bootstraped.min.css"
	type="text/css" rel="stylesheet" />
<link
	href="resources-1.0.0/static/bootstrap/2.1.1/css/bootstraped-responsive.min.css"
	type="text/css" rel="stylesheet" />
<link href="resources-1.0.0/static/css/mini-web.css" type="text/css"
	  rel="stylesheet" />
<link
	href="resources-1.0.0/static/jquery-validation/1.10.0/validate.css"
	rel="stylesheet">
<script
	src="resources-1.0.0/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
<script
	src="resources-1.0.0/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
    <script src="resources-1.0.0/static/bootstrap/2.1.1/js/bootstraped.min.js" type="text/javascript"></script>
    <script src="resources-1.0.0/static/bootstrap/2.1.1/js/bootstrap-datepicker.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid">
		<%@ include file="/WEB-INF/header.jsp"%>
		<div class="row-fluid" style="margin-top: 10px;">
			<%@ include file="/WEB-INF/left.jsp"%>
			<h4 style="position: absolute;top:37px;left: 474px;">详细信息</h4>
			<a href="toUploadSuccess" style="position: absolute;top:71px;left: 474px;">
				<p>返回显示页面</p></a>
			<table id="d1">
				<tr>
					<td>行号</td><td>用户Id</td><td>文件名</td><td>文件类型</td><td>用户名</td><td>上传时间</td><td>更新时间</td><td>当前状态</td><td>错误信息</td>
				</tr>
			<c:forEach items="${queryResult}" var="q">
				<tr>
				<td>
					${q.row}
				</td>
				<td>
					${q.uid}
				</td>
				<td>
					${q.fileName}
				</td>
				<td>
					${q.fileType}
				</td>
				<td>
					${q.loginName}
				</td>
				<td>
					${q.createTime}
				</td>
				<td>
					${q.updateTime}
				</td>
				<td>
					${q.handingStatus}
				</td>
				<td>
					${q.exceptionMessage}
				</td>
				</tr>
			</c:forEach>
			</table>
		</div>
</div>
</body>
</html>
