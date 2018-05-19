<%@ page import="entity.Vacate" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/19
  Time: 下午3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    List<Vacate> allApply= (List<Vacate>) request.getAttribute("allApply");
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>申请结果</title>

    <link rel="shortcut icon" href="WEB-INF/favicon.ico">
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
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="ibox ">
            <div class="ibox-content">
                <div class="example-wrap">
                    </button><h4 class="example-title" style="display: inline-block;">请假管理</h4>
                    <div class="example">
                        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">


                        </div>
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th data-field="departName" class="col-lg-2">申请人</th>
                                <th data-field="departId" class="col-lg-2">申请时间</th>
                                <th data-field="intro" class="col-lg-2">总时长</th>
                                <th data-field="status" class="col-lg-2">状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Vacate vacate : allApply) {
                            %>
                            <tr>
                                <td><%=vacate.getApply_name()%>
                                </td>
                                <td><%=vacate.getTime()%>
                                </td>
                                <td><%=vacate.getDays()%>
                                </td>
                                <td><%=vacate.getStatus()%>
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

    function updateAction(obj) {
        var tds = $(obj).parent().parent().find('td');
        $("#name_update_input").val((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#name_update_input").next(".notice").text(null);
        $("#id_update_input").val((tds.eq(1).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#id_update_input").next(".notice").text(null);
        $("#intro_update_input").val((tds.eq(2).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#intro_update_input").next(".notice").text(null);
        $("#updateModal").modal("show");
    }

    <%--删除框弹出，将id传到删除模态框中--%>

    function deleteAction(obj, departId) {
        var tds = $(obj).parent().parent().find('td');
        $("#delete_name").text((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#deleteId").val(departId);
        $("#deleteModal").modal("show");
    }

    //判断增加的所有输入框是否为空
    function submitAddAction() {
        var name_input = $("#name_add_input").val();
        var id_input = $("#id_add_input").val();
        var intro_input = $("#intro_add_input").val();
        debugger
        if (name_input !== "" && id_input !== "" && intro_input !== "") {
            $('#add_modal').submit();
        }
        else {
            if (name_input == "") setWrongNotice("#name_add_input", "请输入1--15个字符", "不能为空", "addModal");
            if (id_input == "") setWrongNotice("#id_add_input", "请输入1--15个数字", "不能为空", "addModal");
            if (intro_input == "") setWrongNotice("#intro_add_input", "请输入1--100个字符", "不能为空", "addModal");
        }
    }

    //判断更新的所有输入框是否为空
    function submitUpdateAction() {
        var name_input = $("#name_update_input").val();
        var intro_input = $("#intro_update_input").val();
        debugger
        if (name_input !== "" && intro_input !== "") {
            $('#update_modal').submit();
        }
        else {
            if (name_input == "") setWrongNotice("#name_update_input", "请输入1--15个字符", "不能为空", "updateModal");
            if (intro_input == "") setWrongNotice("#intro_update_input", "请输入1--50个字符", "不能为空", "updateModal");
        }
    }

</script>
</body>
</html>
