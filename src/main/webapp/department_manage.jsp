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
                <form method="post" action="addDepart.depart" id="addDepartment_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">部门:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="d_name" id="name_add_input"
                                   placeholder="请输入1--15个字符"
                                   onchange="checkRepeat('name','add',15,'judgeRepeat_D_name.depart','addModal','请输入1--15个字符','部门名称重复','部门名称可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">代码:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="d_id" id="id_add_input"
                                   placeholder="请输入1--11个数字"
                                   onchange="checkRepeat('id','add',15,'judgeRepeat_D_id.depart','addModal','请输入1--11个字符','部门代码重复','部门代码可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">简介:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="d_intro" id="intro_add_input"
                                   placeholder="请输入1--100个字符"
                                   onchange="judgeLength(this.value,100,'#intro_add_input','请输入1--100个字符','addModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">位置</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="d_address" id="address_add_input"
                                   placeholder="请输入1--50个字符"
                                   onchange="judgeLength(this.value,50,'#address_add_input','请输入1--50个字符','addModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">联系方式</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="d_tel" id="tel_add_input"
                                   placeholder="请输入1--15个数字"
                                   onchange="judgeLengthAndIsNum(this.value,15,'#tel_add_input','请输入1--15个数字','addModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        onclick="submitAddAction()">确认
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
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="name_update_input" name="m_name"
                                   placeholder="请输入1--15个字符"
                                   onchange="checkRepeat('name','update',15,'judgeRepeat_D_name.depart','updateModal','请输入1--15个字符','部门名字重复','部门名字可用')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">代码:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="id_update_input" name="m_id"
                                   placeholder="请输入1--15个数字"
                                   onchange="checkRepeat('id','update',15,'judgeRepeat_D_id.depart','updateModal','请输入1--15个字符','部门名字重复','部门名字可用')"
                                   readonly>
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">简介:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="intro_update_input" name="m_intro"
                                   placeholder="请输入1--100个字符"
                                   onchange="judgeLength(this.value,100,'#intro_update_input','请输入1--100个字符','updateModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">位置</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="address_update_input" name="m_address"
                                   placeholder="请输入1--50个字符"
                                   onchange="judgeLength(this.value,50,'#address_update_input','请输入1--50个字符','updateModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">联系方式</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="tel_update_input" name="m_tel"
                                   placeholder="请输入1--15个数字"
                                   onchange="judgeLengthAndIsNum(this.value,15,'#tel_update_input','请输入1--15个数字','updateModal','格式正确')">
                            <p class="notice"></p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary"
                        onclick="submitUpdateAction()">确认
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
                    <div style="display: inline-block;font-size: larger;color: black;"
                         id="depart_name"></div>&nbsp;吗？</p>
                </div>
                <div class="modal-footer">
                    <input type="text" id="deleteDepartId" style="display: none" name="deleteDepartId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a onclick="document.getElementById('deleteModalForm').submit();"
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
                                <td><%=department.getId_department()%>
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
<script src="js/wwj.js"></script>
<script>


    <%--修改部门信息模态框--%>

    function updateDepart(obj) {
        var tds = $(obj).parent().parent().find('td');
        $("#name_update_input").val((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#name_update_input").next(".notice").text(null);
        $("#id_update_input").val((tds.eq(1).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#id_update_input").next(".notice").text(null);
        $("#intro_update_input").val((tds.eq(2).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#intro_update_input").next(".notice").text(null);
        $("#address_update_input").val((tds.eq(3).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#address_update_input").next(".notice").text(null);
        $("#tel_update_input").val((tds.eq(4).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#tel_update_input").next(".notice").text(null);
        $("#updateModal").modal("show");
    }

    <%--删除框弹出，将id传到删除模态框中--%>

    function deleteDepart(obj, departId) {
        var tds = $(obj).parent().parent().find('td');
        $("#depart_name").text((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#deleteDepartId").val(departId);
        $("#deleteModal").modal("show");
    }

    //判断增加的所有输入框是否为空
    function submitAddAction() {
        var name_input = $("#name_add_input").val();
        var id_input = $("#id_add_input").val();
        var intro_input = $("#intro_add_input").val();
        var address_input = $("#address_add_input").val();
        var tel_input = $("#tel_add_input").val();
        debugger
        if (name_input !== "" && id_input !== "" && intro_input !== "" && address_input !== "" && tel_input !== "") {
            $('#addDepartment_modal').submit();
        }
        else {
            if (name_input == "") setWrongNotice("#name_add_input", "请输入1--15个字符", "不能为空", "addModal");
            if (id_input == "") setWrongNotice("#id_add_input", "请输入1--15个数字", "不能为空", "addModal");
            if (intro_input == "") setWrongNotice("#intro_add_input", "请输入1--100个字符", "不能为空", "addModal");
            if (address_input == "") setWrongNotice("#address_add_input", "请输入1--50个数字", "不能为空", "addModal");
            if (tel_input == "") setWrongNotice("#tel_add_input", "请输入1--15个数字", "不能为空", "addModal");
        }
    }

    //判断更新的所有输入框是否为空
    function submitUpdateAction() {
        var name_input = $("#name_update_input").val();
        var intro_input = $("#intro_update_input").val();
        var address_input = $("#address_update_input").val();
        var tel_input = $("#tel_update_input").val();
        debugger
        if (name_input !== "" && intro_input !== "" && tel_input !== "" && address_input !== "") {
            $('#updateDepartment_modal').submit();
        }
        else {
            if (name_input == "") setWrongNotice("#name_update_input", "请输入1--15个字符", "不能为空", "updateModal");
            if (intro_input == "") setWrongNotice("#intro_update_input", "请输入1--100个字符", "不能为空", "updateModal");
            if (address_input == "") setWrongNotice("#address_update_input", "请输入1--50个数字", "不能为空", "updateModal");
            if (tel_input == "") setWrongNotice("#tel_update_input", "请输入1--15个数字", "不能为空", "updateModal");
        }
    }

</script>
</body>
</html>
