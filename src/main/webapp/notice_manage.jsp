<%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/20
  Time: 上午1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公告管理</title>

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

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <div class="ibox-content">
                    <div class="example-wrap">
                        <h4 class="example-title">用户管理</h4>
                        <div class="example">
                            <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group" >

                            </div>
                            <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true" data-method="post">
                                <thead>
                                <tr>
                                    <th data-field="name">撰写人</th>
                                    <th data-field="id">撰写时间</th>
                                    <th>公告题目</th>
                                    <th data-field="sex">公告内容</th>
                                    <th data-field="option">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (User user : userAll) {
                                %>
                                <tr>
                                    <td><%=user.getName()%>
                                    </td>
                                    <td><%=user.getId_user()%>
                                    </td>
                                    <td><%=user.getRole()%></td>
                                    <td><%=user.getGender()%>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-outline btn-default"
                                                onclick="deleteUser(this,<%=user.getId_user()%>)">
                                            删除
                                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline btn-default"
                                                onclick="deleteUser(this,<%=user.getId_user()%>)">
                                            通过
                                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline btn-default"
                                                onclick="deleteUser(this,<%=user.getId_user()%>)">
                                            未通过
                                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
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
    <!--modal框-->
    $('#Modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var title = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text(title + '员工信息')
        // modal.find('.modal-body input').val(title)
    })

    // 点击修改的确认按钮，给模态框加载信息并且弹出模态框
    function update(obj, depId, posiId) {
        var tds = $(obj).parent().parent().find('td');
        $("#name_update_input").val((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#name_update_input").next(".notice").text(null);
        $("#m_id_user").val((tds.eq(1).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_gender").val(tds.eq(2).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_tel").val(tds.eq(5).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_tel").next(".notice").text(null);
        $("#m_address").val(tds.eq(6).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_address").next(".notice").text(null);
        $("#uptDep" + depId).attr("selected", true);
        $("#uptPosi" + posiId).attr("selected", true);
        $('#ModifyStaff').modal('show');
    }

    //点击删除按钮，给模态框传入此时的id值，显示该用户name
    function deleteUser(obj, userId) {
        var tds = $(obj).parent().parent().find('td');
        $("#user_name").text((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#deleteUserId").val((tds.eq(1).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $('#deleteModal').modal('show');
    }

    //判断增加的所有输入框是否为空
    function submitAddAction() {
        var name_input = $("#name_add_input").val();
        var id_input = $("#id_add_input").val();
        var pass_input = $("#password_add_input").val();
        var tel_input = $("#tel_add_input").val();
        var address_input = $("#address_add_input").val();
        if (name_input !== "" && id_input !== "" && pass_input !== "" && tel_input !== "" && address_input !== "") {
            $('#staff_modal').submit();
        }
        else {
            if (name_input == "") setWrongNotice("#name_add_input", "请输入1--15个字符", "不能为空", "addModal");
            if (id_input == "") setWrongNotice("#id_add_input", "请输入1--15个数字", "不能为空", "addModal");
            if (pass_input == "") setWrongNotice("#password_add_input", "请输入1--15个字符", "不能为空", "addModal");
            if (tel_input == "") setWrongNotice("#tel_add_input", "请输入1--15个数字", "不能为空", "addModal");
            if (address_input == "") setWrongNotice("#address_add_input", "请输入1--50个字符", "不能为空", "addModal");
        }
    }

    //判断更新的所有输入框是否为空
    function submitUpdateAction() {
        var name_input = $("#name_update_input").val();
        var tel_input = $("#m_tel").val();
        var address_input = $("#m_address").val();
        debugger
        if (name_input !== "" && tel_input !== "" && address_input !== "") {
            $('#modify_modal').submit();
        }
        else {
            if (name_input == "") setWrongNotice("#name_update_input", "请输入1--15个字符", "不能为空", "ModifyStaff");
            if (tel_input == "") setWrongNotice("#m_tel", "请输入1--15个数字", "不能为空", "ModifyStaff");
            if (address_input == "") setWrongNotice("#m_address", "请输入1--50个字符", "不能为空", "ModifyStaff");
        }
    }

</script>
</body>
</html>

