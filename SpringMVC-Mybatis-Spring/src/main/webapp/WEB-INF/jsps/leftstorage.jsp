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
<link href="/SpringMVC/Resources/css/outstorage.css" rel="stylesheet">
<script src="/SpringMVC/Resources/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<div class="container-fluid">    
        <div class="col-sm-9 col-md-10">
          <h3 class="page-header" style="top: 0px; margin-top: 20px;font-weight:bold;">查询库存信息</h3>
          <div class="alert alert-info alert-dismissible" role="alert">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  			可以<strong>单独</strong>输入<strong>商品名称</strong>或者<strong>商品编号</strong>查询
		  </div>
	         <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/struts/leftstorage" method="post" accept-charset="UTF-8">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品名称</label>
				    <div class="col-sm-10">
				      <input name="goodName" type="text" class="form-control" placeholder="请输入商品名称" value="${goodName }">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="text" class="col-sm-2 control-label">商品编号</label>
				    <div class="col-sm-10">
				      <input name="goodId" type="text" class="form-control" placeholder="请输入商品编号" value="${goodId }">
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
		  

          <h3 class="sub-header">库存信息</h3>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>商品ID</th>
                  <th>商品编号</th>
                  <th>商品名称</th>
                  <th>描述</th>
                  <th>数量</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${page.list}" var="goodrest">
                    <tr>
                        <td>${goodrest.id}</td>
                        <td>${goodrest.goodId}</td>
                        <td>${goodrest.goodName}</td>
                        <td>${goodrest.goodSpeci}</td>
                        <td>${goodrest.goodNumber}</td>
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
				      <a href="${pageContext.request.contextPath}/struts/leftstorage?pageNum=${page.prePage}&pageSize=${page.pageSize}&goodName=${goodName}&goodId=${goodId}" aria-label="Previous">
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
                            <a href="${pageContext.request.contextPath}/struts/leftstorage?pageNum=${nav}&pageSize=${page.pageSize}&goodName=${goodName}&goodId=${goodId}">${nav}</a>
                        </li>
                        </c:if>
                    </c:forEach>
				     <c:if test="${page.hasNextPage}">
				     <li class="next">
				      <a href="${pageContext.request.contextPath}/struts/leftstorage?pageNum=${page.nextPage}&pageSize=${page.pageSize}&goodName=${goodName}&goodId=${goodId}" aria-label="Next">
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
    <script src="/SpringMVC/Resources/js/outstorage.js"></script>
    <script src="/SpringMVC/Resources/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>