<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC Demo 首页</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h2>这里是任务列表页面</h2>
<hr>
<center>
    <a href="<%=path%>index.jsp" style="text-decoration: none">返回首页</a>
    <hr>
    <table border="1" align="center" bgcolor="black">
        <tr bgcolor="aqua">
            <td>TaskID</td>
            <td>TaskName</td>
            <td>TaskDescription</td>
            <td>操作</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${taskList}" var="lists">
            <tr bgcolor="#fff0f5">
                <td>${lists.id}</td>
                <td>${lists.name}</td>
                <td>${lists.description}</td>
                <td><a href="<%=basePath%>toUpdate?id=${lists.id}">修改</a></td>
                <td><a href="javascript:del('${lists.id}')">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</center>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    function del(id) {
        $.get("<%=basePath%>delete?id=" +id,function (data) {
            if("success" == data.result){
                alert("删除成功");
                window.location.reload();
            }else{
                alert("删除失败");
            }
        });
    }
</script>
</body>
</html>