<%@ page import="java.util.List" %>
<%@ page import="entity.UserDelete" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<UserDelete> userAll= (List<UserDelete>) request.getAttribute("userAll");
%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>员工删除历史</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="ibox ">
            <div class="ibox-content">
                <div class="example-wrap">
                    <h4 class="example-title" style="display: inline-block">员工删除历史</h4>
                    <div class="example">
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
                                <th>删除时间</th>
                                <th data-field="operation">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(UserDelete user:userAll ){
                            %>
                            <tr>
                                <td><%=user.getName()%></td>
                                <td><%=user.getId_user()%></td>
                                <td><%=user.getRole()%></td>
                                <td><%=user.getGender()%></td>
                                <td><%=user.getD_name()%></td>
                                <td><%=user.getP_name()%></td>
                                <td><%=user.getTel()%></td>
                                <td><%=user.getDelete_time()%></td>
                                <td>
                                    <button type="button" class="btn btn-outline btn-default" name="restore" id="restore"
                                            style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke">恢复
                                        <i class="glyphicon glyphicon-backward" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default" name="Remove_completely" id="Remove_completely"
                                            style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-left-color: whitesmoke">彻底删除
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



</script>
</body>
</html>