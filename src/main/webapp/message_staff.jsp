<%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/20
  Time: 上午2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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

<%--查看回复--%>
<div class="modal fade animated " id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">回复详情</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="addStaff.staff" id="staff_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">回复人:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="name_add_input" name="name"
                                   placeholder="请输入1--15个字符"
                                   onchange="checkRepeat('name','add',15,'getOneUser.staff','addModal','请输入1--15个字符','姓名重复','姓名可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">时间:</label></div>
                        <div class="col-md-10">
                            <select type="text" class="form-control" id="role_add_input" name="role">
                                <option value="管理员">管理员</option>
                                <option value="用户">用户</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-1 modal-label"><label class="control-label">内容:</label></div>
                        <div class="col-md-11">
                            <input type="text" class="form-control" id="id_add_input" name="id_user"
                                   placeholder="请输入1--15个数字"
                                   onchange="checkRepeat('id','add',15,'judgeUserId.staff','addModal','请输入1--15个数字','工号重复','工号可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="ibox ">
            <div class="ibox-content">
                <div class="example-wrap">
                    <h2 class="example-title">员工留言</h2>
                    <div class="example">
                        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                            <a href="" class="btn btn-outline btn-default"
                                    style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke">增加留言
                                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                            </a>
                        </div>
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th data-field="message" class="col-lg-8">留言人</th>
                                <th data-field="time" class="col-lg-2">留言时间</th>
                                <th data-field="name" class="col-lg-1">留言</th>
                                <th data-field="status" class="col-lg-1">状态</th>
                                <th data-field="option" class="col-lg-1">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                               <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" class="btn btn-outline btn-default"
                                            onclick="deleteUser(this,<%=user.getId_user()%>)">
                                        删除
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default"
                                            onclick="deleteUser(this,<%=user.getId_user()%>)">
                                        查看回复
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
                                </td>

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
