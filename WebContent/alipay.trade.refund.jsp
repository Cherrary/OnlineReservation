<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�˿�</title>
</head>
<%@ page language="java" contentType="text/html; charset=gb2312" pageEncoding="GBK"%>
<%@ page import="utils.AlipayConfig"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%
	//��ó�ʼ����AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	
	//�����������
	AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();
	
	//�̻������ţ��̻���վ����ϵͳ��Ψһ������
	String out_trade_no = new String(request.getParameter("WIDTRout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	//֧�������׺�
	String trade_no = new String(request.getParameter("WIDTRtrade_no").getBytes("ISO-8859-1"),"UTF-8");
	//���ѡһ����
	//��Ҫ�˿�Ľ��ý��ܴ��ڶ���������
	String refund_amount = new String(request.getParameter("WIDTRrefund_amount").getBytes("ISO-8859-1"),"UTF-8");
	//�˿��ԭ��˵��
	String refund_reason = new String(request.getParameter("WIDTRrefund_reason").getBytes("ISO-8859-1"),"UTF-8");
	//��ʶһ���˿�����ͬһ�ʽ��׶���˿���Ҫ��֤Ψһ�����貿���˿��˲����ش�
	String out_request_no = new String(request.getParameter("WIDTRout_request_no").getBytes("ISO-8859-1"),"UTF-8");
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"trade_no\":\""+ trade_no +"\"," 
			+ "\"refund_amount\":\""+ refund_amount +"\"," 
			+ "\"refund_reason\":\""+ refund_reason +"\"," 
			+ "\"out_request_no\":\""+ out_request_no +"\"}");
	
	//����
	String result = alipayClient.execute(alipayRequest).getBody();
	
	//���
	out.println(result);
%>
<body>
</body>
</html>