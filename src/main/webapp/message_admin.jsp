<%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/20
  Time: 上午2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>留言管理</title>

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
                    <h2 class="example-title">留言管理</h2>
                    <div class="example">
                        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                            <button type="button" class="btn btn-outline btn-default"
                                    style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;" >回复
                                <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                            </button>
                        </div>
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th data-field="state" data-checkbox="true"></th>
                                <th data-field="message" class="col-lg-8">留言</th>
                                <th data-field="time" class="col-lg-2">时间</th>
                                <th data-field="name" class="col-lg-1">留言人</th>
                                <th data-field="status" class="col-lg-1">状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>平面设计（graphic
                                    design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
                                </td>
                                <td>2018/01/03 14:23:45</td>
                                <td>王文君</td>
                                <td>已回复</td>
                            </tr>
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
</body>
</html>
