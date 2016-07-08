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

<link href="/SpringMVC/Resources/css/jquery-suggest.css" rel="stylesheet">
<script src="/SpringMVC/Resources/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<div class="container-fluid">    
        <div class="table-responsive">
          <h1 class="page-header" style="top: 0px; margin-top: 20px;font-weight:bold;">入库</h1>
	         <form class="form-horizontal" role="form" id="goodForm" action="${pageContext.request.contextPath}/struts/storage">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品名称</label>
				    <div style="width: 60%; padding-left: 2px;min-height: 1px;padding-right: 15px;float:left;">
				      <input type="text" class="form-control" placeholder="请输入商品名称" id="goodNameDisplay" name="goodNameDisplay"> 
				      <input type="hidden"  id="goodName" name="goodId" value="">
				      <div id='suggest' class="ac_results"></div>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="text" class="col-sm-2 control-label">商品编号</label>
				    <div style="width: 60%; padding-left: 2px;min-height: 1px;padding-right: 15px;float:left;">
				    	<input type="text" class="form-control" placeholder="请输入编号" id="goodIdDisplay" >
				      	<div id='suggest2' class="ac_results"></div>
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">供应商</label>
				    <div class="col-sm-10">
				      <input type="text" id="goodSupplier" class="form-control" placeholder="请输入供应商名称" >
				      <input type="hidden" id="goodSupplierCode" value="">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品规格</label>
				    <div class="col-sm-10">
				      <input type="text"  id="goodSpeci" class="form-control" placeholder="请输入商品规格">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">商品单价</label>
				    <div class="col-sm-10">
				      <input type="text" id="goodPrice" name="goodPrice" class="form-control" placeholder="请输入商品单价" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品数量</label>
				    <div class="col-sm-10">
				      <input type="text"  id="goodNumber" name="goodNumber" class="form-control" placeholder="请输入商品数量">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">经手人</label>
				    <div style="width: 60%; padding-left: 2px;min-height: 1px;padding-right: 15px;float:left;">
				      <input type="text" id="peopleDisplay" class="form-control" placeholder="请输入经手人">
				      <input type="hidden"  id="people" name="people" value="">
				      <div id='suggest3' class="ac_results"></div>
				    </div>
				  </div>
				  
				  <div class="form-group" >
				    <label class="col-sm-2 control-label">入库时间</label>
				    <div class="input-group date form_date col-md-3" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dateInput" data-link-format="yyyy-mm-dd hh:ii:ss">
                    	<input class="form-control"  type="text" size="16"  id="dateInput" name="dateInput" readonly>
						<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
						<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                	</div>
					
				  </div>
				  
				 
				  <div id="submit">
				  	<button type="button" class="btn btn-info" id="submit_button">提交</button>
				  </div>
				</form>
		  

          <h2 class="sub-header">入库信息</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>供应商</th>
                  <th>单价</th>
                  <th>规格</th>
                  <th>数量</th>
                  <th>入库时间</th>
                  <th>经手人</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${page.list}" var="in">
                    <tr>
                      	<td>${in.goodName}</td>
                        <td>${in.goodCode}</td>
                        <td>${in.supplierName}</td>
                        <td>${in.price}</td>
                        <td>${in.goodSpeci}</td>
                        <td>${in.number}</td>
                        <td>${in.date}</td>
                        <td>${in.people}</td>
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
				      <a href="${pageContext.request.contextPath}/struts/storage?pageNum=${page.prePage}&pageSize=${page.pageSize}" aria-label="Previous">
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
                            <a href="${pageContext.request.contextPath}/struts/storage?pageNum=${nav}&pageSize=${page.pageSize}">${nav}</a>
                        </li>
                        </c:if>
                    </c:forEach>
				     <c:if test="${page.hasNextPage}">
				     <li class="next">
				      <a href="${pageContext.request.contextPath}/struts/storage?pageNum=${page.nextPage}&pageSize=${page.pageSize}" aria-label="Next">
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
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="/SpringMVC/Resources/js/ie10-viewport-bug-workaround.js"></script>
    
    <script type="text/javascript" src="/SpringMVC/Resources/js/j.dimensions.js"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/j.suggest.js"></script>
    <script type="text/javascript">
	
    $(function(){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/getGoodNameCatalog",
    		dataType:"json",
    		type:"POST",
    		success:function(data){
    		    var catalog = new Array();
    			for(var i=0;i<data.length;i++){
    				catalog[i] = new Array(data[i].id,data[i].name,data[i].pinyin,data[i].jianpin);
    			}
    			$(function(){
	                $("#goodNameDisplay").suggest(catalog,{hot_list:catalog,dataContainer:'#goodName',onSelect:function(){getGoodInfo();},attachObject:'#suggest'});
	            });
    		}
    	});
    });
    $(function(){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/getGoodCodeCatalog",
    		dataType:"json",
    		type:"POST",
    		success:function(data){
    		    var codeCatalog = new Array();
    			for(var i=0;i<data.length;i++){
    				codeCatalog[i] = new Array(data[i].id,data[i].goodCode,'','');
    			}
    			$(function(){
	                $("#goodIdDisplay").suggest(codeCatalog,{hot_list:codeCatalog,dataContainer:'#goodName',onSelect:function(){getGoodInfo();},attachObject:'#suggest2'});
	            });
    		}
    	});
    }); 
    
    $(function(){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/getPeopleCatalog",
    		dataType:"json",
    		type:"POST",
    		success:function(data){
    		    var peopleCatalog = new Array();
    			for(var i=0;i<data.length;i++){
    				peopleCatalog[i] = new Array(data[i].id,data[i].name,data[i].pinyin,data[i].jianpin);
    			}
    			$(function(){
	                $("#peopleDisplay").suggest(peopleCatalog,{hot_list:peopleCatalog,dataContainer:'#people',attachObject:'#suggest3'});
	            });
    		}
    	});
    }); 
    
    function getGoodInfo(){
    	var id = $('#goodName').val();
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/getGoodInfo",
    		dataType:"json",
    		type:"POST",
    		data:{id:id},
    		success:function(data){
    		    $('#goodNameDisplay').val(data[0].goodName);
    		    $('#goodIdDisplay').val(data[0].goodCode);
    		    $('#goodId').val(data[0].goodCode);
    		    $('#goodSupplier').val(data[0].supplierName);
    		    $('#goodSpeci').val(data[0].goodSpeci);
    		    $('#goodSupplierCode').val(data[0].supplierCode);
    		}
    	});
    }
        </script>
    <script type="text/javascript">
    function getTime(){
    	var date = new Date();
    	var year = date.getFullYear();
    	var month = date.getMonth();
    	month++;
    	if(month<10)
    		month = '0'+String(month);
    	var day = date.getDate();
    	var hour = date.getHours();
    	var min = date.getMinutes();
    	var second = date.getSeconds();
    	var time = ''+year+'-'+month+'-'+day+' '+hour+':'+min+':'+second;
    	return time;
    }
    $(function(){
    	var now = getTime();
    	$('#dateInput').val(now);
    });
    
    $('.form_date').datetimepicker({
    	language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        initialDate:new Date()
    });

    
    $("#submit_button").click(
    		function(){
		    	var goodInfo = {};
		    	var goodName=$.trim($("#goodName").val()); 
		    	var goodSupplier = $.trim($("#goodSupplier").val());
		    	var price = $.trim($("#goodPrice").val());
		    	var number = $.trim($("#goodNumber").val());
		    	var people = $.trim($("#people").val());
		    	var date = $.trim($("#dateInput").val());
		    	console.log(name);
		    	console.log(price);
		    	console.log(number);
		    	console.log(date);
		    	if(goodName == "" || price == "" || number == "" || date == ""){
		    		alert("商品名称/商品编号/商品价格/商品数量/入库时间不能为空");
		    		return;
		    	}
		    	
		    	if(isNaN(number) || isNaN(price)){
		    		alert("商品数量/商品价格不能为非数字");
		    		return;
		    	}
		    	
		    	$('form#goodForm').submit();
		    	/*
		    	goodInfo["goodName"] = goodName;
		    	goodInfo["goodId"] = goodId;
		    	goodInfo["goodSupplier"] = goodSupplier;
		    	goodInfo["price"] = price;
		    	goodInfo["goodSpeci"] = goodSpeci;
		    	goodInfo["number"] = number;
		    	goodInfo["people"] = people;
		    	goodInfo["date"] = date;*/
		    	
		    	/*$.ajax({
		    		url:"${pageContext.request.contextPath}/ajax/sendGoodInfo",
		    		type:"POST",
		    		dataType:"text",
		    		data:goodInfo,
		    		success:function(data){
		    			if(data == "false"){
		    				
		    			}
		    		}
		    	});*/
    	
    });
    
	</script>
	
</body>
</html>