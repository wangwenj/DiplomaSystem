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
                        <div class="col-md-10"><input type="text" class="form-control" id="name_add_input" name="name"
                                                      onchange="checkUserName('addUserName')">
                            <p class="notice">请输入1--20个汉字</p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">工号:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="id_add_input" name="id_user"
                                                      onchange="checkUserId()">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">密码:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" name="password" value="2233">
                        </div>
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
                <button type="button" class="btn btn-primary" id="staff_save_btn"
                        onclick="document.getElementById('staff_modal').submit()">确认
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
                <form method="post" action="modifyStaff.staff" id="modify_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="m_name" class="control-label">姓名:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_name" name="name"
                                                      onchange="checkUserName('updateUsername')">
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
                        <div class="col-md-2 modal-label"><label for="gender" class="control-label">性别</label></div>
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
                        <div class="col-md-2 modal-label"><label for="tel" class="control-label">联系方式</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_tel" name="m_tel"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="intro" class="control-label">地址</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_address" name="address">
                        </div>
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
                    <a onclick="document.getElementById('deleteModalForm').submit();" class="btn btn-success"
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
        $("#m_name").next(".notice").text(null);
        $("#m_id_user").val((tds.eq(1).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_gender").val(tds.eq(2).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_tel").val(tds.eq(5).text().replace(/(^\s*)|(\s*$)/g, ""));
        $("#m_address").val(tds.eq(6).text().replace(/(^\s*)|(\s*$)/g, ""));
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

    //判断增加和修改框user是否重复
    function checkUserName(modal) {
        if (modal == "addUserName") {
            var username = document.getElementById("name_add_input").value;
            if (username.length == 0 || username.length > 15) {
                alert("名字的字符长度为" + username.length);
                setWrongNotice("#name_add_input", username, "请输入1--15个字符");
                return false;
            }
        }
        else var username = document.getElementById("m_name").value;
        var JSONObejct = {
            "name": username
        };

        $.ajax({
            url: "getOneUser.staff",
            data: JSONObejct,
            dataType: "text",
            type: "post",
            success: function (result) {
                var x = parseInt(result);
                if (x == 100) {
                    if (modal == "addUserName")
                        show_validate_msg("#name_add_input", "success", "用户名可用", "add");
                    else show_validate_msg("#m_name", "success", "用户名可用", "update");
                }
                else {
                    if (modal == "addUserName")
                        show_validate_msg("#name_add_input", "error", "用户名重复", "add");
                    else show_validate_msg("#m_name", "error", "用户名重复", "update");
                }
            },
            error: function (xhr, status, errMsg) {
                alert("数据传输失败!");
            }

        });
    }

    //判断userid是否重复
    function checkUserId() {
        var userId = document.getElementById("id_add_input").value;
        var JSONObejct = {
            "id": userId
        };

        $.ajax({
            url: "judgeUserId.staff",
            data: JSONObejct,
            dataType: "text",
            type: "post",
            success: function (result) {
                var x = parseInt(result);
                if (x == 100) {
                    show_validate_msg("#id_add_input", "success", "工号可用", "add");
                }
                else {
                    show_validate_msg("#id_add_input", "error", "工号重复", "add");
                }

            },
            error: function (xhr, status, errMsg) {
                alert("数据传输失败!");
            }

        });
    }

    //在页面中展示是否重复或者可用
    function show_validate_msg(ele, status, msg, modal) {
        //清除当前元素的校验状态
        if ("success" == status) {
            $(ele).next(".notice").text("*" + msg);
            $(ele).next(".notice").css({color: "green"});
        } else if ("error" == status) {
            setWrongNotice(ele, $(ele).val(), msg);
            if (modal == "add")
                $("#addModal").addClass("bounce");
            else
                $("#ModifyStaff").addClass("bounce");
        }
    }

    //设置提示文字的颜色和输入框中的提示文字内容
    function setWrongNotice(inputId, placeholder, msg) {
        $(inputId).next(".notice").css({color: "red"});
        $(inputId).next(".notice").text("*" + msg);
        $(inputId).attr("placeholder", placeholder);
        $(inputId).val(null);
    }


</script>
</body>
</html>
