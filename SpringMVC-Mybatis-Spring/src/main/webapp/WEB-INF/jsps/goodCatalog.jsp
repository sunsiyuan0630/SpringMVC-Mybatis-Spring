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
<link href="/SpringMVC/Resources/css/jquery-suggest.css" rel="stylesheet">
<link href="/SpringMVC/Resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/SpringMVC/Resources/css/dashboard.css" rel="stylesheet">
<link href="/SpringMVC/Resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link href="/SpringMVC/Resources/css/storage.css" rel="stylesheet">


<script src="/SpringMVC/Resources/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<div class="container-fluid">    
        <div class="table-responsive">
          <h1 class="page-header" style="top: 0px; margin-top: 20px;font-weight:bold;">添加商品</h1>
	         <form class="form-horizontal" role="form" id="supplierForm">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入商品名称" id="goodName">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="text" class="col-sm-2 control-label">商品编码</label>
				    <div class="col-sm-10">
				      <input type="text"  id="goodCode" class="form-control" placeholder="请输入商品编码">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品规格</label>
				    <div class="col-sm-10">
				      <input type="text" id="goodSpeci" class="form-control" placeholder="请输入商品规格" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品供应商</label>
				    <div  style="width: 60%; padding-left: 2px;min-height: 1px;padding-right: 15px;float:left;">
				      <input type="text" name="goodSupplierName" id="goodSupplierName" class="form-control"  placeholder="请输入供应商">
				      <input type="hidden" name="goodSupplier" id="goodSupplier" value="">
				      <div id='suggest' class="ac_results"></div>
				    </div>
				  </div>
				  <!-- 
				  <div id="box">
		            <input type="hidden" name="arrcity_3word" id="arrcity_3word" value="" />
		            <label for="arrcity">出发城市：</label><input type="text" name="arrcity" id="arrcity" />
		            <div id='suggest' class="ac_results">
		            </div>
		            
		            
		        </div>
				   -->
				  <div id="submit">
				  	<button type="button" class="btn btn-info" id="submit_button">提交</button>
				  </div>
				</form>
		  

          <h2 class="sub-header">商品信息</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编码</th>
                  <th>商品规格</th>
                  <th>商品供应商</th>
                  <th>该信息维护人</th>
                  <th>该信息最后维护时间</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${page.list}" var="goodCatalogInfo">
                    <tr>
                        <td>${goodCatalogInfo.goodName}</td>
                        <td>${goodCatalogInfo.goodCode}</td>
                        <td>${goodCatalogInfo.goodSpeci}</td>
                        <td>${goodCatalogInfo.goodSupplier}</td>
                        <td>${goodCatalogInfo.people}</td>
                        <td>${goodCatalogInfo.date}</td>
                        <td><a onclick="getDetailGoodInfo(${goodCatalogInfo.id})" href="#" class="btn btn-primary btn-xs" role="button" data-toggle="modal" data-target="#Modal">修改</a>
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
				      <a href="${pageContext.request.contextPath}/struts/goodCatalog?pageNum=${page.prePage}&pageSize=${page.pageSize}" aria-label="Previous">
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
                            <a href="${pageContext.request.contextPath}/struts/goodCatalog?pageNum=${nav}&pageSize=${page.pageSize}">${nav}</a>
                        </li>
                        </c:if>
                    </c:forEach>
				     <c:if test="${page.hasNextPage}">
				     <li class="next">
				      <a href="${pageContext.request.contextPath}/struts/goodCatalog?pageNum=${page.nextPage}&pageSize=${page.pageSize}" aria-label="Next">
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
 
 <!-- 模态框 -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">商品信息</h4>
        <div class="container-fluid">
        <input type="hidden" id="id_good" value="">
        	<table class="table">
        		<thead>
        		<tr>
        			<th>商品名称</th>
        			<th>商品编码</th>
        			<th>商品规格</th>
        			<th>商品供应商</th>
        		</tr>
        		</thead>
        		<tbody>
        		<tr>
        			<td id="goodNameDetail"></td>
        			<td id="goodCodeDetail"></td>
        			<td id="goodSpeciDetail"></td>
        			<td id="goodSupplierDetail"></td>
        		</tr>
        		</tbody>
        	</table>
        </div>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="out-number" class="col-sm-2 control-label">商品名称</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="out_name">
            </div>
          </div>
         
         <div class="form-group">
            <label for="out-number" class="col-sm-2 control-label">商品编码</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="out_code">
            </div>
          </div>
         
          <div class="form-group">
            <label for="out-number" class="col-sm-2 control-label">商品规格</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="out_speci">
            </div>
          </div>
          
          <div class="form-group" style="width: 100%">
          <label for="out_text" class="col-sm-2 control-label">商品供应商</label>
          	<div class="col-sm-10">
          		<input type="text" class="form-control" id="out_supplier">
          	</div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="modify" type="button" class="btn btn-warning">修改</button>
      </div>
    </div>
  </div>
