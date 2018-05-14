<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="entity.Position" %>
<%@ page import="entity.Department" %>
<%@ page import="com.sun.xml.internal.ws.wsdl.writer.document.Documented" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/9
  Time: 下午8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
    List<Position> positions = (List<Position>) request.getAttribute("positions");
    List<Department> departments = (List<Department>) request.getAttribute("departments");
    List<User> userAll = (List<User>) request.getAttribute("userAll");
%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>员工管理</title>

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
                <h4 class="modal-title" id="exampleModalLabel">增加员工</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="addStaff.manage" id="staff_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">姓名:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="name"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">工号:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="id_user"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">密码:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="password"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">性别</label></div>
                        <div class="col-md-10">
                            <select type="text" class="form-control" id="gender" name="gender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">部门</label></div>
                        <div class="col-md-10">
                            <select class="form-control m-b" name="department">
                                <option value="0" selected>请选择</option>
                                <%for (int j = 0; j < departments.size(); j++) { %>
                                <option value="<%=departments.get(j).getId_department()%>">
                                    <%=departments.get(j).getD_name()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">职位</label></div>
                        <div class="col-md-10">
                            <select class="form-control m-b" name="position">
                                <option value="0" selected>请选择</option>
                                <%for (int j = 0; j < positions.size(); j++) { %>
                                <option value="<%=positions.get(j).getId_position()%>">
                                    <%=positions.get(j).getP_name()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="tel" class="control-label">联系方式</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="tel" name="tel"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="intro" class="control-label">个人简介</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="intro" name="intro"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="address" class="control-label">地址</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="address" name="address">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="remark" class="control-label">备注</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="remark" name="remark"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        onclick="document.getElementById('staff_modal').submit();">确认
                </button>
            </div>
        </div>
    </div>
</div>

<%--修改的模态框--%>
<div class="modal fade" id="ModifyStaff" tabindex="-1" role="dialog" aria-labelledby="modify">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modify">修改员工</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="modifyStaff.manage" id="modify_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="m_name" class="control-label">姓名:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_name" name="name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">工号:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_id_user" name="id_user" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="gender" class="control-label">性别</label></div>
                        <div class="col-md-10">
                            <select type="text" class="form-control" name="gender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">部门</label></div>
                        <div class="col-md-10">
                            <select class="form-control m-b" name="m_department" id="m_department">
                                <option value="0" selected>请选择</option>
                                <%for (int j = 0; j < departments.size(); j++) { %>
                                <option value="<%=departments.get(j).getId_department()%>"
                                        id="uptDep<%=departments.get(j).getId_department()%>">
                                    <%=departments.get(j).getD_name()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">职位</label></div>
                        <div class="col-md-10">
                            <select class="form-control m-b" name="m_position">
                                <option value="0" selected>请选择</option>
                                <%for (int j = 0; j < positions.size(); j++) { %>
                                <option value="<%=positions.get(j).getId_position()%>"
                                        id="uptPosi<%=positions.get(j).getId_position()%>">
                                    <%=positions.get(j).getP_name()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="tel" class="control-label">联系方式</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_tel" name="m_tel"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="intro" class="control-label">地址</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_address" name="address"></div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        onclick="document.getElementById('modify_modal').submit();">确认
                </button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <div class="ibox-content">
                    <div class="example-wrap">
                        <h4 class="example-title">用户管理</h4>
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
                                    <th data-field="name">姓名</th>
                                    <th data-field="id">工号</th>
                                    <th data-field="sex">性别</th>
                                    <th data-field="department">部门</th>
                                    <th data-field="position">职位</th>
                                    <th data-field="contact">联系方式</th>
                                    <th data-field="address">地址</th>
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
                                    <td><%=user.getGender()%>
                                    </td>
                                    <td id="<%=user.getId_department()%>"><%=user.getD_name()%>
                                    </td>
                                    <td id="<%=user.getId_position()%>"><%=user.getP_name()%>
                                    </td>
                                    <td><%=user.getTel()%>
                                    </td>
                                    <td><%=user.getAddress()%>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-outline btn-default"
                                                onclick="update(this,<%=user.getId_department()%>,<%=user.getId_position()%>)">
                                            修改
                                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                                        </button>
                                        <a type="button" class="btn btn-outline btn-default">
                                            删除
                                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                        </a>
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
<script>
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

    // 点击修改按钮，给模态框加载信息并且弹出模态框
    function update(obj, depId, posiId) {
        var tds = $(obj).parent().parent().find('td');
        $("#m_name").val((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_id_user").val((tds.eq(1).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_gender").val(tds.eq(2).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_tel").val(tds.eq(5).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_address").val(tds.eq(6).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#uptDep" + depId).attr("selected", true);
        $("#uptPosi" + posiId).attr("selected", true);
        $('#ModifyStaff').modal('show');
    }
</script>
</body>
</html>
