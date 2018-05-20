<%@ page import="entity.Notice" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Notice notice= (Notice) request.getAttribute("notice");
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公告详情</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/plugins/simditor/simditor.css"/>
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">

    <div class="row">
        <div class="col-sm-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h1>公告详情</h1>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <form method="post" action="submitNotice.notice" id="staff_modal">
                    <div class="form-group row">

                        <div class="col-md-1 modal-label">
                            <label class="control-label" style="font-size: large; padding-left: 20px;
                    margin-top: 8px;">题目</label></div>
                        <div class="col-md-11">
                            <input type="text" class="form-control" id="notice_title" name="notice_title" value="<%=notice.getTitle()%>">
                        </div>
                    </div>
                    <div class="ibox-content">
                        <textarea id="editor" autofocus name="notice_content"><%=notice.getContent()%></textarea>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <div align="center">
        <form action="" method="">
            <a href="dealNotice.notice?id=<%=notice.getId_announcement()%>&oper=通过"  class="btn btn-success" data-dismiss="modal">通过</a>
            <a href="dealNotice.notice?id=<%=notice.getId_announcement()%>&oper=未通过"  class="btn btn-success" data-dismiss="modal">不通过</a>
        </form>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="js/plugins/simditor/module.js"></script>
<script type="text/javascript" src="js/plugins/simditor/uploader.js"></script>
<script type="text/javascript" src="js/plugins/simditor/hotkeys.js"></script>
<script type="text/javascript" src="js/plugins/simditor/simditor.js"></script>
<script src="js/wwj.js"></script>
<script>
    $(document).ready(function () {
        var editor = new Simditor({textarea: $("#editor"), defaultImage: "img/a9.jpg"})
    });
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


</html>
