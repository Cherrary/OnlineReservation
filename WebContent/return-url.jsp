<%@ page language="java" contentType="text/html; charset=gb2312"	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������վ֧��return_url</title>
</head>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="utils.AlipayConfig"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<%
/* *
 * ���ܣ�֧����������ͬ��֪ͨҳ��
 * ���ڣ�2017-03-30
 * ˵����
 * ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 * �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���


 *************************ҳ�湦��˵��*************************
 * ��ҳ�����ҳ��չʾ��ҵ���߼����������ڸ�ҳ��ִ��
 */
 
	//��ȡ֧����GET����������Ϣ
	Map<String,String> params = new HashMap<String,String>();
	Map<String,String[]> requestParams = request.getParameterMap();
	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//����������δ����ڳ�������ʱʹ��
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //����SDK��֤ǩ��

	//�������������д���ĳ������´�������ο�������
	if(signVerified) {
		//�̻�������
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//֧�������׺�
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//������
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
		
		out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
	}else {
		out.println("��ǩʧ��");
	}
	//�������������д���ĳ������ϴ�������ο�������
%>
<body>
</body>
</html>