<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                            <button type="button" class="btn btn-outline btn-default" name="restore" id="restore"
                                    style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke">恢复
                                <i class="glyphicon glyphicon-backward" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btn btn-outline btn-default" name="Remove_completely" id="Remove_completely"
                                    style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-left-color: whitesmoke">彻底删除
                                <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                            </button>
                        </div>
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th data-field="state" data-checkbox="true"></th>
                                <th data-field="name">姓名</th>
                                <th data-field="id">工号</th>
                                <th data-field="sex">性别</th>
                                <th data-field="department">部门</th>
                                <th data-field="position">职位</th>
                                <th data-field="contact">联系方式</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td></td>
                                <td>王文君</td>
                                <td>201426010321</td>
                                <td>女</td>
                                <td>财务部</td>
                                <td>部长</td>
                                <td>18712345612</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>王文君</td>
                                <td>201426010321</td>
                                <td>女</td>
                                <td>财务部</td>
                                <td>部长</td>
                                <td>18712345612</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>王文君</td>
                                <td>201426010321</td>
                                <td>女</td>
                                <td>财务部</td>
                                <td>部长</td>
                                <td>18712345612</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>王文君</td>
                                <td>201426010321</td>
                                <td>女</td>
                                <td>财务部</td>
                                <td>部长</td>
                                <td>18712345612</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>王文君</td>
                                <td>201426010321</td>
                                <td>女</td>
                                <td>财务部</td>
                                <td>部长</td>
                                <td>18712345612</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>王文君</td>
                                <td>201426010321</td>
                                <td>女</td>
                                <td>财务部</td>
                                <td>部长</td>
                                <td>18712345612</td>
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