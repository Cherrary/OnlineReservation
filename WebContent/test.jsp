<%@ page language="java" import="java.util.*,dao.*,bean.*"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>Insert title here</title>
<script src="System/script/sweetalert2.all.min.js"></script>
<script src="https://unpkg.com/promise-polyfill"></script>
<script src="System/script/sweetalert2.min.js"></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
</head>


<body>
	<button id="input-type-multiple">����һ��</button>

	<script>
      document.getElementById("input-type-multiple").onclick = function(){
    	  formValues =  swal({
    		  title: '��ӵ�ַ',
    		  width:600,
    		  html:
    		    '<table cellSpacing=2 cellPadding=2 width="100%" border=0><tr><td width="20%"  align="right" style="vertical-align: middle; ">��ϸ��ַ<font color="#DC143C"><i>*</i></font>&nbsp;&nbsp;��</td><td width="80%">'+
    		    '<textarea id="swal-input1" cols="60" placeholder="��������ʵ��д��ϸ�ջ���ַ������ֵ����ƣ����ƺ��룬¥��ͷ���ŵ���Ϣ"></textarea></td></tr>'+
    		    '<tr><td align="right" style="vertical-align: middle; ">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��<font color="#DC143C"><i>*</i></font>&nbsp;&nbsp;��</td><td><input id="swal-input2"  placeholder="���Ȳ�����25���ַ�" ></td></tr>'+
    		    '<tr><td align="right"  style="vertical-align: middle; ">�ֻ�����<font color="#DC143C"><i>*</i></font>&nbsp;&nbsp;��</td><td><input id="swal-input3"></td></tr></table>',
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