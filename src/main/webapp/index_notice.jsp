<%@ page import="entity.Notice" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: winnifrede
  Date: 2018/5/21
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    List<Notice> noticePassList = (List<Notice>) request.getAttribute("noticePassList");
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>公告</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight blog">
    <div class="row">
        <%for (Notice notice : noticePassList) {%>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content">

                        <h2>
                            <%=notice.getTitle()%>
                        </h2>

                    <div class="small m-b-xs">
                        <strong><%=notice.getWrite_name()%>
                        </strong>
                        <span class="text-muted"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;<%=notice.getTime_approval()%></span>
                    </div>
                    <p>
                        <%=notice.getContent()%>
                    </p>
                    <div class="row">
                        <div class="col-md-6">

                        </div>
                        <div class="col-md-6">
                            <div class="small text-right">
                                <h5>审核人：</h5>
                                <div><i class="fa fa-eye">&nbsp;&nbsp; </i><%=notice.getReply_name()%></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%
            }
        %>
    </div>
</div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


</html>
