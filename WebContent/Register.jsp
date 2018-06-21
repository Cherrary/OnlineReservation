<%@ page language="java" import="java.util.*,dao.*,bean.*"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <![endif]-->

<title>OnlineReservation</title>

<script type="text/javascript" src="http://www.youtube.com/player_api"></script>
<script type="text/javascript"
	src="http://f.vimeocdn.com/js/froogaloop2.min.js"></script>
<script type="text/javascript">
	// Declare theme scripts namespace
	var ken = {};
	var php = {};
	var mk_theme_dir = "http://www.tinkeringmonkey.com/wp-content/themes/ken", mk_captcha_url = "http://www.tinkeringmonkey.com/wp-content/themes/ken/captcha/captcha.php", mk_captcha_check_url = "http://www.tinkeringmonkey.com/wp-content/themes/ken/captcha/captcha-check.php", mk_theme_js_path = "http://www.tinkeringmonkey.com/wp-content/themes/ken/js", mk_captcha_placeholder = "Enter Captcha", mk_captcha_invalid_txt = "Invalid. Try again.", mk_captcha_correct_txt = "Captcha correct.", mk_nav_res_width = 768, mk_header_sticky = 1, mk_grid_width = 1140, mk_preloader_logo = "", mk_header_padding = 30, mk_accent_color = "#c6a05f", mk_squeeze_header = 1, mk_logo_height = 48, mk_preloader_txt_color = "#444444", mk_preloader_bg_color = "#ffffff";
	mk_preloader_bar_color = "#c6a05f", mk_no_more_posts = "No More Posts";
	mk_header_structure = "standard";
	mk_boxed_header = "1";
	var mk_header_trans_offset = 0;
</script>
<link rel='stylesheet' id='theme-styles-css' href='css/styles.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='theme-options-css'
	href='http://www.tinkeringmonkey.com/wp-content/uploads/mk_assets/theme-options-production.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='mk-style-css' href='css/style3.css'
	type='text/css' media='all' />
<style type='text/css'>
body, .theme-main-wrapper {
	background-color: #ffffff;
	background-repeat: repeat;
	background-position: right bottom;
	background-attachment: scroll;
}

.mk-header-toolbar {
	background-color: #eeeeee;
	background-repeat: repeat;
	background-position: right bottom;
	background-attachment: scroll;
}

#mk-header, .mk-secondary-header {
	background-color: #ffffff;
	background-repeat: no-repeat;
	background-position: center top;
	background-attachment: scroll;
}

.theme-main-wrapper:not (.vertical-header ) #mk-header.transparent-header.light-header-skin,
	.theme-main-wrapper:not (.vertical-header ) #mk-header.transparent-header.dark-header-skin
	{
	border-top: none !important;
	background: transparent !important;
}

.theme-main-wrapper:not (.vertical-header ) .sticky-header.sticky-header-padding
	{
	padding-top: 108px;
}

.sticky-header-padding {
	background-color: #ffffff;
}

#mk-header .transparent-header-sticky, #mk-header.sticky-header:not (.transparent-header
	){
	border-bottom: 1px;
	solid: #e6e6e6;
}

#mk-footer {
	background-color: #191919;
	background-repeat: repeat;
	background-position: right bottom;
	background-attachment: scroll;
}

</style>
<script type='text/javascript'
	src='http://www.tinkeringmonkey.com/wp-includes/js/jquery/jquery.js'></script>
		<script src="System/script/sweetalert2.all.min.js"></script>
