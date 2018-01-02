<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>机构人员管理</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="/example/favicon.ico">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../css/animate.min.css" rel="stylesheet">
    <link href="../../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="../../css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="../../css/z_style.css" rel="stylesheet">
    <link href="../../css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div id="page-wrapper" class="white-bg dashbard-1">
    <div class=" row wrapper white-bg" id="content-main">
        <ol class="breadcrumb" style="margin-left: 40px">
            <li style="font-size: 15px">
                <strong>
                    <a href="user-jmpHomepage">首页</a> >><a href="Organization-jmpOrgManager1">机构管理</a>>>成员机构
                </strong>
            </li>
        </ol>
    </div>
    <div class="form-group col-md-2">
        <ul class="nav navbar">
            <li>
                <a href="Organization-jmpOrgManager1"><button class="btn-warning btn">成员管理</button></a>
            </li>
            <li>
                <a href="Organization-jmpOrgManager2"><button class="btn-primary btn">查看项目</button></a>
            </li>
        </ul>
    </div>
    <div class="col-md-10" style="padding: 15px 10px 0px 0px;margin-left: -50px">
        <div class="panel">
            <div class="panel-heading">
                <div class="panel-options col-md-4">
                    <ul class="nav nav-tabs">
                        <li>
                            <a href="project_detail.html#tab-1" data-toggle="tab">当前成员</a>
                        </li>
                        <li class="">
                            <a href="project_detail.html#tab-2" data-toggle="tab">发出的邀请</a>
                        </li>
                    </ul>
                </div>
                <div style="float: left;margin-top: 10px" class="col-md-4"><button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#invite">邀请用户</button></div>
                <div style="float: right;width: 300px" class="col-md-4">
                    <select id="gender" class="form-control" name="gender">
                        <option name="" disabled  selected="selected" >选择机构</option>
                        <s:iterator value="list">
                            <option name="displayOrg" class="orgName"><s:property value="NAME"/> </option>
                        </s:iterator>
                    </select>
                </div>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-1">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table">
                                        <table id="showOrgMember"
                                               data-toggle="table"
                                               data-url="Organization-showAllMember"
                                               data-click-to-select="true"
                                               data-search="true"
                                               data-show-refresh="true"
                                               data-show-toggle="true"
                                               data-show-columns="true"
                                               data-toolbar="#toolbar"
                                               data-query-params="quefryParams"
                                               data-pagination="true"
                                               data-halign="center"
                                               data-striped="true"
                                               data-page-size="6"
                                               data-height="410"
                                               data-page-list="All"
                                        >
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <div style="margin:-30px 0px 0px 0px">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="bootstrap-table">
                                        <table id="showOperate"
                                               data-toggle="table"
                                               data-url="orgInvite-showList"
                                               data-click-to-select="true"
                                               data-search="true"
                                               data-show-refresh="true"
                                               data-show-toggle="true"
                                               data-show-columns="true"
                                               data-toolbar="#toolbar"
                                               data-query-params="quefryParams"
                                               data-pagination="true"
                                               data-halign="center"
                                               data-striped="true"
                                               data-page-size="6"
                                               data-height="410"
                                               data-page-list="All"
                                        >
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div  class="modal inmodal" id="invite" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title">邀请用户</h4>
            </div>
            <div class="modal-body">
                <div class="form-group"><label>用户名</label> <input id="user_name" type="text" placeholder="请输入用户名" class="form-control" required="required"></div>
                <div class="form-group"><label>备注</label> <input id="message" type="text" placeholder="请输入备注" class="form-control" required=""></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                <button id="invite-button" type="button" class="btn btn-primary">邀请</button>
            </div>
        </div>
    </div>
</div>
<script src="../../js/jquery.min.js?v=2.1.4"></script>
<script src="../../js/bootstrap.min.js?v=3.3.6"></script>
<script src="../../js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="../../js/content.min.js?v=1.0.0"></script>
<script src="../../js/plugins/toastr/toastr.min.js"></script>
<script src="../../js/mjy.js"></script>
<script src="../../js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

