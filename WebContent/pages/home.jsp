<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mellisuga.bean.*" %>
<%@include file="sitename.jsp"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme() + "://" + request.getServerName() + ":" 
	+ request.getServerPort() + path + "/" ;   
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
	<title>Ellery - <%=sitename %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<!-- js css plugin include -->
	<%@include file="include.jsp"%>
	
	<% 
		Member m = (Member) request.getSession().getAttribute("member"); 
		HomeBean homeBean = (HomeBean) request.getAttribute("homeBean");
	%>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="../" class="navbar-brand"><%=sitename %></a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">

				<!-- search -->
				<form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button" data-toggle="modal"
								data-target="#searchModal" data-backdrop="false">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				
				<!-- search modal -->
				<%@include file="modal.jsp"%>

				<!-- navbar -->
				<%@include file="navbar.jsp" %>
			</div>
		</div>
	</div>

    <div class="container">

      	<!-- main content -->
		<div class="question-main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="row">
				<div class="left-main col-lg-7 col-md-7 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

					<!--left main title row-->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="profile-header">
									<strong><%=m.getFullname() %></strong>
								</div>
								<div class="row user-infos">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<img src="<%=m.getAvatar_path() %>" class="img-responsive img-rounded">
									</div>
									<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
										
										<div class="user-info">
											<i class="fa fa-map-marker"></i> 
											<span class="location"><%=m.getLocation() %></span>
											<span class="business"><%=m.getBusiness() %></span>
											<span class="gender"><%=m.getGender() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info">
											<i class="fa fa-suitcase"></i> 
											<span class="company"><%=m.getEmployment() %></span>
											<span class="work"><%=m.getPosition() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
										</div>

										<div class="user-info-end">
											<i class="fa fa-graduation-cap"></i> 
											<span class="education"><%=m.getEducation() %></span>
											<span class="specialty"><%=m.getMajor() %></span>
											<a href="#" class="item-edit">
												<i class="fa fa-edit"></i> 
												修改
											</a>
											<span class="user-info-detail">
												<i class="fa fa-arrow-right"></i> 查看详细资料
											</span>
										</div>
										<hr style="margin-top:12px;margin-bottom:12px;"/>
										
										<p><%=m.getDescription() %></p>
									</div>
								</div>


								<div class="achievement">
									<span class="achieve">获得</span>
									<span class="achieve">
										<i class="fa fa-thumbs-o-up"></i> 
										<strong><%=m.getApprove_num() %></strong>赞同
									</span>
									<span class="achieve">
										<i class="fa fa-heart-o"></i> 
										<strong><%=m.getThank_num() %></strong>感谢
									</span>
									<a href="#" class="achieve-right info-edit"><i class="fa fa-edit"></i> 编辑我的资料</a>
								</div>

							</div>
							<div class="panel-footer user-info-foot">
								<a href="" class="info-item"><i class="fa fa-home"></i> </a>
								<a href="" class="info-item"><strong>提问</strong><span> <%=m.getQuestion_num() %></span></a>
								<a href="" class="info-item"><strong>回答</strong><span> <%=m.getAnswer_num() %></span></a>
								<a href="" class="info-item"><strong>专栏文章</strong><span> 0</span></a>
								<a href="" class="info-item"><strong>收藏</strong><span> <%=m.getCollect_num() %></span></a>
								<a href="" class="info-item"><strong>公共编辑</strong><span> 0</span></a>
							</div>
						</div>
					</div><!-- end left main title row -->

					<!-- ask list -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>提问</strong>
								<a href="#" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								<%
									// 所提问题列表
									String split = "";
									for(Question q : homeBean.getQuestionList()) {
								%>
								<%=split %>
								<div class="ask-list">
									<div class="ask-list-content">
										<a href="" class="question-list"><%=q.getQuestion_title() %></a>
										<div class="feed-meta">
											<a href="#" class="answer-date">发布于 <%=q.getLast_updated() %> </a> 
											<span class="bull">•</span> <a href="#" class="meta-item">4847赞</a>
											<span class="bull">•</span> <a href="#" class="meta-item"><%=q.getScan_num() %>浏览</a>
											<span class="bull">•</span> <a href="#" class="meta-item"><%=q.getAnswers_num() %>回答</a>
											<span class="bull">•</span> <a href="#" class="meta-item"><%=q.getFollowers_num() %>关注</a>
										</div>
									</div>
								</div>
								<%
										split = "<hr style='margin-top:12px;margin-bottom:12px;'/>";
									}
								%>
							</div>
						</div>
					</div><!-- end ask list -->

					<!-- answer list -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>回答</strong>
								<a href="#" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								<%
									// 答案列表
									String split2 = "";
									for(AnswerBean answerBean : homeBean.getAnswerBeanList()) {								
								%>
								<div class="row" style="border-bottom: 1px solid #eee;">
								<!-- avatar and upvote col -->
								<div class="avatar-vote col-lg-1 col-md-1 col-sm-1 col-xs-1" style="border-bottom: 1px solid #eee;">
									<div class="row">
										<div class="vote-text-center vote-number">
											<a href="#">
												<span id="voteupnum" style="display:block;">325</span>
												<span class="" style="display:block;">浏览</span>
											</a>
										</div>
									</div>
								</div><!-- end avatar and upvote col -->
								
								<div class="answer-list col-lg-11 col-md-11 col-sm-11 col-xs-11" style="border-bottom: 1px solid #eee;">
									<div class="answer-list-content">
										<a href="" class="answer-question"><%=answerBean.getQuestion().getQuestion_title() %></a>
										<p class="user-answer"><%=answerBean.getAnswer().getAnswers() %></p>
									</div>
								</div>
								</div>
								<%
										split2 = "<hr style='margin-top:12px;margin-bottom:12px;'/>";
									}
								%>
							</div>
						</div>
					</div><!-- end answer list -->

					<!-- recent news -->
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>最新动态</strong>
								<a href="#" class="more"><i class="fa fa-chevron-right"></i> </a>
							</div>
							<div class="panel-body">
								
								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">赞同该回答</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 14:36</a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
										</div>
									</div>
								
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<i class="fa fa-heart-o"></i> 感谢
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-share"></i> 分享
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-bookmark-o"></i> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block">
											举报
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">作者保留权利</a>
										<a href="#" class="answer-collapse meta-item">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
									
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">关注了问题</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
								</div><!-- end content-details -->
									
								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">赞同该回答</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
									<div class="author-info">
										<a href="#"><strong>空明</strong></a>,
										<span>RednaxelaFX</span>
									</div>
								
									<div class="question-content">
										<div class="editable-content" style="display: block;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
											<span class="answer-date" style="display: block;">
												<a target="_blank" href="#">发布于 14:36</a>
											</span>
										</div>
										<div class="summary-content clearfix" style="display: none;">
											这个廉价的东西不能退、不能改签应该是常识啊
											这个廉价的东西不能退、不能改签应该是常识啊
										</div>
									</div>
									
									<div class="meta-panel">
										<a class="meta-item" href="javascript:;">
											<i class="fa fa-plus"></i> 关注问题
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-comment-o"></i> 添加评论
										</a>
										<a href="#" class="meta-item" data-thanked="false">
											<i class="fa fa-heart-o"></i> 感谢
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-share"></i> 分享
										</a>
										<a href="#" class="meta-item">
											<i class="fa fa-bookmark-o"></i> 收藏
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">没有帮助</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item goog-inline-block">
											举报
										</a>
										<span class="bull">•</span>
										<a href="#" class="meta-item">作者保留权利</a>
										<a href="#" class="answer-collapse meta-item">
											<i class="fa fa-angle-double-up"></i> 收起
										</a>
									</div>
									
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">关注了话题</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">BAT</a></h5>
									</div>
								
								</div><!-- end content-details -->

								<hr style="margin-top:12px;margin-bottom:12px;"/>

								<!-- content-details -->
								<div class="content-details">

									<div class="content-source">
										<span class="user-agree">提出了问题</span>
										<span class="source-time">3小时前</span>
									</div>
								
									<div class="question-link">
										<h5><a href="#">除去计算机软件领域，哪些行业软件离不开Windows?</a></h5>
									</div>
								
								</div><!-- end content-details -->

								<div class="loding-btn">
									<a href="#" class="btn btn-default btn-block">加载更多</a>
								</div>
								
							</div><!-- end panel body-->
						</div><!-- end panel -->
					</div><!-- end recent news -->


				</div><!-- end left main-->

				<div class="right-sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12 col-md-offset-1">
					
					<div class="home-sidebar">
						<strong>
							<span>关注了<a href="#">155</a> 人</span> ,
							<span>关注者<a href="#">13</a> 人</span>
						</strong>
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个话题</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title">
							<strong>关注了<a href="#">36</a> 个专栏</strong>
						</span><br>

						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
						<img src="./images/topic/zh.jpg" class="topic-img">
					</div>
					<hr style="margin-top:12px;margin-bottom:12px;"/>
					<div class="sidebar-group">
						<span class="sidebar-group-title"><strong>主页状态</strong></span>
						<div class="similar-question">
							个人主页被333人浏览
						</div>
					</div>

	
				</div><!-- end right sidebar -->

			</div><!-- end main content row -->
		</div><!-- main content -->

	</div><!-- end container -->
	</body>
</html>