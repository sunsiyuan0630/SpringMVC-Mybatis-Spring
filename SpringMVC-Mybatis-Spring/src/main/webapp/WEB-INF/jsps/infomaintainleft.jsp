<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/SpringMVC/Resources/icon/favicon.ico">
<title>left</title>
<link href="/SpringMVC/Resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/SpringMVC/Resources/css/dashboard.css" rel="stylesheet">
<script src="/SpringMVC/Resources/js/ie-emulation-modes-warning.js"></script>
<script src="/SpringMVC/Resources/js/jquery-1.11.0.min.js"></script>
<style>
.main{
	top:51px;
}
.c1{
	
}
.c2{

}

.c3{
position:fixed;
    top: 51px;
    bottom: 0;
    left: 0;
    z-index: 1000;
    display: block;
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
    background-color: #f5f5f5;
    border-right: 1px solid #eee;
}
</style>
</head>
<body>

        <div class="c3" style="top: 0px; padding-top: 0px;height:100%;width:100%;">
          <ul class="nav nav-sidebar">
          	<li class="active"><a href="${pageContext.request.contextPath}/struts/supplier" target="view_frame">维护供应商</a></li>
            <li><a href="${pageContext.request.contextPath}/struts/goodCatalog" target="view_frame">维护商品目录</a></li>
          </ul>
          <!-- 
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
           -->
        </div>
        

<script type="text/javascript">
	$("ul.nav li").bind('click',function(){
		$('ul.nav li').each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});
</script>
    <script src="/SpringMVC/Resources/js/jquery-1.11.0.min.js"></script>
    <script src="/SpringMVC/Resources/js/bootstrap.min.js"></script>
    <script src="/SpringMVC/Resources/js/holder.min.js"></script>
    <script src="/SpringMVC/Resources/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>