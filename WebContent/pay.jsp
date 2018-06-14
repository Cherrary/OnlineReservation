<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="./css/styles.css" type="text/css" />
<title>我学我会网上订餐系统支付页面</title>
<script src="System/script/sweetalert2.all.min.js"></script>
<script src="https://unpkg.com/promise-polyfill"></script>
<script src="System/script/sweetalert2.min.js"></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
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
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
	<header 	align=" center">
	<h1>我学我会网上订餐系统订单支付</h1>
	</header>
		<form name=alipayment action=alipay.trade.page.pay.jsp method=post
			target="_blank">
			<div id="body1" class="show" name="divcontent">
				<dl class="content">
					<dt>商户订单号 ：</dt>
					<dd>
						<input id="WIDout_trade_no" name="WIDout_trade_no" value="${requestScope.WIDout_trade_no }" readonly="readonly" />
					</dd>
					<hr class="one_line">
					<dt>订单名称 ：</dt>
					<dd>
						<input id="WIDsubject" name="WIDsubject" value="我学我会网上订餐"
							readonly="readonly" />
					</dd>
					<hr class="one_line">
					<dt>订单详情 ：</dt>
					<dd>
					<input  />
						<table width="60%" border="0" align="CENTER" cellpadding="2"
							cellspacing="1" bgcolor="#c0c0c0">
							<c:forEach var="carditems" items="${sessionScope.card}">
								<tr bgcolor="#ffffff">
									<td align="center" width="50%" height="22"><font color="#000000">${carditems.value.dish.diname}</font>
										<input type="hidden" name="prodid" value="500047"></td>
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
					<dt>付款金额 ：</dt>
					<dd>
						<input id="WIDtotal_amount" name="WIDtotal_amount"
							value="${sessionScope.sum }" readonly="readonly" />
					</dd>
					<hr class="one_line">
					<dt>用户备注：</dt>
					<dd>
						<input id="WIDbody" name="WIDbody" />
					</dd>
					<hr class="one_line">
					<dt>地址选择 ：</dt>
					<Br>
					<form action="radio_submit" method="get" >
						<table width="60%" border="0" align="CENTER" cellpadding="2"
							cellspacing="1" >
							<tr><td colspan="2" align="left" ><strong>地址选择</strong></td>
							<td colspan="2" align="right"><button id="input-type-multiple" type="button" style="background-color:#ffffff;border:0"><img src="images/plus.png"  ></button> </td></tr>
							<c:forEach var="addressitems" items="${sessionScope.addresslist}">
								<tr bgcolor="#ffffff">
									<td  width="5%" align="center"><input type="radio" name="address" value="${addressitems.adid }" checked />${addressitems.adid }</td>
									<td align="center" width="50%" height="22"><font color="#000000">${addressitems.adaddress}</font>
										<input type="hidden" name="prodid" value="500047"></td>
									<td width="25%" class="hh" align="center" height="22">
										${addressitems.adlinkman}</td>
									<td width="20%" class="bb" align="center" height="22"><font
										color="#000000">${addressitems.adphone}</font>
									</td>
								</tr>
							</c:forEach>
						</table>
						</form>
					<hr class="one_line">
					<dt></dt>
					<dd id="btn-dd">
						<span class="new-btn-login-sp">
							<button class="new-btn-login" type="submit"
								style="text-align: center;">付 款</button>
						</span> <span class="note-help">如果您点击“付款”按钮，即表示您同意该次的执行操作。</span>
					</dd>
				</dl>
			</div>
		</form>
		<div id="foot">
			<ul class="foot-ul">
				<li>支付宝版权所有 2015-2018 ALIPAY.COM</li>
			</ul>
		</div>
	</div>
	<script>
        var oDemo = document.getElementById("radio_submit");
        oDemo.addEventListener('click', function() {
            var e = event || window.event;
            if (e.target && e.target.nodeName.toUpperCase() == "INPUT") {
                console.log(this);
                console.log(e.target);
                console.log(e.target.value);
                
            }
        }, false);
    </script>
    	<script>
      document.getElementById("input-type-multiple").onclick = function(){
    	  formValues =  swal({
    		  title: '添加地址',
    		  width:600,
    		  html:
    		    '<table cellSpacing=2 cellPadding=2 width="100%" border=0><tr><td width="20%"  align="right" style="vertical-align: middle; ">详细地址<font color="#DC143C"><i>*</i></font>&nbsp;&nbsp;：</td><td width="80%">'+
    		    '<textarea id="swal-input1" cols="60" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea></td></tr>'+
    		    '<tr><td align="right" style="vertical-align: middle; ">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名<font color="#DC143C"><i>*</i></font>&nbsp;&nbsp;：</td><td align="left"><input id="swal-input2"  placeholder="长度不超过25个字符" ></td></tr>'+
    		    '<tr><td align="right"  style="vertical-align: middle; ">手机号码<font color="#DC143C"><i>*</i></font>&nbsp;&nbsp;：</td><td align="left"><input id="swal-input3"></td></tr></table>',
    		  focusConfirm: false,
    		  preConfirm: () => {
    		    return [
    		      document.getElementById('swal-input1').value,
    		      document.getElementById('swal-input2').value,
    		      document.getElementById('swal-input3').value
    		    ]
    		  }
    		/* }).then(function(formValues){
    			if (formValues) {
    				$.get('addAddress?message='+formValues)
    				.done
    		  	swal(JSON.stringify(formValues))
    			}
    		}) */
     		 }).then(function(formValues){
     			if (formValues) {
     				//setTimeout(function(){
     					//swal($.ajax({url:"addAddress?message="+formValues}))
     					var ajaxObj = new XMLHttpRequest();
     					var reg = new RegExp('"',"g"); 
     					var h=JSON.stringify(formValues);
     					h=h.replace(reg,"");
     					h=h.substring(8);
     					h=h.substring(0,h.length-2);
     					swal(h);
     					ajaxObj.open('get', 'addAddress?message='+h);
     					//swal('addAddress?message='+h);
     					ajaxObj.send();
     					swal({
     						title:'Success'+ajaxObj.responseText,
     						type:'success',
     						confirmButtonText: 'OK',
     					    showCancelButton: false
     					})
     					 }
     			})
    	};
	</script>
    
</body>
</html>