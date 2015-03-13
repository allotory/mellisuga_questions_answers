<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>提问 - 解惑</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/bootstrap.css" media="screen">
<link rel="stylesheet" href="../../css/common.css" media="screen">

<script src="../../js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="../../js/bootstrap.min.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="./js/html5shiv.js"></script>
      <script src="./js/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet" type="text/css" href="../../plugin/simditor/styles/font-awesome.css" /> 
<link rel="stylesheet" type="text/css" href="../../plugin/simditor/styles/simditor.css" /> 

<script type="text/javascript" src="../../plugin/simditor/scripts/jquery.min.js"></script> 
<script type="text/javascript" src="../../plugin/simditor/scripts/module.js"></script> 
<script type="text/javascript" src="../../plugin/simditor/scripts/hotkeys.js"></script> 
<script type="text/javascript" src="../../plugin/simditor/scripts/uploader.js"></script> 
<script type="text/javascript" src="../../plugin/simditor/scripts/simditor.js"></script>
<script type="text/javascript">
$(function(){ 
	 toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough', 'color', 
	             '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 
	             'hr', '|', 'indent', 'outdent' ]; 
	 var editor = new Simditor( { textarea : $('#editor'), placeholder : '这里输入内容...', 
		 	toolbar : toolbar //工具栏 
		 	});
})
</script>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand">解惑</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#navbar-main">
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<form class="navbar-form navbar-left">
					<input type="text" size="50" class="form-control col-lg-8" placeholder="Search">
				</form>

				<ul class="nav navbar-nav">
					<li><a href="#">首页</a></li>
					<li><a href="#">话题</a></li>
					<li><a href="#">发现</a></li>
					<li><a href="#">提问</a></li>
					<li><a href="#">消息</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Ellery<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#" class="glyphicon glyphicon-user"> 我的主页</a></li>
							<li><a href="#" class="glyphicon glyphicon-envelope"> 私信</a></li>
							<li><a href="#" class="glyphicon glyphicon-cog"> 设置</a></li>
							<li class="divider"></li>
							<li><a href="#" class="glyphicon glyphicon-off"> 退出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="login-content">
			<div class="row">
				<div class="col-lg-8 col-md-offset-2">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">提问</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal setting-form">
								<fieldset>
									<div class="form-group">
										<div class="col-lg-10 col-md-offset-1">
											<input type="text" class="form-control" id="inputEmail"
												placeholder="写下你的问题" autofocus>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-11 col-md-offset-1">问题说明（可选）</label>
									</div>
									<div class="form-group">
					                    <div class="col-lg-10 col-md-offset-1">
					                    	<textarea id="editor" placeholder="这里输入内容"></textarea>
					                      	<span class="help-block">认真填写补充说明, 可以得到更精准回答. </span>
					                    </div>
					                </div>
									<div class="form-group">
										<label class="col-lg-11 col-md-offset-1">选择话题</label>
									</div>
									<div class="form-group">
										<div class="col-lg-10 col-md-offset-1">
											<input type="text" class="form-control" id="inputEmail"
												placeholder="搜索话题">
										</div>
									</div>
				                  	<div class="form-group">
				                    	<div class="col-lg-2 col-md-offset-1">
				                    		<input type="checkbox"> 匿名
				                    	</div>
				                    	<div class="col-lg-4 col-lg-offset-5">
				                      		<button class="btn btn-default">重置</button>
				                      		<button type="submit" class="btn btn-primary">保存</button>
				                    	</div>
				                  	</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>