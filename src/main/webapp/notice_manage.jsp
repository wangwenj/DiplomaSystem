<%@ page import="entity.Notice" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/20
  Time: 上午1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    List<Notice> notices= (List<Notice>) request.getAttribute("notices");
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公告管理</title>

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

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <div class="ibox-content">
                    <div class="example-wrap">
                        <h1 class="example-title">公告管理</h1>
                        <div class="example">
                            <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group" >

                            </div>
                            <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true" data-method="post">
                                <thead>
                                <tr>
                                    <th hidden>id</th>
                                    <th data-field="name">撰写人</th>
                                    <th data-field="id">撰写时间</th>
                                    <th>状态</th>
                                    <th data-field="sex">公告内容</th>

                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (Notice notice : notices) {
                                %>
                                <tr>
                                    <td><%=notice.getId_announcement()%></td>
                                    <td><%=notice.getWrite_name()%></td>
                                    <td><%=notice.getTime_submit()%></td>
                                    <td><%=notice.getStatus()%> </td>
                                    <td>
                                        <a href="getDetais.notice?id=<%=notice.getId_announcement()%>" type="button" class="btn btn-outline btn-default">
                                            查看详情
                                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
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
<script src="js/wwj.js"></script>
<script>


    $(document).on("click",".details",function () {
        //1、查询该电影信息
        getMovie($(this).attr("detail-id"));

        $("#contentModalLabel").modal({
            backdrop:"static"
        });

    });
</script>
</body>
</html>

