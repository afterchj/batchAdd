<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<base href="<%=basePath%>">
<title>处理结果显示页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
	<style>
		#d1 {
			width:1288px;
			border: 1px solid black;
			table-layout:fixed;
			top: 93px;
			left: 474px;
			position: absolute;
		}

		#d1 td {
			text-align:left;
			border: 1px solid black;
			width:132px;text-overflow:ellipsis;overflow:hidden;
		}
		#d2 {
			width:1288px;
			border: 1px solid black;
			table-layout:fixed;
			top: 431px;
			left: 474px;
			position: absolute;
		}

		#d2 td {
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
<script type="text/javascript">
	$(function () {
		setInterval(function () {
			$.ajax({
				type: "post",
				url: "query",
				dataType: "json",
				success: function (data) {
					var html1;
					var html2;
					html1 = "<tr><td>文件名</td><td>文件类型</td><td>用户名</td><td>上传时间</td><td>更新时间</td><td>当前状态</td><td>已处理的行数</td><td>出错的行数</td></tr>";
					html2 = "<tr><td>文件名</td><td>文件类型</td><td>用户名</td><td>上传时间</td><td>当前状态</td><td>完成百分比</td><td>已处理的行数</td><td>出错的行数</td></tr>";
					for (var i = 0; i < data.length; i++) {
						if(data[i].currentStatus=="已处理") {
							html1 += "<tr><td>" + data[i].fileName + "</td><td>" + data[i].fileType + "</td><td>" + data[i].loginName + "</td><td>" + data[i].createTime + "</td><td>" + data[i].updateTime + "</td><td>" +
									data[i].currentStatus + "</td><td><a href=\"queryDoneDetail?fileNameId="+data[i].fileNameId+"\">" + data[i].doneNum + "</a></td><td><a href=\"queryErrorDetail?fileNameId="+data[i].fileNameId+"\">" + data[i].errorNum + "</a></td></tr>";
						}else {
							html2 += "<tr><td>" + data[i].fileName + "</td><td>" + data[i].fileType + "</td><td>" + data[i].loginName + "</td><td>" + data[i].createTime + "</td><td>" + data[i].currentStatus + "</td><td>" + data[i].totalNum + "</td><td><a href=\"queryDoneDetail?fileNameId="+data[i].fileNameId+"\">" + data[i].doneNum + "</a></td><td><a href=\"queryErrorDetail?fileNameId="+data[i].fileNameId+"\">" + data[i].errorNum + "</a></td></tr>";}
					}
					$("#d2").html(html1);
					$("#d1").html(html2);
				},
				error: function () {
				}
			});
		}, 1000)
	})
</script>
</head>
<body>
<div class="container-fluid">
		<%@ include file="/WEB-INF/header.jsp"%>
		<div class="row-fluid" style="margin-top: 10px;">
			<%@ include file="/WEB-INF/left.jsp"%>
			<h4 style="position: absolute;top:48px;left: 474px;">正在处理和等待处理的文件</h4>
			<div id="" style="margin-top: 30px; text-align: center;">
				<table id="d1"></table>
			</div>
			<h4 style="position: absolute;top:387px;left: 474px;">已处理的文件</h4>
			<div id="" style="margin-top: 30px; text-align: center;">
				<table id="d2"></table>
			</div>
		</div>
</div>
</body>
</html>
