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

        p {
            margin-bottom: 0px;
        }
    </style>
</head>
<body class="gray-bg">


<%--增加的模态框--%>
<div class="modal fade animated " id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">增加员工</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="addStaff.staff" id="staff_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">姓名:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="name_add_input" name="name"
                                   placeholder="请输入1--15个字符"
                                   onchange="checkRepeat('name','add',15,'getOneUser.staff','addModal','请输入1--15个字符','姓名重复','姓名可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">角色:</label></div>
                        <div class="col-md-10">
                            <select type="text" class="form-control" id="role_add_input" name="role">
                                <option value="管理员">管理员</option>
                                <option value="用户">用户</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">工号:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="id_add_input" name="id_user"
                                   placeholder="请输入1--15个数字"
                                   onchange="checkRepeat('id','add',15,'judgeUserId.staff','addModal','请输入1--15个数字','工号重复','工号可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">密码:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="password"
                                   placeholder="请输入1--15个字符" id="password_add_input" value="2233"
                                   onchange="judgeLength(this.value,15,'#password_add_input','请输入1--15个字符','addModal')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">性别</label></div>
                        <div class="col-md-10">
                            <select type="text" class="form-control" id="gender_add_input" name="gender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">部门</label></div>
                        <div class="col-md-10">
                            <select class="form-control " name="department">
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
                            <select class="form-control " name="position">
                                <%for (int j = 0; j < positions.size(); j++) { %>
                                <option value="<%=positions.get(j).getId_position()%>">
                                    <%=positions.get(j).getP_name()%>
                                </option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">联系方式</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="tel_add_input" name="tel"
                                   placeholder="请输入1--15个数字"
                                   onchange="judgeLengthAndIsNum(this.value,15,'#tel_add_input','请输入1--15个数字','addModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">地址</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="address_add_input"
                                   name="address" placeholder="请输入1--50个字符"
                                   onchange="judgeLength(this.value,50,'#address_add_input','请输入1--50个字符','addModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="staff_save_btn"
                        onclick="submitAddAction()">确认
                </button>
            </div>
        </div>
    </div>
</div>

<%--修改的模态框--%>
<div class="modal fade animated" id="ModifyStaff" tabindex="-1" role="dialog" aria-labelledby="modify">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modify">修改员工</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="modifyStaff.staff" id="modify_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">姓名:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="name_update_input"
                                                      name="name"
                                                      placeholder="请输入1--15个字符"
                                                      onchange="checkRepeat('name','update',15,'getOneUser.staff','ModifyStaff','请输入1--15个字符','姓名重复','姓名可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">工号:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_id_user" name="id_user"
                                                      readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">性别</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="gender" id="m_gender" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">部门</label></div>
                        <div class="col-md-10">
                            <select class="form-control m-b" name="m_department" id="m_department">
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
                        <div class="col-md-2 modal-label"><label class="control-label">联系方式</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="m_tel" name="m_tel"
                                   placeholder="请输入1--15个数字"
                                   onchange="judgeLengthAndIsNum(this.value,15,'#m_tel','请输入1--15个数字','ModifyStaff','格式正确')">

                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">地址</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_address" name="address"
                                                      placeholder="请输入1--50个字符"
                                                      onchange="judgeLength(this.value,50,'#m_address','请输入1--50个字符','ModifyStaff','格式正确')">

                            <p class="notice"></p>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        onclick="submitUpdateAction();">确认
                </button>
            </div>
        </div>
    </div>
</div>

<%--删除的模态框--%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="delete">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <form method="post" action="deleteUser.staff" id="deleteModalForm">
                <div class="modal-body">
                    <p style="display: inline-block">您确认要删除&nbsp;
                    <div style="display: inline-block;font-size: larger;color: black;" id="user_name"></div>&nbsp;吗？</p>
                </div>
                <div class="modal-footer">
                    <input type="text" id="deleteUserId" style="display: none" name="deleteUserId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a onclick="document.getElementById('deleteModalForm').submit()" class="btn btn-success"
                       data-dismiss="modal">确定</a>
                </div>
            </form>
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
                                    <th>角色</th>
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
                                    <td><%=user.getRole()%></td>
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
                                        <button type="button" class="btn btn-outline btn-default"
                                                onclick="deleteUser(this,<%=user.getId_user()%>)">
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
