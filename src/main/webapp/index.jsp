<%@ page import="entity.User" %>
<%@ page import="freemarker.debug.Debugger" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/9
  Time: 下午7:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    User user= (User) session.getAttribute("user");
    String role=user.getRole();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>主页</title>


    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">

<%--修改个人资料模态框--%>
<div class="modal fade animated" id="modifyMyself" tabindex="-1" role="dialog" aria-labelledby="modify">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modify">修改员工</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="modifyStaff.staff" id="modify_modal">
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">姓名:</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="name_update_input" name="name" readonly>
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
                            <input type="text" class="form-control" name="m_department" id="m_depart_name" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">职位</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="m_position" id="m_posi_name" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">联系方式</label></div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="m_tel" name="m_tel"
                                   placeholder="请输入1--11个数字"
                                   onchange="judgeLengthAndIsNum(this.value,11,'#m_tel','请输入1--11个数字','ModifyStaff','格式正确')">

                            <p class="notice"></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label class="control-label">地址</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="m_address" name="address"
                                                      placeholder="请输入1--50个字符"
                                                      onchange="judgeLength(this.value,50,'#m_address','请输入1--50个字符','modifyMyself','格式正确')">

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


<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="img/profile_small.jpg"/></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold"><%=user.getName()%></strong></span>
                                <span class="text-muted text-xs block"><%=user.getP_name()%><b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" data-toggle="modal" data-target="#modifyMyself">个人资料</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.jsp">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">湖大
                    </div>
                </li>
                <li>
                    <a class="J_menuItem" href="indexNotice.notice">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <%if(role.equals("管理员")||role.equals("超级管理员")){%>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">公司基本信息管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="getAll.staff">用户管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="getAll.depart">部门管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="getAll.posi">职位管理</a>
                        </li>
                    </ul>
                </li>
                <%}%>
                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">考勤管理</span>
                        <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="getAll.vacate">请假</a>
                        </li>
                        <%if(role.equals("管理员")||role.equals("超级管理员")){%>
                        <li><a class="J_menuItem" href="getAll.signInOut">签到管理</a>
                        </li>
                        <li><a class="J_menuItem" href="getAllVacate.vacate">请假管理</a>
                        </li>
                        <%}%>
                        <li><a class="J_menuItem" href="getAllApply.vacate">申请结果</a>
                        </li>
                    </ul>
                </li>

                <li><%if(role.equals("管理员")||role.equals("超级管理员")){%>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">公告管理</span><span
                            class="fa arrow"></span></a>
                    <%}%>
                    <ul class="nav nav-second-level">
                        <%if(role.equals("管理员")||role.equals("超级管理员")){%>
                        <li><a class="J_menuItem" href="edit_notice.notice">编写公告</a>
                        </li>
                        <%}%>
                        <%if(role.equals("超级管理员")){%>
                        <li><a class="J_menuItem" href="getAll.notice">公告审核</a>
                        </li>
                        <%}%>
                    </ul>
                </li>

                <li>
                    <a class="J_menuItem" href="getAllTelInfo.staff">
                        <i class="fa fa-phone"></i>
                        <span class="nav-label">通讯录</span>
                    </a>
                </li>

                <li>
                    <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">公司留言</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="getAllToStaff.message">员工留言</a>
                        </li>
                        <%if(role.equals("管理员")||role.equals("超级管理员")){%>
                        <li><a class="J_menuItem" href="getAllToManage.message">留言管理</a>
                        </li>
                        <%}%>
                    </ul>
                </li>
                <%if(role.equals("管理员")||role.equals("超级管理员")){%>
                <li>
                    <a href="#"><i class="fa fa-table"></i> <span class="nav-label">回收站</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="getAll.userDelete">员工删除历史</a>
                        </li>
                        <li><a class="J_menuItem" href="getAll.departDelete">部门删除历史</a>
                        </li>
                        <li><a class="J_menuItem" href="getAll.positionDelete">职位删除历史</a>
                        </li>
                    </ul>
                </li>
                <%}%>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                        class="fa fa-bars"></i> </a>

                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <div style="margin-right: 50px;margin-top: 8px;">
                        <button type="button" class="btn btn-outline btn-default"
                                style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke"
                        onclick="sign('1')">
                            签到
                            <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="btn btn-outline btn-default"
                                style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke"
                        onclick="sign('0')">
                            签退
                            <i class="glyphicon glyphicon-log-out" aria-hidden="true"></i>
                        </button>

                    </div>

                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="indexNotice.notice" class="active J_menuTab" data-id="index_v1.html">首页</a>
                </div>
            </nav>


            <a href="login.jsp" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="indexNotice.notice" frameborder="0"
                    data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2014-2018 <a href="" target="_blank">wwj</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->


</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="js/contabs.min.js"></script>
<script src="js/plugins/pace/pace.min.js"></script>
<script src="js/wwj.js"></script>
<script>
    function sign(operate){
        debugger
        $.ajax({
            url: "sign.signInOut",
            data: {"operation": operate},
            dataType: "text",
            type: "post",
            success: function (result) {
                debugger
                var x = parseInt(result);
                if (x == 1) {
                    signInSuccess();
                }
                else {
                    signOutSuccess();
                }
            },
            error: function (xhr, status, errMsg) {
                alert("数据传输失败!");
            }

        });
    }
    function signInSuccess(){
        alert("签到成功");
    }
    function signOutSuccess(){
        alert("签退成功");
    }

    /*提交更新之后的操作*/
    function submitUpdateAction() {
        var tel_input = $("#m_tel").val();
        var address_input = $("#m_address").val();
        debugger
        if (tel_input !== "" && address_input !== "") {
            $('#modify_modal').submit();
        }
        else {
            if (tel_input == "") setWrongNotice("#m_tel", "请输入1--11个数字", "不能为空", "modifyMyself");
            if (address_input == "") setWrongNotice("#m_address", "请输入1--50个字符", "不能为空", "modifyMyself");
        }
    }

</script>
</body>


</html>
