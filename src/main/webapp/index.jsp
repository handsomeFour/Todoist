<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<html>
<body>
<h2>这里是首页</h2>
<hr>
<center>
    <a href="tasks" style="text-decoration: none;color: lightskyblue">任务列表</a>
    <hr>
    <form action="add" method="post">
        <table>
            <tr>
                <td>任务 I D ：<input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <td>任务名称：<input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>任务描述：<input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <center>
                    <td><input type="button" onclick="subTask()" value="添加"></td>
                    <td><input type="reset" value="重置"></td>
                </center>
            </tr>
        </table>
    </form>
</center>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
    function subTask() {
        var id = $("#id").val();
        var name = $("#name").val();
        var description = $("#description").val();
        var task = {id:id,name:name,description:description};    //拼装成json格式

        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/add",
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
