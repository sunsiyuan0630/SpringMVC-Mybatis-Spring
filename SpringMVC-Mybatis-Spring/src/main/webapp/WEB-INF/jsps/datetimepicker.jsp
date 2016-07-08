<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="/SpringMVC/Resources/css/storage.css" rel="stylesheet">
<script src="/SpringMVC/Resources/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<div class="container-fluid">    
        <div class="col-sm-9 col-md-10">
          <h1 class="page-header" style="top: 0px; margin-top: 20px;font-weight:bold;">入库</h1>
	         <form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入商品名称">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="text" class="col-sm-2 control-label">商品编号</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入商品编号">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">供应商</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入供应商名称">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-2 control-label">商品单价</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入商品单价">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品规格</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入商品规格">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">商品数量</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入商品数量">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">入库时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入入库时间">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">经手人</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="请输入经手人">
				    </div>
				  </div>
				  <div id="submit">
				  	<button type="button" class="btn btn-info">提交</button>
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
                
              </tbody>
            </table>
          </div>
      </div>
    </div>
  <div class="container">
    <form action="" class="form-horizontal"  role="form">
        <fieldset>
            <legend>Test</legend>
            <div class="form-group">
                <label for="dtp_input1" class="col-md-2 control-label">DateTime Picking</label>
                <div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
			<div class="form-group">
                <label for="dtp_input2" class="col-md-2 control-label">Date Picking</label>
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>
			<div class="form-group">
                <label for="dtp_input3" class="col-md-2 control-label">Time Picking</label>
                <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                </div>
				<input type="hidden" id="dtp_input3" value="" /><br/>
            </div>
        </fieldset>
    </form>
</div>
    
    <script src="/SpringMVC/Resources/js/jquery-1.11.0.min.js"></script>
    <script src="/SpringMVC/Resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="/SpringMVC/Resources/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
    <script src="/SpringMVC/Resources/js/holder.min.js"></script>
    <script src="/SpringMVC/Resources/js/storage.js"></script>
    <script src="/SpringMVC/Resources/js/ie10-viewport-bug-workaround.js"></script>
    
    <script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
</body>
</html>