<%@ page language="java" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>--%>

<%
    String name =  String.valueOf(session.getAttribute("userRealName"));
%>
<div id="header" class="row" style="margin-top: 35px;">
    <div class="navbar navbar-fixed-top navbar-inverse"
         style="opacity: 0.9">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse"
                   data-target=".nav-collapse"> <span class="icon-bar"></span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span>
                </a>
                <a class="brand" href="toExcel"><i class="icon-cloud-upload"></i>&nbsp;EXCEL文件处理系统</a>
                <div class="nav-collapse collapse ">
                    <%--<shiro:user>--%>
                    <ul class="nav pull-right">
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"> <i><%=name %></i>
                            <%--<shiro:principal property="name" />--%>
                        </a>
                            <ul class="dropdown-menu">
                                <li><a href="logout">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                    <%--</shiro:user>--%>
                </div>
            </div>
        </div>
    </div>
</div>