<script src="https://unpkg.com/promise-polyfill"></script>
<script src="System/script/sweetalert2.min.js"></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
<script language="javascript">
	function checkUserInfo() {
	 if(document.loginForm.loginName.value==""){
   	  swal({
   		  title: '用户名不能为空！',
   		  width:300,
   		  confirmButtonColor:"#caa76a"
   	  });
	    return false;
	 }
	 if(document.loginForm.loginPass.value==""){
  	  swal({
  		  title: '密码不能为空！',
  		  width:300,
  		  confirmButtonColor:"#caa76a"
  	  });
	    return false;
	 }

	 if(document.loginForm.phone.value==""){
  	  swal({
  		  title: '电话号码不能为空！',
  		  width:300,
  		  confirmButtonColor:"#caa76a"
  	  });
	    return false;
	 }

	 if(document.loginForm.code.value==""){
  	  swal({
  		  title: '验证码不能为空！',
  		  width:300,
  		  confirmButtonColor:"#caa76a"
  	  });
	    return false;
	 }
	}
	
	function sendSMS() {
		var Number = window.document.getElementById("phone").value;
		//window.open("sendSMS?phone="+Number);
		var ajaxO = new XMLHttpRequest();
		ajaxO.open('get', "sendSMS?phone=" + Number);
		ajaxO.send();
		var buttonId = document.getElementById('getyanzheng');
		buttonId.disabled = true;
		buttonId.style.color = "#606060";
		buttonId.style.borderColor = "#606060";
		var i = 120;
		var myVar = setInterval(function() {
			myTimer()
		}, 1000);
		function myTimer() {
			if (i >= 0)
				buttonId.value = "重新发送：" + i--;
			else
				myStopFunction();
		}
		function myStopFunction() {
			clearInterval(myVar);
			buttonId.disabled = false;
			buttonId.style.color = "#C7AC7F";
			buttonId.style.borderColor = "#C7AC7F";
			buttonId.value = "获取验证码";
		}
	}
</script>
</head>


