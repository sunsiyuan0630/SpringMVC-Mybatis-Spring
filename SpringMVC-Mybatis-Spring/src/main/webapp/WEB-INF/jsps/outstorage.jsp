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
<link href="/SpringMVC/Resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link href="/SpringMVC/Resources/css/dashboard.css" rel="stylesheet">
<link href="/SpringMVC/Resources/css/outstorage.css" rel="stylesheet">
<script src="/SpringMVC/Resources/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<div class="container-fluid">    
        <div class="table-responsive">
          <h1 class="page-header" style="top: 0px; margin-top: 20px;font-weight:bold;">出库/销售</h1>
	         <form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">出库商品</label>
				    <div class="col-sm-10">
				      <input name="goodName" type="text" class="form-control" placeholder="输入商品名称">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="text" class="col-sm-2 control-label">出库编号</label>
				    <div class="col-sm-10">
				      <input name="goodId" type="text" class="form-control" placeholder="输入商品编号">
				    </div>
				  </div>
				 
				  <!-- <div id="submit">
				  	<button type="button" class="btn btn-info">查询</button>
				  </div> -->
				  <div class="form-group">
      				<div class="col-sm-offset-2 col-sm-10">
        				 <button type="submit" class="btn btn-info">查询</button>
      				</div>
   				  </div>
				</form>
		  

          <h2 class="sub-header">库存信息</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                 
                  <th>商品编号</th>
                  <th>商品名称</th>
                  <th>描述</th>
                  <th>数量</th>
                  <th>最后操作时间</th>
                  <th>操作</th>
                  
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${page.list}" var="outStorageResultMap">
                    <tr>
                      
                        <td>${outStorageResultMap.goodId}</td>
                        <td>${outStorageResultMap.goodName}</td>
                        <td>${outStorageResultMap.goodSupplier}</td>
                        <td>${outStorageResultMap.goodNumber}</td>
                        <td>${outStorageResultMap.lastUpdateTime}</td>
                        <td><a onclick="getDetailGoodRestInfo(${outStorageResultMap.id})" href="#" class="btn btn-primary btn-xs" role="button" data-toggle="modal" data-target="#Modal">出货</a>
                        </td>
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
				      <a href="${pageContext.request.contextPath}/struts/outstorage?pageNum=${page.prePage}&pageSize=${page.pageSize}&goodName=${goodName}&goodId=${goodId}" aria-label="Previous">
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
                            <a href="${pageContext.request.contextPath}/struts/outstorage?pageNum=${nav}&pageSize=${page.pageSize}&goodName=${goodName}&goodId=${goodId}">${nav}</a>
                        </li>
                        </c:if>
                    </c:forEach>
				     <c:if test="${page.hasNextPage}">
				     <li class="next">
				      <a href="${pageContext.request.contextPath}/struts/outstorage?pageNum=${page.nextPage}&pageSize=${page.pageSize}&goodName=${goodName}&goodId=${goodId}" aria-label="Next">
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
             <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  
            
          </div>
      </div>
    </div>
</div>

<!-- 模态框 -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">商品当前库存情况</h4>
        <div class="container-fluid">
        <input type="hidden" id="id_goodrest" value=""/>
        <input type="hidden" id="id_good" value="">
        	<table class="table">
        		<thead>
        		<tr>
        			<th>商品编号</th>
        			<th>商品名称</th>
        			<th>商品说明</th>
        			<th>商品数量</th>
        		</tr>
        		</thead>
        		<tbody>
        		<tr>
        			<td id="goodId"></td>
        			<td id="goodName"></td>
        			<td id="goodSpeci"></td>
        			<td id="goodNumber"></td>
        		</tr>
        		</tbody>
        	</table>
        </div>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="out-number" class="col-sm-2 control-label">出库数量</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="out_number">
            </div>
          </div>
          <div class="form-group">
            <label for="out-time" class="col-sm-2 control-label">出库时间（可选）</label>
            <div class="input-group date form_datetime col-md-5"   data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="out_time">
                    <input id="initDate" class="form-control"  size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
            </div>
				<input type="hidden"  value="" id="out_time"/><br/>
          </div>
          <div class="form-group">
            <label for="out-number" class="col-sm-2 control-label">卖出单价</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="out_price">
            </div>
          </div>
          <div class="form-group" style="width: 100%">
          <label for="out_text" class="col-sm-2 control-label">出库详情</label>
          	<div class="col-sm-10">
          		<textarea class="form-control" id="out_text"  rows="4"></textarea>
          	</div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="out_storage" type="button" class="btn btn-warning">出库</button>
      </div>
    </div>
  </div>
</div>

<!-- 模态框 -->


    
    <script src="/SpringMVC/Resources/js/jquery-1.11.0.min.js"></script>
    <script src="/SpringMVC/Resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="/SpringMVC/Resources/js/holder.min.js"></script>
    <script src="/SpringMVC/Resources/js/outstorage.js"></script>
    <script src="/SpringMVC/Resources/js/ie10-viewport-bug-workaround.js"></script>
    
    
    <script type="text/javascript">
    $('.form_datetime').datetimepicker({
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
function getDetailGoodRestInfo(id){
	$.ajax({
		url:"${pageContext.request.contextPath}/ajax/getDetailGoodRestInfo",
		type:"POST",
		dataType:"json",
		data:{
			id:id
		},
		success:function(data){
			$('#goodId').text(data.goodCode);
			$('#goodName').text(data.name);
			$('#goodSpeci').text(data.goodSpeci);
			$('#goodNumber').text(data.goodNumber);
			$('#id_goodrest').val(data.id);
			$('#id_good').val(data.goodId);
			/*var date = new Date();
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
			*/
			var now = getTime();
			$('#initDate').val(now);
			$('#out_time').val(now);
			bindClick()
		}
	});
	
}
function bindClick(){
	$("#out_storage").bind("click",function(id){
		var out_number = $('#out_number').val();
		var out_time = $('#out_time').val();
		var text = $('#out_text').val();

		if(out_number=='')
			alert('请输入销售数量');
		else if(out_time==''){
			var truthBeTold = confirm("单击“确定”自动填入当前时间。单击“取消”停止。"); 
			if (truthBeTold) { 
				var now = getTime();
				$('#initDate').val(now);
				$('#out_time').val(now);
			} else $('.form_datetime').datetimepicker('show');
		}
		else submitToServer();
	});
}


function submitToServer(id){
	var outstorage = {};
	
	var id = $('#id_goodrest').val();
	
	var id_good = $('#id_good').val();
	var out_number = $('#out_number').val();
	var out_time = $('#out_time').val();
	var out_price = $('#out_price').val();
	var text = $('#out_text').val();
	
	outstorage["goodrestId"] = id;
	outstorage["goodId"] = id_good;
	outstorage["number"] = out_number;
	outstorage["sellPrice"] = out_price;
	outstorage["date"] = out_time;
	outstorage["desc"] = text;
	$.ajax({
		url:"${pageContext.request.contextPath}/ajax/outputGoods",
		type:"POST",
		dataType:"text",
		data:outstorage,
		success:function(data){
			if(data=='success')
				alert('出库成功');
			else if(data=='tooMany')
				alert('库存量不足，出库失败');
			else 
				alert('异常，出库失败');
		}
	});
}
</script>
</body>
</html>