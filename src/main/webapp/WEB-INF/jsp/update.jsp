<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/18 0018
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>这里是修改页面</h2>
<hr>
<center>
    <a href="tasks" style="text-decoration: none;color:lightskyblue">任务列表</a>
    <a href="<%=path%>index.jsp" style="text-decoration: none;color: lightskyblue">返回首页</a>
    <hr>
    <form action="" name="taskForm">
        <table>
            <tr>
                <td><input type="hidden" name="id" id="id" value="${task.id}"></td>
            </tr>
            <tr>
                <td>任务名称：<input type="text" name="name" id="name" value="${task.name}"></td>
            </tr>
            <tr>
                <td>任务描述：<input type="text" name="description" id="description" value="${task.description}"></td>
            </tr>
            <tr>
                <td><input type="button" value="修改" onclick="updateTask()"></td>
            </tr>
        </table>
    </form>
</center>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
    function updateTask() {
        var id = $("#id").val();
        var name = $("#name").val();
        var description = $("#description").val();
        var task = {id:id,name:name,description:description};    //拼装成json格式
        console.log(description)
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/updateTask",
            data:task,
            success:function (data) {
                alert("成功");
            },
            error:function (e) {
                alert("出错：" + e);
            }
        })
    }
</script>
</body>
</html>
