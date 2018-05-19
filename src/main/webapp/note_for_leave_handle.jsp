<%@ page import="entity.Vacate" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/18
  Time: 下午1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    Vacate vacate = (Vacate) request.getAttribute("oneVacate");

%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>请假单</title>

    <link rel="shortcut icon" href="WEB-INF/favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>


<body class=" gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h2 style="text-align: center;">请假单</h2>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" action="addVacateForm.vacate" id="applyForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">请假人<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="name_apply_input" id="name_apply_input"
                                value=" <%=vacate.getApply_name()%>"><p class="notice"></p>
                            </div>
                            <label class="col-sm-2 control-label">申请时间<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input id="time_apply" type="text" class="form-control" name="time_apply"
                                       data-date-format="yyyy-mm-dd"
                                value=" <%=vacate.getTime()%>">
                                <p class="notice"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所属部门<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control " name="department" id="apply_department_input"
                               value="<%=vacate.getApply_depart_name()%>">
                            </div>
                            <label class="col-sm-2 control-label">岗位<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control " name="position" id="apply_positon_input"
                                value="<%=vacate.getApply_posi_name()%>">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开始时间<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input id="time_start" type="text" class="form-control" name="time_start"
                                       data-date-format="yyyy-mm-dd"
                                value="<%=vacate.getTime_start()%>">
                                <p class="notice"></p>
                            </div>
                            <label class="col-sm-2 control-label">结束时间<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input id="time_end" type="text" class="form-control" name="time_end"
                                       data-date-format="yyyy-mm-dd"
                                       onchange="compareTime()"
                                value="<%=vacate.getTime_end()%>">
                                <p class="notice"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">审批人<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control " name="position" id="admin_input"
                                value=" <%=vacate.getAdmin_name()%>">
                            </div>
                            <label class="col-sm-2 control-label">审批人职位<label style="color: red">*</label></label>
                            <div class="col-sm-4">
                                <input class="form-control " name="admin_position" id="admin_position"
                                value=" <%=vacate.getAdmin_posi_name()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">实际天数<label style="color: red">*</label></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="total_time" id="total_time"
                                       onchange="countTotalTime()"
                                value=" <%=vacate.getDays()%>">
                                <p class="notice"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">请假原因<label style="color: red">*</label></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="reason_input" id="reason_input"
                                value=" <%=vacate.getReason()%>">
                                <p class="notice"></p>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                    </form>
                </div>

                <div class="ibox-content" style="height: 60px">
                    <div class="form-group">
                        <div class="col-sm-5 col-sm-offset-5">
                            <button class="btn btn-primary" style="margin-right: 50px;"
                                    onclick="submitApplyAction()">同意申请
                            </button>
                            <button class="btn btn-primary" style="margin-right: 50px;"
                                    onclick="submitApplyAction()">不同意
                            </button>
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
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/wwj.js"></script>
<script>
    $("#time_apply,#time_start,#time_end").datetimepicker({
        language: 'zh-CN',
        minView: "month"
    });

    function countTotalTime() {
        debugger

        var time_start = $("#time_start").val();
        var time_end = $("#time_end").val();
        console.log(time_end - time_start);
    }

    function compareTime() {
        debugger
        var starttime = $('#time_start').val();
        var endtime = $('#time_end').val();
        var start = new Date(starttime.replace("-", "/").replace("-", "/"));
        var end = new Date(endtime.replace("-", "/").replace("-", "/"));
        if (end < start) {
            setWrongNotice("#time_end", "请选择结束时间", "结束时间必须在开始时间之后", null);
        }
        if (end > start) {
            setSuccessNotice("#time_end", "格式正确");
            $("#total_time").val(DateDiff(starttime, endtime) + "天");
            $("#reason_input").next(".notice").val(null);
            $("#time_start").next(".notice").val(null);
            $("#time_end").next(".notice").val(null);
        }
    }

    //判断输入框是否为空
    function submitApplyAction() {
        debugger
        var name_apply = $("#name_apply_input").val();
        var time_apply = $("#time_apply").val();
        var time_start = $("#time_start").val();
        var time_end = $("#time_end").val();
        var total_time = $("#total_time").val();
        var reason_input = $("#reason_input").val();
        debugger
        if (name_apply !== "" && time_apply !== "" && time_start !== "" && time_end !== "" && total_time !== "" && reason_input !== "") {
            $('#applyForm').submit();
        }
        else {
            if (name_apply == "") setWrongNotice("#name_apply_input", "请输入用户名", "不能为空", null);
            if (time_apply == "") setWrongNotice("#time_apply", "请选择一个时间", "不能为空", null);
            if (time_start == "") setWrongNotice("#time_start", "请选择请假开始时间", "不能为空", null);
            if (time_end == "") setWrongNotice("#time_end", "请选择请假结束时间", "不能为空", null);
            if (total_time == "") setWrongNotice("#total_time", "正确输入请假起始时间，自动生成总时间", "正确输入请假起始时间，自动生成总时间", null);
            if (reason_input == "") setWrongNotice("#reason_input", "请输入1--100字的理由", "不能为空", null);
        }
    }

    $("#name_apply_input").change(function () {

        var name_apply = this.value;
        $.ajax({
            url: "getUserApplyInfo.vacate",
            type: "POST",
            data: {"name_apply": name_apply},
            success: function (result) {
                debugger
                var apply_info = JSON.parse(result);//转成json对象
                var apply_info_content = apply_info.apply_info;//后面内容是数组
                var content = apply_info_content[0];//数组第一个
                var d_name = content.d_name;
                var p_name = content.p_name;

                debugger
                $("#apply_department_input").val(d_name);
                $("#apply_positon_input").val(p_name);
            }
        });
    });

    $("#admin_input").change(function () {
        var admin_user_id = this.value;
        $.ajax({
            url: "getUserAdminInfo.vacate",
            type: "POST",
            data: {"admin_user_id": admin_user_id},
            success: function (result) {
                debugger
                var admin_user_info = JSON.parse(result);
                var admin_user_info_content = admin_user_info.admin_user_info;
                var p_name = admin_user_info_content[0].p_name;
                $("#admin_position").val(p_name);
            }
        });
    });

</script>
</body>
</html>
