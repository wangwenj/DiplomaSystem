<%@ page import="entity.SignInOut" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/21
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<SignInOut> userSignList = (List<SignInOut>) request.getAttribute("userSignList");
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>签到管理</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <style type="text/css">
        table {
            font-size: 13px;
        }

        .modal-label {
            margin-top: 8px;
        }

        p {
            margin-bottom: 0px;
        }
    </style>
</head>
<body class="gray-bg">

<%--删除的模态框--%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="delete">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <form method="post" action="deleteSign.signInOut" id="deleteModalForm">
                <div class="modal-body">
                    <p style="display: inline-block">您确认要删除这条签到信息吗？</div>
                <div class="modal-footer">
                    <input type="text" id="signId" style="display: none" name="signId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a onclick="document.getElementById('deleteModalForm').submit()" class="btn btn-success"
                       data-dismiss="modal">确定</a>
                </div>
            </form>
        </div>
    </div>
</div>

<form method="post" action="getAll.signInOut" id="signDay" style="display:none"></form>
<form method="post" action="getOneWeekSignInfo.signInOut" id="signWeek" style="display:none"></form>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <div class="ibox-content">
                    <div class="example-wrap">
                        <h4 class="example-title">签到管理</h4>
                        <div class="example">
                            <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group" >
                                <button class="btn btn-outline btn-default"
                                        data-toggle="modal" data-target="#addModal"
                                        style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke"
                                        onclick="document.getElementById('signWeek').submit();">
                                    获取本周
                                </button>
                                <button class="btn btn-outline btn-default"
                                        data-toggle="modal" data-target="#addModal"
                                        style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-left-color: whitesmoke"
                                        onclick="document.getElementById('signDay').submit();">
                                    获取今天
                                </button>

                            </div>
                            <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true"
                                   data-method="post" id="signTable">
                                <thead>
                                <tr>
                                    <th data-field="operation">签到/签退</th>
                                    <th data-field="name">签到姓名</th>
                                    <th data-field="id">签到时间</th>
                                    <th data-field="status">状态</th>
                                    <th data-field="choose">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (SignInOut sign : userSignList) {
                                %>
                                <tr>
                                    <td id="signOperation"><%=sign.getOperation_name()%>
                                    </td>
                                    <td id="userName"><%=sign.getUser_name()%>
                                    </td>
                                    <td id="signTime"><%=sign.getSign_time()%>
                                    </td>
                                    <td id="signStatus"><%=sign.getStatus()%>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-outline btn-default"
                                                onclick="deleteUser(this,<%=sign.getId()%>)">
                                            删除
                                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                        </button>
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
<script src="js/wwj.js"></script>
<script>
    var http = require("http");
    var jsdom = require("jsdom");
    var window = jsdom.jsdom().defaultView;
    var $ = require('jquery')(window);

    //点击删除按钮，给模态框传入此时的id值
    function deleteUser(obj, userId) {
        var tds = $(obj).parent().parent().find('td');
        $("#signId").val(userId);
        $('#deleteModal').modal('show');
    }

    //获取一周的签到信息
    function getWeekInfo() {
        $.ajax({
            url: "getOneWeekSignInfo.signInOut",
            type: "POST",
            data: {},
            success: function (result) {
                debugger
                var userSignList = JSON.parse(result);
                var userSignListArray = userSignList.userSignList;
                debugger
                setTableValue(userSignListArray);

            }
        });
    }

    //将一周的签到信息显示在表格中
    function setTableValue(list) {
        $.each(list, function (index, item) {
            debugger
            var operation_name = $("<td></td>").append(item.operation_name);
            var user_name = $("<td></td>").append(item.user_name);
            var sign_time = $("<td></td>").append(item.sign_time);
            var status = $("<td></td>").append(item.status);
            var deleteButton = $("<button></button>").addClass("btn btn-outline btn-default")
                .append("删除").append($("<i></i>").addClass("glyphicon glyphicon-trash"));
            deleteButton.bind("click", deleteUser(this, item.id));
            $("<tr></tr>").append(operation_name).append(user_name).append(sign_time)
                .append(status).append(deleteButton).appendTo("#signTable tbody");

        });
    }

    function signWeek(){
        $(window).attr('location','/sign_manage_week.jsp');
        document.getElementById('signWeek').submit();
    }

</script>
</body>
</html>
