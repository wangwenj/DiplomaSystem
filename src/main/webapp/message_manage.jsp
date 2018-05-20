<%@ page import="java.util.List" %>
<%@ page import="entity.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Message> manageMessageList= (List<Message>) request.getAttribute("manageMessageList");
%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>留言管理</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="ibox ">
            <div class="ibox-content">
                <div class="example-wrap">
                    <h2 class="example-title">留言管理</h2>
                    <div class="example">
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>留言人</th>
                                <th>时间</th>
                                <th>留言内容</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <%for(Message message:manageMessageList){%>

                                <td><%=message.getId_message()%></td>
                                <td><%=message.getWrite_name()%></td>
                                <td><%=message.getWrite_time()%></td>
                                <td><%=message.getWrite_content()%></td>
                                <td>
                                    <a type="button" href="replyButton.message?id=<%=message.getId_message()%>"  class="btn btn-outline btn-default">
                                        回复
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </a>
                                </td>

                                <%}%>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/content.min.js?v=1.0.0"></script>
<script src="js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="js/demo/bootstrap-table-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096"
        charset="UTF-8"></script>
</body>
</html>