<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������վ֧��return_url</title>
<style>
* {
	margin: 0;
	padding: 0;
}

ul, ol {
	list-style: none;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, "Lucida Grande",
		sans-serif;
}

.tab-head {
	margin-left: 120px;
	margin-bottom: 10px;
}

.tab-content {
	clear: left;
	display: none;
}

h2 {
	border-bottom: solid #02aaf1 2px;
	width: 200px;
	height: 25px;
	margin: 0;
	float: left;
	text-align: center;
	font-size: 16px;
}

.selected {
	color: #FFFFFF;
	background-color: #02aaf1;
}

.show {
	clear: left;
	display: block;
}

.hidden {
	display: none;
}

.new-btn-login-sp {
	padding: 1px;
	display: inline-block;
	width: 75%;
}

.new-btn-login {
	background-color: #caa76a;
	color: #FFFFFF;
	font-weight: bold;
	border: none;
	width: 100%;
	height: 30px;
	border-radius: 5px;
	font-size: 16px;
}

#main {
	width: 100%;
	margin: 0 auto;
	font-size: 14px;
}

.red-star {
	color: #f00;
	width: 10px;
	display: inline-block;
}

.null-star {
	color: #fff;
}

.content {
	margin-top: 5px;
}

.content dt {
	width: 100px;
	display: inline-block;
	float: left;
	margin-left: 20px;
	color: #666;
	font-size: 13px;
	margin-top: 8px;
}

.content dd {
	margin-left: 120px;
	margin-bottom: 5px;
}

.content dd input {
	width: 85%;
	height: 28px;
	border: 0;
	-webkit-border-radius: 0;
	-webkit-appearance: none;
}

#foot {
	margin-top: 10px;
	position: absolute;
	bottom: 15px;
	width: 100%;
}

.foot-ul {
	width: 100%;
}

.foot-ul li {
	width: 100%;
	text-align: center;
	color: #666;
}

.note-help {
	color: #999999;
	font-size: 12px;
	line-height: 130%;
	margin-top: 5px;
	width: 100%;
	display: block;
}

#btn-dd {
	margin: 20px;
	text-align: center;
}

.foot-ul {
	width: 100%;
}

.one_line {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid #eeeeee;
	width: 100%;
	margin-left: 20px;
}

.am-header {
	display: -webkit-box;
	display: -ms-flexbox;
	display: box;
	width: 100%;
	position: relative;
	padding: 7px 0;
	-webkit-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
	background: #1D222D;
	height: 50px;
	text-align: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	box-pack: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	box-align: center;
}

.am-header h1 {
	-webkit-box-flex: 1;
	-ms-flex: 1;
	box-flex: 1;
	line-height: 18px;
	text-align: center;
	font-size: 18px;
	font-weight: 300;
	color:;
}
</style>
</head>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<BODY text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
	<header align=" center">
	<h1>�ҵĶ���</h1>
	</header>
	<table cellSpacing=2 cellPadding=2 width=100% align=center border=0>
		<tr>
			<td width="100%" height="36" colspan="3"></td>
		</tr>
		<tr>
			<td width="10%"></td>
			<td width="80%">
				<form name=alipayment action=show.jsp method=get target="_blank">
					<div id="body1" class="show" name="divcontent">
						<dl class="content">
							<dt>�̻������� ��</dt>
							<dd>
								<input value="${param.out_trade_no }" readonly="readonly" />
							</dd>
							<hr class="one_line">
							<dt>�������� ��</dt>
							<dd>
								<input value="��ѧ�һ����϶���" readonly="readonly" />
							</dd>
							<hr class="one_line">
							<dt>֧�������׺� ��</dt>
							<dd>
								<input value="${param.trade_no }" readonly="readonly" />
							</dd>
							<hr class="one_line">
							<dt>������ ��</dt>
							<dd>
								<input value="${param.total_amount}" readonly="readonly" />
							</dd>
							<hr class="one_line">
							<dt>�������� ��</dt>
							<dd>
								<input />
								<table width="60%" border="0" align="CENTER" cellpadding="2"
									cellspacing="1" bgcolor="#c0c0c0">
									<c:forEach var="carditems" items="${sessionScope.card}">
										<tr bgcolor="#ffffff">
											<td align="center" width="50%" height="22"><font
												color="#000000">${carditems.value.dish.diname}</font> <input
												type="hidden" name="prodid" value="500047"></td>
											<td width="20%" class="hh" align="center" height="22">
												x${carditems.value.quantity}</td>
											<td width="20%" class="bb" align="center" height="22"><font
												color="#000000">${carditems.value.dish.diprice*carditems.value.quantity}</font>
											</td>
										</tr>
									</c:forEach>
								</table>
							</dd>
							<hr class="one_line">
							<dt></dt>
							<dd id="btn-dd">
								<span class="new-btn-login-sp">
									<button class="new-btn-login" type="submit"
										style="text-align: center;">������ҳ</button>
								</span>
							</dd>
						</dl>
					</div>

				</form>
			</td>
			<td width="10%"></td>
		</tr>
	</table>
</BODY>
</html>