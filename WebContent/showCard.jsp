<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link rel="stylesheet" href="./css/styles.css" type="text/css" />
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
<link rel='stylesheet' id='theme-styles-css'
	href='http://www.tinkeringmonkey.com/wp-content/themes/ken/stylesheet/css/styles.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='theme-options-css'
	href='http://www.tinkeringmonkey.com/wp-content/uploads/mk_assets/theme-options-production.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='mk-style-css'
	href='http://www.tinkeringmonkey.com/wp-content/themes/ken-child-3.0/style.css'
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

#mk-header


 


.transparent-header-sticky
,
#mk-header




.sticky-header




:not


 


(
.transparent-header



	


){
border-bottom




:


 


1
px




;
solid




:


 


#e6e6e6




;
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
</head>


<body
	class="home page page-id-2 page-template-default wpb-js-composer js-comp-ver-5.4.5 vc_responsive"
	itemscope="itemscope" itemtype="https://schema.org/WebPage">
	<div class="theme-main-wrapper ">
		<div id="mk-boxed-layout" class="mk-full-enabled ">
			<header id="mk-header"
				class="sticky-header  boxed-header header-align-left header-structure-standard put-header-top theme-main-header mk-header-module"
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
							alt="Tinkering Monkey" class="mk-dark-logo"
							src="images/xiao.png"
									data-retina-src="images/da.png"></a></li>
					<li id="menu-item-19446"
						class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children has-mega-menu"><a
						class="menu-item-link" href="show.jsp?pageNO=1&totalpages=${sessionScope.pageModel.totalPages}">首页</a></li>
					<li id="menu-item-21509"
						class="menu-item menu-item-type-post_type menu-item-object-page no-mega-menu"><a
						class="menu-item-link" href="viewCard?actiontype=default">购物车</a></li>
					<li id="menu-item-20493"
						class="menu-item menu-item-type-post_type menu-item-object-page no-mega-menu"><a
						class="menu-item-link" href="#">我的订单</a></li>
					<li id="menu-item-24402"
						class="menu-item menu-item-type-post_type menu-item-object-page no-mega-menu"><a
						class="menu-item-link" title="get-started" href="#">修改信息</a></li>
					<li class="mk-header-social inside-grid"></li>
				</ul>
				</nav>
			</div>
			</header>
			<div class="responsive-nav-container"></div>
			<div class="sticky-header-padding  sticky-header "></div>
			<div class="clearboth"></div>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				bgcolor="#FFFFFF" height="100%">
				<tr valign="top">
					<td width="15%"></td>
					<td width="70%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							align="left">
							<tr valign="bottom">
								<td height="30"
									style="vertical-align: middle; text-align: left;"><font
									color="#000000" size="3"><strong>购物车:</strong></font></td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							align="center">
							<tr>
								<td>
									<table width="100%" border="0" align="CENTER" cellpadding="2"
										cellspacing="1" bgcolor="#caa76a">
										<tr >
											<td width="50">
												<div align="CENTER">
													<font color="#000000" size="2">编号</font>
												</div>
											</td>
											<td width="100">
												<div align="CENTER">
													<font color="#000000" size="2">图片</font>
												</div>
											</td>
											<td width="510">
												<div align="CENTER">
													<font color="#000000" size="2">商品名称</font>
												</div>
											</td>
											<td width="104">
												<div align="CENTER">
													<font color="#000000" size="2">单价</font>
												</div>
											</td>
											<td width="100">
												<div align="CENTER">
													<font color="#000000" size="2">数量</font>
												</div>
											</td>
											<td width="116">
												<div align="CENTER">
													<font color="#000000" size="2">金额</font>
												</div>
											</td>
										</tr>
										<c:forEach var="carditem" items="${sessionScope.card}">
											<tr bgcolor="#ffffff">
												<td width="50" align="center" height="22"><font
													color="#000000" size="2">${carditem.value.dish.diid}</font></td>
												<td vAlign=top width=90 height=90 align="center"><IMG
													height=80 alt=点击图片查看内容
													src="images/${carditem.value.dish.diimage}" width=80
													border=0></td>
												<td align="center" height="22"><font color="#000000" size="2">${carditem.value.dish.diname}</font>
													<input type="hidden" name="prodid" value="500047">
												</td>
												<td width="104" align="center" height="22"><font
													color="#000000" size="2">${carditem.value.dish.diprice}</font></td>
												<td width="100" class="hh" align="center" height="22"><font
													 size="2">${carditem.value.quantity}</font></td>
												<td width="116" class="bb" align="center" height="22">
													<font color="#000000" size="2">${carditem.value.dish.diprice*carditem.value.quantity}</font>
												</td>
											</tr>
										</c:forEach>
										<tr bgcolor="#ffffff">
											<td width="50" height="22" align="center"><font
												color="#000000" size="2"><strong>合计</strong></font></td>
											<td height="22" align="center"><font color="#000000"><strong>-</strong></font></font>
											</td>
											<td width="104" height="22" align="center"><font
												color="#000000" size="2"><strong>-</strong></font></font></td>
											<td width="100" class="hh" height="22" align="center"><font
												color="#000000" size="2"><strong>-</strong></font></font></td>
											<td width="100" class="hh" height="22" align="center"><font
												color="#000000" size="2"><strong>-</strong></font></td>
											<td width="116" class="bb" align="center" height="22"><font
												color="#000000" size="2"><strong>${sessionScope.sum }</strong></font></td>
										</tr>
									</table> 
									<table width="300" border="0" cellspacing="1" cellpadding="4"
										align="CENTER" >
										<tr >
											<td height="10" align="center"><a
												href="viewCard?actiontype=clearCard"><font
													color="#000000" size="2">清空购物车</font> </a></td>
											<td height="10" align="center"><a
												href="show.jsp?pageNO=1&totalpages=${sessionScope.pageModel.totalPages}">
													<font color="#000000" size="2">继续购物</font>
											</a></td>
											<td height="10" align="center"><a href="payAction">
													<font color="#000000" size="2">生成订单</font>
											</a></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td><td width="15%"></td>
				</tr>
			</table>
			<br>

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
							<td rowspan="5">11111</td>
							<td>陈佳</td>
							<td>常见问题</td>
							<td rowspan="5"></td>
						</tr>
						<tr>
							<td>陈佳</td>
							<td>在线客服</td>
						</tr>
						<tr>
							<td>陈佳</td>
							<td>我要加盟</td>
						</tr>
						<tr>
							<td>陈佳</td>
							<td>市场合作</td>
						</tr>
						<tr>
							<td>陈佳</td>
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

