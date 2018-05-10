<%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/9
  Time: 下午8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .modal-label{
            margin-top: 8px;
        }
    </style>
</head>
<body class="gray-bg">


<%--模态框--%>
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="exampleModalLabel">员工</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="name" class="control-label">姓名:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="name"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="id" class="control-label">工号:</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="id"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="gender" class="control-label">性别</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="gender"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="department" class="control-label">部门</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="department"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="position" class="control-label">职位</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="position"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="contact" class="control-label">联系方式</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="contact"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="info" class="control-label">个人简介</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="info"></div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2 modal-label"><label for="remark" class="control-label">备注</label></div>
                        <div class="col-md-10"><input type="text" class="form-control" id="remark"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">确认</button>
            </div>
        </div>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-8">
            <div class="ibox ">
                <div class="ibox-content">
                    <div class="example-wrap">
                        <h4 class="example-title">用户管理</h4>
                        <div class="example">
                            <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                                <button type="button" class="btn btn-outline btn-default" data-toggle="modal"
                                        data-target="#Modal" data-whatever="增加"
                                        style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke">
                                    增加
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn btn-outline btn-default" data-toggle="modal"
                                        data-target="#Modal" data-whatever="修改"
                                        style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-left-color: whitesmoke">
                                    修改
                                    <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn btn-outline btn-default"
                                        style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-left-color: whitesmoke">
                                    删除
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
        <div class="col-sm-4 ">
            <div class="ibox ">
                <div class="ibox-content">
                    <div class="text-center">
                        <h2>张有为</h2>
                        <button type="button" class="btn btn-outline btn-default">
                            导出员工详情
                        </button>
                    </div>
                    <div>
                        <h3>
                            个人简介
                        </h3>
                        <p>
                            李彦宏，百度公司创始人、董事长兼首席执行官，全面负责百度公司的战略规划和运营管理。
                        </p>
                        <p>

                            1991年，李彦宏毕业于北京大学信息管理专业，随后前往美国布法罗纽约州立大学完成计算机科学硕士学位，先后担任道·琼斯公司高级顾问、《华尔街日报》网络版实时金融信息系统设计者，以及国际知名互联网企业——Infoseek公司资深工程师。李彦宏所持有的“超链分析”技术专利，是奠定整个现代搜索引擎发展趋势和方向的基础发明之一。
                        </p>
                        <br>
                    </div>
                    <div class="client-detail">
                        <div class="full-height-scroll">
                            <strong>个人信息</strong>

                            <ul class="list-group clear-list">
                                <li class="list-group-item fist-item">
                                    <span class="pull-right">289892</span> 工号
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right">女 </span>性别
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right"> 1278264827802 </span> 联系方式
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right"> 设计部 </span> 部门
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right"> 部长 </span> 职位
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right"> 一号楼二楼203位置 </span> 地址
                                </li>
                            </ul>
                            <strong>备注</strong>
                            <p>
                                2018/5/1-2018/5/10出差，紧急情况请联系：12824827829 边老师
                            </p>
                            <hr/>
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
</script>
</body>
</html>
