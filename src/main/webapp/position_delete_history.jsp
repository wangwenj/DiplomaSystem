<%@ page import="java.util.List" %>
<%@ page import="entity.PositionDelete" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<PositionDelete> positionAll= (List<PositionDelete>) request.getAttribute("positionAll");
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

<%--恢复的模态框--%>
<div class="modal fade" id="restoreModal" tabindex="-1" role="dialog" aria-labelledby="restoreModal">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <form method="post" action="deleteUser.positionDelete" id="restoreModalForm">
                <div class="modal-body">
                    <p style="display: inline-block">您确认要恢复&nbsp;
                    <div style="display: inline-block;font-size: larger;color: black;"
                         id="restoreName"></div>&nbsp;吗？</p>
                </div>
                <div class="modal-footer">
                    <input type="text" id="restoreId" style="display: none" name="restoreId">
                    <input type="text" id="operotion" style="display: none" name="operotion">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a onclick="document.getElementById('restoreModalForm').submit();"
                       class="btn btn-success"
                       data-dismiss="modal">确定</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%--彻底删除的模态框--%>
<div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="removeModal">
    <div class="modal-dialog">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <form method="post" action="deleteUser.positionDelete" id="removeModalForm">
                <div class="modal-body">
                    <p style="display: inline-block">您确认要彻底删除&nbsp;
                    <div style="display: inline-block;font-size: larger;color: black;"
                         id="removeName"></div>&nbsp;吗？</p>
                </div>
                <div class="modal-footer">
                    <input type="text" id="removeId" style="display: none" name="restoreId">
                    <input type="text" id="remove_operotion" style="display: none" name="operotion">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a onclick="document.getElementById('removeModalForm').submit();"
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
                    <h4 class="example-title" style="display: inline-block">职位删除历史</h4>
                    <div class="example">
                        <table id="exampleTableEvents" data-height="auto" data-mobile-responsive="true">
                            <thead>
                            <tr>
                                <th data-field="name">职位</th>
                                <th data-field="id">代码</th>
                                <th>简介</th>
                                <th>删除时间</th>
                                <th data-field="operation">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for(PositionDelete position:positionAll ){
                            %>
                            <tr>
                                <td><%=position.getP_name()%></td>
                                <td><%=position.getId_position()%></td>
                                <td><%=position.getIntro()%></td>
                                <td><%=position.getDelete_time_position()%></td>
                                <td>
                                    <button type="button" onclick="restoreUser(<%=position.getId_position()%>,this,this.id)" class="btn btn-outline btn-default" id="restore"
                                            style="background-color: #1ab394;color: whitesmoke;border-color:#1ab394;border-right-color: whitesmoke">恢复
                                        <i class="glyphicon glyphicon-backward" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" onclick="removeUser(<%=position.getId_position()%>,this,this.id)" class="btn btn-outline btn-default"  id="remove"
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


    //恢复按钮事件
    function restoreUser(id,obj,oper){
        debugger
        var tds = $(obj).parent().parent().find('td');
        $("#restoreName").text((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#restoreId").val(id);
        $("#operotion").val(oper)
        $("#restoreModal").modal("show");
    }

    //彻底删除按钮事件
    function removeUser(id,obj,oper){
        debugger
        var tds = $(obj).parent().parent().find('td');
        $("#removeName").text((tds.eq(0).text()).replace(/(^\s*)|(\s*$)/g, ""));
        $("#removeId").val(id);
        $("#operotion").val(oper)
        $("#removeModal").modal("show");
    }

</script>
</body>
</html>