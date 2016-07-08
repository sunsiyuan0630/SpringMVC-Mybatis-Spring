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
<!-- 
        <div class="col-sm-9 col-md-10">
          <h1 class="page-header" style="top: 0px; margin-top: 20px;font-weight:bold;">入库</h1>
	         <form class="form-horizontal" role="form" id="goodForm">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入商品名称" id="goodName">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="text" class="col-sm-2 control-label">商品编号</label>
				    <div class="col-sm-10">
				      <input type="text"  id="goodId" class="form-control" placeholder="请输入商品编号">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">供应商</label>
				    <div class="col-sm-10">
				      <input type="text" id="goodSupplier" class="form-control" placeholder="请输入供应商名称" >
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">商品单价</label>
				    <div class="col-sm-10">
				      <input type="text" id="goodPrice" class="form-control" placeholder="请输入商品单价" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品规格</label>
				    <div class="col-sm-10">
				      <input type="text"  id="goodSpeci" class="form-control" placeholder="请输入商品规格">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品数量</label>
				    <div class="col-sm-10">
				      <input type="text"  id="goodNumber" class="form-control" placeholder="请输入商品数量">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">经手人</label>
				    <div class="col-sm-10">
				      <input type="text" id="people" class="form-control" placeholder="请输入经手人">
				    </div>
				  </div>
				  
				  <div class="form-group" style="width:50%">
				    <label class="col-sm-2 control-label">入库时间</label>
				    <div class="input-group date form_date col-md-2" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    	<input class="form-control" size="12" type="text" value="" style="width: 125px;" id="data-input">
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                	</div>
					
				  </div>
				  
				 
				  <div id="submit">
				  	<button type="button" class="btn btn-info" id="submit_button">提交</button>
				  </div>
				</form>
		  --> 

          <h2 class="sub-header">出库记录</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>供应商</th>
                  <th>规格</th>
                  <th>销售单价</th>
                  <th>销售数量</th>
                  <th>出库时间</th>
                  <th>经手人</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${page.list}" var="outstorageRecord">
                    <tr>
                      	<td>${outstorageRecord.goodName}</td>
                        <td>${outstorageRecord.goodCode}</td>
                        <td>${outstorageRecord.goodSupplier}</td>
                        <td>${outstorageRecord.goodSpeci}</td>
                        <td>${outstorageRecord.sellPrice}</td>
                        <td>${outstorageRecord.number}</td>
                        <td>${outstorageRecord.date}</td>
                        <td>${outstorageRecord.people}</td>
                    </tr>
                </c:forEach>
              </tbody>
              
              <tfoot>
             <tr>
	             <td colspan="8">
	             <nav>
					  <ul class="pagination">
					    <c:if test="${page.hasPreviousPage}">
					    <li class="previous">
					      <a href="${pageContext.request.contextPath}/struts/outstorageRecord?pageNum=${page.prePage}&pageSize=${page.pageSize}" aria-label="Previous">
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
	                            <a href="${pageContext.request.contextPath}/struts/outstorageRecord?pageNum=${nav}&pageSize=${page.pageSize}">${nav}</a>
	                        </li>
	                        </c:if>
	                    </c:forEach>
					     <c:if test="${page.hasNextPage}">
					     <li class="next">
					      <a href="${pageContext.request.contextPath}/struts/outstorageRecord?pageNum=${page.nextPage}&pageSize=${page.pageSize}&goodName=${goodName}&goodId=${goodId}" aria-label="Next">
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

    
    $("#submit_button").click(
    		function(){
		    	var goodInfo = {};
		    	var goodName=$.trim($("#goodName").val()); 
		    	var goodId=$.trim($("#goodId").val());
		    	var goodSupplier = $.trim($("#goodSupplier").val());
		    	var price = $.trim($("#goodPrice").val());
		    	var goodSpeci = $.trim($("#goodSpeci").val());
		    	var number = $.trim($("#goodNumber").val());
		    	var people = $.trim($("#people").val());
		    	var date = $.trim($("#data-input").val());
		    	
		    	if(goodName == "" || goodId == "" || price == "" || number == "" || date == ""){
		    		alert("商品名称/商品编号/商品价格/商品数量/入库时间不能为空");
		    		return;
		    	}
		    	
		    	if(isNaN(number) || isNaN(price)){
		    		alert("商品数量/商品价格不能为非数字");
		    		return;
		    	}
		    	goodInfo["goodName"] = goodName;
		    	goodInfo["goodId"] = goodId;
		    	goodInfo["goodSupplier"] = goodSupplier;
		    	goodInfo["price"] = price;
		    	goodInfo["goodSpeci"] = goodSpeci;
		    	goodInfo["number"] = number;
		    	goodInfo["people"] = people;
		    	goodInfo["date"] = date;
		    	
		    	$.ajax({
		    		url:"${pageContext.request.contextPath}/ajax/sendGoodInfo",
		    		/* headers: {'Content-type': 'application/json;charset=UTF-8'}, */
		    		type:"POST",
		    		dataType:"text",
		    		data:goodInfo,
		    		success:function(data){
		    			//没更新成功
		    			if(data == "false"){
		    				
		    			}
		    		}
		    	});
    	
    });
    
	</script>
	
</body>
</html>