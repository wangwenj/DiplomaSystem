<%@ page import="java.util.List" %>
<%@ page import="entity.Message" %>
<%@ page import="dao.MessageDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Message> messageList= (List<Message>) request.getAttribute("messageList");
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>员工留言</title>

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
                    <h1 class="example-title">员工留言</h1>
                    <div class="example">
                        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                            <a type="button" class="btn btn-outline btn-default"
                                    style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke" href="writeButton.message">写留言
                                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                            </a>
                        </div>
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>留言内容</th>
                                <th>留言时间</th>
                                <th>回复人</th>
                                <th>回复时间</th>
                                <th>回复内容</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%for(Message message:messageList){%>
                            <tr>
                                <td><%=message.getId_message()%></td>
                                <td><%=message.getWrite_content()%></td>
                                <td><%=message.getWrite_time()%></td>
                                <td><%=message.getReply_name()%></td>
                                <td><%=message.getReply_time()%></td>
                                <td><%=message.getReply_content()%></td>
                                <td>
                                    <a href="deleteMessage.message?id=<%=message.getId_message()%>" type="button" class="btn btn-outline btn-default">
                                        删除
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            <%}%>
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