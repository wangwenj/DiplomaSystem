<%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/20
  Time: 上午2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编写留言</title>

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
                    <h3>编写留言</h3>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <form method="post" action="replyMessage.message" id="staff_modal">
                    <div>
                        <input type="text" style="display: none" name="id_message_reply" value="<%=(int)request.getAttribute("id_message")%>">
                    </div>
                    <div class="ibox-content">
                        <textarea id="editor" placeholder="这里输入内容" autofocus name="reply_content">
                        </textarea>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <div align="center">
        <form action="" method="">
            <a onclick="document.getElementById('staff_modal').submit();"
               class="btn btn-success"
               data-dismiss="modal">确定</a>
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

