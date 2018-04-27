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
<title>高价任务类型文件预览界面</title>
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
			<div id="result"  class="row-fluid" style="text-align: center; display: block;">
				<h2 style="position: absolute;left: 900px;top:39px;">处理结果：</h2>
					<table class="table table-bordered">
						<thead>
						<tr>
							<th>人数</th>
							<th>应用数</th>
							<th>成功数量</th>
							<th>失败数量</th>
							<th>黑名单数量</th>
							<th>内容校验</th>
							<th>有效行数</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						<c:forEach items="${resultList}" var="r">
								<td>
										${r}
								</td>
						</c:forEach>
						</tr>
						</tbody>
					</table>
				<form method="post" action="highpirce_handleFile" style="position: absolute;left:926px;top:236px;">
					<input type="submit" value="处理文件" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>
