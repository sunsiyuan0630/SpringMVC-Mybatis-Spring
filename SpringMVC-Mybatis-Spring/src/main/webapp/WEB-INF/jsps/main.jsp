<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="icon" href="/SpringMVC/Resources/icon/favicon.ico">
<style>
.main_strut{
	width:100%; height:100%; box-sizing:border-box;
}
.iframe_top{
	width:100%;
	height:50px;

}
.iframe_content{
	width:100%;
	margin-top:2px;
	position: absolute;
	height:100%;
}
</style>
</head>
<body style="margin-top: 0px; margin-right: 0px; margin-left: 0px;height:100%;">
<div class="main_strut">
	 <div class="iframe_top">
        <iframe width="100%" height="100%" src="/SpringMVC/struts/top" frameborder="0" scrolling="no" style="-ms-overflow-x: hidden;"></iframe>
    </div>
    <div class="iframe_content">
        <iframe name="content" width="100%" height="100%" src="/SpringMVC/struts/content" frameborder="0" scrolling="no" style="-ms-overflow-x: hidden;"></iframe>
    </div>
</div>
</body>

</html>