<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册 - 解惑</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/bootstrap.css" media="screen">
<link rel="stylesheet" href="./css/common.css" media="screen">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="./js/html5shiv.js"></script>
      <script src="./js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand">解惑</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#navbar-main"></button>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="login-content">
			<div class="row">
				<div class="col-lg-8 col-md-offset-2">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">注册</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal setting-form">
								<fieldset>
									<div class="form-group">
										<label class="col-lg-2 control-label">用户名:</label>
										<div class="col-lg-4">
											<input type="text" class="form-control" id="inputEmail"
												placeholder="用户名">
										</div>
										<div class="alert alert-dismissable alert-danger col-lg-5">
							                <button type="button" class="close" data-dismiss="alert">&times;</button>
							                                邮箱密码输入错误
							            </div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label">密码:</label>
										<div class="col-lg-4">
											<input type="text" class="form-control" id="inputEmail"
												placeholder="密码">
										</div>
										<div class="alert alert-dismissable alert-info col-lg-5">
							                <button type="button" class="close" data-dismiss="alert">&times;</button>
							                                邮箱密码输入错误
							            </div>
									</div>
									<div class="form-group">
										<label class="col-lg-2 control-label">确认密码:</label>
										<div class="col-lg-4">
											<input type="text" class="form-control" id="inputEmail"
												placeholder="确认密码">
										</div>
										<div class="alert alert-dismissable alert-info col-lg-5">
							                <button type="button" class="close" data-dismiss="alert">&times;</button>
							                                邮箱密码输入错误
							            </div>
									</div>
				                  	<div class="form-group">
				                    	<div class="col-lg-10 col-lg-offset-2">
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

	<script src="./js/jquery-1.11.2.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>