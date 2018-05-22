<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/11/28
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    String msg = (String) request.getAttribute("msg");

%>
<!DOCTYPE html>
<html>


<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 登录</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h2 class="logo-name logo-login">xx单位</h2>
        </div>
        <h3>欢迎登录人事管理系统</h3>

        <form action="signin.login" method="post" id="testform">
            <div class="form-group">
                <input type="text" class="form-control" name="id_user" id="id_user" placeholder="用户名" required="">
                <p class="notice"></p>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" id="password" placeholder="密码" required="">
                <p class="notice" style="color: green">*请输入用户名和密码</p>
            </div>
            <button  type="submit" class="btn btn-primary block full-width m-b">登 录</button>


        </form>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script src="js/wwj.js"></script>
<script>
    /*function submitAddAction() {
        debugger
        var id_user = $("#id_user").val();
        var password = $("#password").val();
        var msg=<%=msg%>;
        debugger
        if(msg==false){
            setWrongNotice("#password", "请输入密码", "用户名或密码不对", "addModal");
        }
        if (id_user !== "" && password) {
            $('#testform').submit();
        }
        else {
            if (id_user == "") setWrongNotice("#id_user", "请输入用户名(工号)", "不能为空", "addModal");
            if (password == "") setWrongNotice("#password", "请输入密码", "不能为空", "addModal");
    }}*/

</script>
</body>


</html>