<body
	class="home page page-id-2 page-template-default wpb-js-composer js-comp-ver-5.4.5 vc_responsive"
	itemscope="itemscope" itemtype="https://schema.org/WebPage">
	<div class="theme-main-wrapper ">
		<div id="mk-boxed-layout" class="mk-full-enabled ">
			<header id="mk-header"
				class=" sticky-header  boxed-header header-align-left header-structure-standard put-header-top theme-main-header mk-header-module"
				data-header-style="block" data-header-structure="standard"
				data-transparent-skin="dark" data-height="108"
				data-sticky-height="57" role="banner" itemscope="itemscope"
				itemtype="https://schema.org/WPHeader">

			<div class="mk-grid">
				<nav id="mk-main-navigation" role="navigation" itemscope="itemscope"
					itemtype="https://schema.org/SiteNavigationElement">
				<ul id="menu-main-menu" class="main-navigation-ul">
					<li class="responsive-nav-link">
						<div class="mk-burger-icon">
							<div class="burger-icon-1"></div>
							<div class="burger-icon-2"></div>
							<div class="burger-icon-3"></div>
						</div>
					</li>
					<li class="mk-header-logo  "><a
						href="http://www.tinkeringmonkey.com/" title="Tinkering Monkey"><img
							alt="Tinkering Monkey" class="mk-dark-logo" src="images/xiao.png"
							data-retina-src="images/da.png" /></a></li>
					<li id="menu-item-21509"
						class="menu-item menu-item-type-post_type menu-item-object-page no-mega-menu"><a
						class="menu-item-link" href="NewFile.html">登录</a></li>
					<li id="menu-item-20493"
						class="menu-item menu-item-type-post_type menu-item-object-page no-mega-menu"><a
						class="menu-item-link" href="#">注册</a></li>
					<li class="mk-header-social inside-grid"></li>
				</ul>
				</nav>
			</div>
			</header>

			<div class="responsive-nav-container"></div>
			<div class="sticky-header-padding  sticky-header "></div>



			<form method="GET" name="loginForm" onSubmit="return checkUserInfo()"
				action="register">
				<table width="100%" border="0">
					<tr>
						<td width="35%"></td>
						<td width="10%"></td>
						<td width="10%"></td>
						<td width="10%"></td>
						<td width="35%"></td>
					</tr>
					<tr>
						<td></td>
						<td valign="middle" align="right">用户名&nbsp;&nbsp;：</td>
						<td valign="top"><input type="text" name="loginName"
							size="19" class="input"></td>

					</tr>
					<tr>
						<td></td>
						<td valign="middle" align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
						<td valign="top"><input type="password" name="loginPass"
							size="20" class="input"></td>

					</tr>
					<tr>
						<td></td>
						<td valign="middle" align="right">电话号码：</td>
						<td valign="top"><input type="tel" name="phone" size="20"
							id="phone" class="input"></td>
					</tr>
					<tr>
						<td></td>
						<td valign="middle" align="right">验证&nbsp;&nbsp;码：</td>
						<td valign="top"><input type="text" name="code" size="20"
							class="input"></td>
						<td align="left"><input type="button" id="getyanzheng"
							onclick="sendSMS()" value="获取验证码"></td>

					</tr>
					<tr>
						<td><input type="hidden" name="actiontype" value="login"></td>
						<td align="center" colspan="3"><input type="submit"
							name="Submit" value="注册"></td>
						<td></td>
					</tr>
					
				</table>
			</form>

			<div id="mk-footer-fixed-spacer"></div>
			<section id="mk-footer" class=" fullwidth-footer " role="contentinfo"
				itemscope="itemscope" itemtype="https://schema.org/WPFooter">
			<div class="footer-wrapper  ">
				<div class="mk-padding-wrapper">
					<h1></h1>
				<table width="100%" cellSpacing=0 cellPadding=0 align=center
							border=0>
							<tr>
								<th width="15%"></th>
								<th width="30%"><div class="widgettitle" align="center">关于我们</div></th>
								<th width="20%"><div class="widgettitle" align="center">我们的团队</div></th>
								<th width="20%"><div class="widgettitle" align="center">帮助与其他</div></th>
								<th width="15%"></th>
							</tr>
							<tr>
								<td rowspan="5"></td>
								<td rowspan="5">本系统为广大用户提供网上订餐的功能，使得广大用户可以足不出户就能快速便捷的了解到菜品详情，并且能够在网上下单点菜！</td>
								<td>陈佳</td>
								<td>常见问题</td>
								<td rowspan="5"></td>
							</tr>
							<tr>
								<td>田媛</td>
								<td>在线客服</td>
							</tr>
							<tr>
								<td>吕文娇</td>
								<td>我要加盟</td>
							</tr>
							<tr>
								<td>刘晓宇</td>
								<td>市场合作</td>
							</tr>
							<tr>
								<td></td>
								<td>捐赠</td>
							</tr>
						</table>
					</div>
				</div>
			<div class="clearboth"></div>
			<div id="sub-footer" align="center">
				<div class="item-holder">
					<span class="mk-footer-copyright">Copyright @
						OnlineReservation Website designed and built by Jia Chen</span>
					<ul class="mk-footer-social"></ul>
				</div>
				<div class="clearboth"></div>
			</div>
			</section>
		</div>
	</div>




	<script type="text/javascript">
		php = {
			hasAdminbar : false,
			json : ([ {
				"name" : "theme_header",
				"params" : {
					"stickyHeight" : 57
				}
			} ] != null) ? [ {
				"name" : "theme_header",
				"params" : {
					"stickyHeight" : 57
				}
			} ] : "",
			styles : '#fancy-title-3 {font-family: "Lato"}#fancy-title-6 {font-family: "Lato"}#fancy-title-7 {font-family: "Lato"}#fancy-title-10 {font-family: "Lato"}#fancy-title-16 {font-family: "Lato"}#fancy-title-18 {font-family: "Lato"}#fancy-title-20 {font-family: "Lato"}#fancy-title-29 {font-family: "Lato"}#fancy-title-35 {font-family: "Lato"}'
		};
		var styleTag = document.createElement("style"), head = document
				.getElementsByTagName("head")[0];
		styleTag.type = "text/css";
		styleTag.innerHTML = php.styles;
		head.appendChild(styleTag);
	</script>
	<script type='text/javascript'
		src='http://www.tinkeringmonkey.com/wp-content/themes/ken/js/min/theme-scripts-ck.js'></script>

</body>
</html>
