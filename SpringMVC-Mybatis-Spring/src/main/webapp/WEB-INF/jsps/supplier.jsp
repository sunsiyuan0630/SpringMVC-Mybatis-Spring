<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/SpringMVC/Resources/icon/favicon.ico">
<title>main</title>
<link href="/SpringMVC/Resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/SpringMVC/Resources/css/dashboard.css" rel="stylesheet">
<link href="/SpringMVC/Resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link href="/SpringMVC/Resources/css/storage.css" rel="stylesheet">
<script src="/SpringMVC/Resources/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<div class="container-fluid">    
        <div class="table-responsive">
          <h1 class="page-header" style="top: 0px; margin-top: 20px;font-weight:bold;">添加供应商</h1>
	         <form class="form-horizontal" role="form" id="supplierForm">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">供应商</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入供应商名称" id="supplierName">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="text" class="col-sm-2 control-label">供应商地址</label>
				    <div class="col-sm-10">
				      <input type="text"  id="supplierAddress" class="form-control" placeholder="请输入供应商地址">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">供应商电话</label>
				    <div class="col-sm-10">
				      <input type="text" id="supplierPhone" class="form-control" placeholder="请输入供应商电话" >
				    </div>
				  </div>
				  
				  <div id="submit">
				  	<button type="button" class="btn btn-info" id="submit_button">提交</button>
				  </div>
				</form>
		  

          <h2 class="sub-header">供应商信息</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>供应商名称</th>
                  <th>供应商地址</th>
                  <th>供应商电话</th>
                  <th>该信息维护人</th>
                  <th>该信息最后维护时间</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${page.list}" var="supplierInfo">
                    <tr>
                        <td>${supplierInfo.supplierName}</td>
                        <td>${supplierInfo.supplierAddress}</td>
                        <td>${supplierInfo.supplierPhone}</td>
                        <td>${supplierInfo.people}</td>
                        <td>${supplierInfo.lastUpdateTime}</td>
                        <td><a onclick="removeSupplier(${supplierInfo.supplierId})" href="#" class="btn btn-primary btn-xs" role="button" data-toggle="modal" data-target="#Modal">删除</a>
                    </tr>
                </c:forEach>
              </tbody>
              <tfoot>
             <tr>
             <td colspan="5">
             
             <nav>
				  <ul class="pagination">
				    <c:if test="${page.hasPreviousPage}">
				    <li class="previous">
				      <a href="${pageContext.request.contextPath}/struts/supplier?pageNum=${page.prePage}&pageSize=${page.pageSize}" aria-label="Previous">
				        <span aria-hidden="true">上一页</span>
				      </a>
				    </li>
				     </c:if>
				     <c:if test="${!page.hasPreviousPage }">
				      <li class="disabled previous">
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">上一页</span>
				      </a>
				    </li>
				     </c:if>
				    
				    <c:forEach items="${page.navigatepageNums}" var="nav">
                        <c:if test="${nav == page.pageNum}">
                        <li class="active">
                            <a href="#">${nav}</a>
                        </li>
                        </c:if>
                        <c:if test="${nav != page.pageNum}">
                        <li>
                            <a href="${pageContext.request.contextPath}/struts/supplier?pageNum=${nav}&pageSize=${page.pageSize}">${nav}</a>
                        </li>
                        </c:if>
                    </c:forEach>
				     <c:if test="${page.hasNextPage}">
				     <li class="next">
				      <a href="${pageContext.request.contextPath}/struts/supplier?pageNum=${page.nextPage}&pageSize=${page.pageSize}" aria-label="Next">
				        <span aria-hidden="true">下一页</span>
				      </a>
				     </li>
				     </c:if>
				     <c:if test="${!page.hasNextPage}">
				     <li class="disabled next">
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">下一页</span>
				      </a>
				     </li>
				     </c:if>
				  </ul>
				</nav>
             </td>
             </tr>
             </tfoot>
              
            </table>
          </div>
      </div>
    </div>
    
    
    <script src="/SpringMVC/Resources/js/jquery-1.11.0.min.js"></script>
    <script src="/SpringMVC/Resources/js/bootstrap.min.js"></script>
    <script src="/SpringMVC/Resources/js/holder.min.js"></script>
    <script src="/SpringMVC/Resources/js/instorage.js"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="/SpringMVC/Resources/js/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
    $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });

    function removeSupplier(id){
    	var truthBeTold = confirm("是否确认删除？");
    	if (truthBeTold) { 
			deleteSupplier(id);
		} ;
    }
    function deleteSupplier(id){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/delSupplierInfo",
    		type:"POST",
    		dataType:"text",
    		data:{id:id},
    		success:function(data){
    			
    			if(data == "error"){
    				alert("出错了！");
    			}else if(data == "success") {
    				alert("删除成功");
    				window.location.reload();
    			}
    		}
    	});
    }
    $("#submit_button").click(
    		function(){
		    	var supplierInfo = {};
		    	var supplierName=$.trim($("#supplierName").val()); 
		    	var supplierAddress=$.trim($("#supplierAddress").val());
		    	var supplierPhone = $.trim($("#supplierPhone").val());
		    	
		    	if(supplierName == ""){
		    		alert("供应商名称不能为空")
		    		return;
		    	}
		    
		    	supplierInfo["supplierName"] = supplierName;
		    	supplierInfo["supplierAddress"] = supplierAddress;
		    	supplierInfo["supplierPhone"] = supplierPhone;
		    	
		    	$.ajax({
		    		url:"${pageContext.request.contextPath}/ajax/sendSupplierInfo",
		    		type:"POST",
		    		dataType:"text",
		    		data:supplierInfo,
		    		success:function(data){
		    			if(data == "error"){
		    				alert("出错了！");
		    			}else if(data == "success") {
		    				alert("添加成功");
		    				window.location.reload();
		    			}
		    		}
		    	});
    	
    });
    
	</script>
	
</body>
</html>