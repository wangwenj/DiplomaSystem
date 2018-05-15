<%@ page import="entity.Department" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/15
  Time: 下午1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    List<Department> departments = (List<Department>) request.getAttribute("departments");
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>部门管理</title>

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
    </style>
</head>
<body class="gray-bg">

<%--增加的模态框--%>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">增加部门</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="addDepar.depart" id="addDepartment_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">部门:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="d_name"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">代码:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="d_code"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">简介:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="d_intro"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label  class="control-label">位置</label></div>
                        <div class="col-md-10"><input type="text" class="form-control"  name="d_address">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">联系方式</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="d_tel"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        onclick="document.getElementById('addDepartment_modal').submit();">确认
                </button>
            </div>
        </div>
    </div>
</div>

<%--修改的模态框--%>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">修改部门</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="updateDepartment.depart" id="updateDepartment_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">部门:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="d_name" name="d_name"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">代码:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="d_code"  name="d_code"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">简介:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="d_intro" name="d_intro"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label  class="control-label">位置</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="d_address" name="d_address">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label  class="control-label">联系方式</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="d_tel" name="d_tel"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        onclick="document.getElementById('updateDepartment_modal').submit();">确认
                </button>
            </div>
        </div>
    </div>
</div>

<%--删除的模态框--%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <form method="post" action="deleteDepart.depart" id="deleteModalForm">
                <div class="modal-body">
                    <p style="display: inline-block">您确认要删除&nbsp;
                    <div style="display: inline-block;font-size: larger;color: black;" id="depart_name"></div>&nbsp;吗？</p>
                </div>
                <div class="modal-footer">
                    <input type="text" id="deleteDepartId" style="display: none" name="deleteDepartId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a  onclick="document.getElementById('deleteModalForm').submit();"
                       class="btn btn-success"
                       data-dismiss="modal">确定</a>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="ibox ">
            <div class="ibox-content">
                <div class="example-wrap">
                    </button><h4 class="example-title" style="display: inline-block;">部门管理</h4>
                    <div class="example">
                        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                            <button class="btn btn-outline btn-default"
                                    data-toggle="modal"
                                    data-target="#addModal"
                                    style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke">
                                增加
                                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                            </button>

                        </div>
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th data-field="departName" class="col-lg-2">部门</th>
                                <th data-field="departId" class="col-lg-2">代码</th>
                                <th data-field="intro" class="col-lg-2">简介</th>
                                <th data-field="location" class="col-lg-2">位置</th>
                                <th data-field="contact" class="col-lg-2">联系方式</th>
                                <th data-field="option" class="col-lg-2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Department department : departments) {
                            %>
                            <tr>
                                <td><%=department.getD_name()%>
                                </td>
                                <td><%=department.getCode()%>
                                </td>
                                <td><%=department.getIntro()%>
                                </td>
                                </td>
                                <td><%=department.getAddress()%>
                                </td>
                                <td><%=department.getTel()%>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-outline btn-default"
                                            onclick="updateDepart(this)">
                                        修改
                                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default"
                                            onclick="deleteDepart(this,<%=department.getId_department()%>)">
                                        删除
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
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/content.min.js?v=1.0.0"></script>
<script src="js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="js/demo/bootstrap-table-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096"
        charset="UTF-8"></script>
<script>
    <%--修改部门信息模态框--%>
    function updateDepart(obj) {
        var tds = $(obj).parent().parent().find('td');
        $("#d_name").val((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#d_code").val((tds.eq(1).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#d_intro").val((tds.eq(2).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#d_address").val((tds.eq(3).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#d_tel").val((tds.eq(4).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#updateModal").modal("show");
    }

    <%--删除框弹出，将id传到删除模态框中--%>
    function deleteDepart(obj, departId) {
        var tds = $(obj).parent().parent().find('td');
        $("#depart_name").text((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#deleteDepartId").val(departId);
        $("#deleteModal").modal("show");
    }
</script>
</body>
</html>
