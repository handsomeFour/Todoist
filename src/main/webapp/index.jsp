<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<%--引入css文件--%>
<link rel='stylesheet prefetch' href="/static/css/csshake.min.css">
<style>
    *{
        margin:0;
        padding:0;
        list-style-type:none;
    }

    a,img{
        border:0;
    }

    /* clock */
    .clock div{
        position:relative;
        float:left;
        background:#ffe8e8;
        border-radius:6px;
        width:96px;
        height:80px;
        line-height:80px;
        text-align:center;
        font-size:60px;
        margin:0 5px;
    }

    #uploadFile{
        position: fixed;
        top: 40%;
        left: 42%;
    }

    #hitsCount{
        position: fixed;
        top: 5%;
        left: 90%;
    }

    .button {
        display: inline-block;
        border-radius: 4px;
        background-color: lightskyblue;
        border: none;
        color: #FFFFFF;
        text-align: center;
        font-size: 28px;
        padding: 20px;
        width: 200px;
        transition: all 0.5s;
        cursor: pointer;
        margin: 5px;
    }

    .button span {
        cursor: pointer;
        display: inline-block;
        position: relative;
        transition: 0.5s;
    }

    .button span:after {
        content: '»';
        position: absolute;
        opacity: 0;
        top: 0;
        right: -20px;
        transition: 0.5s;
    }

    .button:hover span {
        padding-right: 25px;
    }

    .button:hover span:after {
        opacity: 1;
        right: 0;
    }

    .file {
        position: relative;
        display: inline-block;
        background: #D0EEFF;
        border: 1px solid #99D3F5;
        border-radius: 4px;
        padding: 4px 12px;
        overflow: hidden;
        color: #1E88C7;
        text-decoration: none;
        text-indent: 0;
        line-height: 20px;
    }
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
    }
    .file:hover {
        background: #AADFFD;
        border-color: #78C3F3;
        color: #004974;
        text-decoration: none;
    }

    .clock{
        position: fixed;
        left: 38%;
        bottom: 20%;
    }

    .showFileName{
        position: fixed;
        width: 250px;
        height: 25px;
        top: 40.5%;
        left: 50%;
        border-radius: 5px;
        background: lightcyan;
        color: aqua;
        display: block;
    }
</style>
<body>
<%--页面访问量统计--%>
<%
    Integer hitsCount = (Integer) application.getAttribute("hitCounter");
    if (hitsCount == null || hitsCount == 0){
        hitsCount = 1;
    }else {
        hitsCount += 1;
    }
    application.setAttribute("hitCounter",hitsCount);
%>
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
<hr>
<div id="uploadFile">
    <form method="post" action="uploadFile" enctype="multipart/form-data">
        <div>
            <a href="" class="file">选择文件
                <input type="file" id="file" name="uploadFile">
            </a>
        </div>
        <div>
            <output type="text" class="showFileName"></output>
        </div>
        <div>
            <button type="submit" id="button" class="button"><span>上传</span></button>
        </div>
    </form>
</div>
<div id="hitsCount">
    <p>页面访问量：<%=hitsCount%></p>
</div>

<div class="clock">
    <div class="h shake shake-slow"></div>
    <div class="m shake shake-slow"></div>
    <div class="s shake shake-slow"></div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="/static/js/index.js"></script>
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

    $(".file").on("change","input[type='file']",function(){
        var filePath = $(this).val();
        if(filePath != null){
            var arr=filePath.split('\\');
            var fileName=arr[arr.length-1];
            $(".showFileName").html(fileName).show();
        }else{
            $(".showFileName").html("您未上传文件，或者您上传文件类型有误！").show();
            return false
        }
    })
</script>
</body>
</html>