</body>
<script>
    $(document).ready(function(){
        $("option.orgName").click(function () {
            var element = $(this).val();
            console.log(element);
            Ffive(element);
            Ffive2(element);
            }
        );
    });
    $('#showOrgMember').bootstrapTable({
            columns: [
                {
                    title: '姓名',
                    field: 'name',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'mail',
                    title: '邮箱',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'tel',
                    title: '联系方式',
                    align: 'center'
                },{
                    field:'operate',
                    title:'操作',
                    align:'center',
                    events: "actionEvents",
                    width:"240px",
                    formatter: "operateFormatter"
                }
            ]
        }
    );
    $('#showOperate').bootstrapTable({
            columns: [
                {
                    title: '姓名',
                    field: 'USER_NAME',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'DATE',
                    title: '邀请时间',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'MESSAGE',
                    title: '备注信息',
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'STATE',
                    title: '状态',
                    sortable: true,
                    align: 'center',
                    formatter: "rename"
                }
            ]
        },
        function () {
        alert("?")
            var first=$("#gender").find("option:first").val();
            console.log(first);
            Ffive(first)
        }
    );
    function Ffive(element){
        $.ajax(
            {
                url:"Organization-showAllMember",
                data: {NAME: element},
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var orgMemberList = JSON.parse(json.res);
                    //finishingTask为table的id
                    $('#showOrgMember').bootstrapTable('load',orgMemberList);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        )
    }
    function Ffive2(element) {
        $.ajax(
            {
                url:"orgInvite-showList",
                data: {ORG_NAME: element},
                dataType:"json",
                type: "Get",
                async: "false",
                success:function(json){
                    var orgOperateList = JSON.parse(json.res);
                    //finishingTask为table的id
                    $('#showOperate').bootstrapTable('load',orgOperateList);
                },
                error:function(){
                    alert(" 错误");
                }
            }
        )
    }
    function operateFormatter(value,row,index) {
        return[
            '<a class="grant" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >机构转移</button></a>',
            '<a class="delete" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >踢出机构</button></a>'
        ].join('');
    }
    function rename(value,row,index) {
        var state=parseInt(row.STATE);
        if(state==0)
            return '未接受';
        else if(state==1)
            return '已同意';
        else if(state==2)
            return ['已拒绝',
                '<a class="reAgree" style="padding-left: 10px"><button class="btn btn-info text-center btn-xs " >重新邀请</button></a>'].join('');
    }
    window.actionEvents = {
        'click .grant': function(e, value, row, index) {
            //转移机构管理权限
            var id_user = parseInt(row.id_user);
            console.log(id_user);
            var currentOrg=$("#gender").val();
            $.ajax({
                type: "GET",
                url: "orgInvite-grantOrg",
                data: {ID_USER:id_user,ORG_NAME:currentOrg},
                dataType: "json",
                success: function (result) {
                    if(result.res===true) {
                        showtoast("success", "转移机构成功", "操作成功");
                        location.href = "user-jmpTemp";
                        }
                },
                error: function (result) {
                    showtoast("error", "转移机构失败", "操作失败")
                }
            })
        },
        'click .delete' : function(e, value, row, index) {
            //踢出机构
            var id_user = parseInt(row.id_user);
            var currentOrg=$("#gender").val();
            $.ajax({
                type: "GET",
                url: "orgInvite-deleteUser",
                data: {ID_USER:id_user,ORG_NAME:currentOrg},
                dataType: "json",
                success: function (result) {
                    if(result.res===true)  {
                        showtoast("success", "踢出成功", "操作成功")
                        $('#showOrgApply').bootstrapTable('load',orgList);
                    }
                    else  showtoast("error", "踢出失败", "操作失败")
                },
                error: function (result) {
                    showtoast("error", "踢出失败", "操作失败")
                }
            })
        }
    }
</script>
<script>
    $("button#invite-button").click(function (){
        var currentOrg=$("#gender").val();
        $.ajax(
            {
                url:"orgInvite-InviteUser",
                data:{ORG_NAME:currentOrg,USER_NAME:$("input#user_name").val(),MESSAGE:$("input#message").val()},
                dataType:"json",
                type:"Post",
                async:"false",
                success:function (result) {
                    if(result.res===true) {
                        showtoast("success", "邀请成功", "邀请成功");
                        location.href="Organization-jmpOrgManager1";
                    }
                    else {
                        showtoast("error", "邀请失败", "邀请失败")
                        location.href="Organization-jmpOrgManager1";
                    }
                },
                error: function (result) {
                    showtoast("error", "邀请失败", "邀请失败")
                    location.href="Organization-jmpOrgManager1";
                }
            }
        )
    })
</script>
</html>