</div>

<!-- 模态框 -->   
    
    <script src="/SpringMVC/Resources/js/jquery-1.11.0.min.js"></script>
    <script src="/SpringMVC/Resources/js/bootstrap.min.js"></script>
    <script src="/SpringMVC/Resources/js/holder.min.js"></script>
    <script src="/SpringMVC/Resources/js/instorage.js"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="/SpringMVC/Resources/js/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/j.dimensions.js"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/j.suggest.js"></script>
    <script type="text/javascript">

    $(function(){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/getSupplierCatalog",
    		dataType:"json",
    		type:"POST",
    		success:function(data){
    		    var catalog = new Array();
    			for(var i=0;i<data.length;i++){
    				catalog[i] = new Array(data[i].code,data[i].name,data[i].pinyin,data[i].jianpin);
    			}
    			$(function(){
	                $("#goodSupplierName").suggest(catalog,{hot_list:catalog,dataContainer:'#goodSupplier',attachObject:'#suggest'});
	                //$("#city2").suggest(citys,{hot_list:commoncitys,attachObject:"#suggest2"});
	            });
    		}
    	});
    });
            
        </script>
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
    function getDetailGoodInfo(id){
    	$('#id_good').val(id);
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/getGoodDetailInfo",
    		type:"POST",
    		dataType:"json",
    		data:{id:id},
    		success:function(data){
    			$('#goodNameDetail').append(data.goodName);
    			$('#goodCodeDetail').append(data.goodId);
    			$('#goodSpeciDetail').append(data.goodSpeci);
    			$('#goodSupplierDetail').append(data.goodSupplier);
    			
    			
    		}
    	});
    }
    
    $('#modify').bind('click',function(){
    	var goodCatalogInfo = {};
    	var goodName=$.trim($("#out_name").val()); 
    	var goodCode=$.trim($("#out_code").val());
    	var goodSpeci = $.trim($("#out_speci").val());
    	var goodSupplier = $.trim($('#out_supplier').val());
    	var id = $('#id_good').val();
    	
    	if(goodName == ""){
    		alert("商品名称不能为空");
    		return;
    	}
    	if(goodCode == ""){
    		alert("商品编码不能为空");
    		return;
    	}
    	if(goodSpeci == ""){
    		alert("规格不能为空");
    		return;
    	}
    	if(goodSupplier == ""){
    		alert("供应商不能为空");
    		return;
    	}
    	
    	goodCatalogInfo["goodName"] = goodName;
    	goodCatalogInfo["goodCode"] = goodCode;
    	goodCatalogInfo["goodSpeci"] = goodSpeci;
    	goodCatalogInfo["goodSupplierId"] = goodSupplier;
    	goodCatalogInfo["id"] = id;
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/modifyGoodCatalogInfo",
    		type:"POST",
    		dataType:"text",
    		data:goodCatalogInfo,
    		success:function(data){
    			if(data == "error"){
    				alert("出错了！");
    			}else if(data == "success") {
    				alert("修改成功");
    				window.location.reload();
    			}
    		}
    	});
    	
    });
/*
    function removeGood(id){
    	var truthBeTold = confirm("是否确认删除？");
    	if (truthBeTold) { 
    		deleteGood(id);
		} ;
    }
    function deleteGood(id){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/ajax/delGood",
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
    */
    $("#submit_button").click(
    		function(){
		    	var goodCatalogInfo = {};
		    	var goodName=$.trim($("#goodName").val()); 
		    	var goodCode=$.trim($("#goodCode").val());
		    	var goodSpeci = $.trim($("#goodSpeci").val());
		    	var goodSupplier = $.trim($('#goodSupplier').val());
		    	
		    	if(goodName == ""){
		    		alert("商品名称不能为空");
		    		return;
		    	}
		    	if(goodCode == ""){
		    		alert("商品编码不能为空");
		    		return;
		    	}
		    	if(goodSpeci == ""){
		    		alert("规格不能为空");
		    		return;
		    	}
		    	if(goodSupplier == ""){
		    		alert("供应商不能为空");
		    		return;
		    	}
		    
		    	goodCatalogInfo["goodName"] = goodName;
		    	goodCatalogInfo["goodCode"] = goodCode;
		    	goodCatalogInfo["goodSpeci"] = goodSpeci;
		    	goodCatalogInfo["goodSupplierId"] = goodSupplier;
		    	
		    	$.ajax({
		    		url:"${pageContext.request.contextPath}/ajax/sendGoodCatalogInfo",
		    		type:"POST",
		    		dataType:"text",
		    		data:goodCatalogInfo,
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