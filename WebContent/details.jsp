<%@ page language="java" import="java.util.*,dao.*"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'detail.jsp' starting page</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
	<table cellSpacing=0 cellPadding=0 width=776 align=center border=0>
		<tr>
			<td width="220" rowspan="3"></td>
			<td width="556" height="36"></td>
		</tr>
		<tr>
			<TD
				style="FONT-SIZE: 24pt; FILTER: blur(add = 1, direction = 120, strength = 5); WIDTH: 100%; COLOR: #000000; FONT-FAMILY: arial; POSITION: relative"
				noWrap><B><span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XXXX</span>
					���϶���ϵͳ</B></TD>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
	<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
		<TBODY>
			<TR>
				<TD background="images/001.gif" height=42>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD width=0 height=20></TD>
								<TD align=middle><FONT
									style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
									href="#" target=_self><FONT
										style="FONT-SIZE: 13px; COLOR: #000000">��վ��ҳ</FONT> </A><FONT
									style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
									href="#" target=_self><FONT
										style="FONT-SIZE: 13px; COLOR: #000000">��������</FONT> </A><FONT
									style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
									href="#" target=_self><FONT
										style="FONT-SIZE: 13px; COLOR: #000000">���Ͱ���</FONT> </A><FONT
									style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
									href="#" target=_self><FONT
										style="FONT-SIZE: 13px; COLOR: #000000">���϶���</FONT> </A><FONT
									style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
									href="#" target=_self><FONT
										style="FONT-SIZE: 13px; COLOR: #000000">�ͷ�����</FONT> </A><FONT
									style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT></TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
		<TBODY>
			<TR vAlign=top>
				<TD width=181 background="images/002.gif">
					<TABLE cellSpacing=0 cellPadding=0 width=181 border=0>
						<TBODY>
							<TR>
								<TD><IMG height=234 src="images/left_top.jpg" width=181>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD align=middle height=30><FONT color=#000000> <SCRIPT
											language=javascript src="images/DateTime2.js"></SCRIPT> <SCRIPT
											language=javascript>
												tick('cn');
											</SCRIPT>
								</FONT></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD></TD>
							</TR>
							<TR>
								<TD background="images/003.gif" height=4></TD>
							</TR>
							<TR>
								<TD></TD>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD></TD>
							</TR>
							<TR>
								<TD background="images/003.gif" height=4></TD>
							</TR>
							<TR>
								<TD align=middle>
									<TABLE cellSpacing=0 cellPadding=0 width="94%" border=0>
										<TBODY>
											<TR>
												<TD></TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD><IMG height=72 src="images/001.jpg" width=595></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD width="90%">
									<div class='cnt'>
										<marquee style="FONT-SIZE: 13px; COLOR: #0000FF"
											scrollamount='5' direction='left'>
											<IMG height=15 src="images/tp009.gif" width=15>
											��ӭ${sessionScope.loginuser.username}ʹ����ѧ�һ����϶���ϵͳ��ף���ò���죡
										</marquee>
									</div> &nbsp;&nbsp;
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD align=right background="images/004.gif" height=19></TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width="96%" align=center
						border=0>
						<TBODY>
							<TR>
								<TD>

									<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center
										bgColor=#c0c0c0 border=0>
										<TBODY>
											<TR bgColor=#dadada>

												<TD width="100%" align="center">ʹ����ѧ�һ����϶���ϵͳ��ף���ò���죡</TD>
											</TR>
										</TBODY>
									</TABLE> <BR>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					<table width="90%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="90" height="90" valign="top"><img
								src="images/${sessionScope.currentdish.diimage}" border="0"
								width="80" height="80"></td>
							<td valign="top">
								<table width="98%" border="0" cellspacing="1" cellpadding="0"
									align="center">
									<tr>
										<td><strong>${sessionScope.currentdish.diname}</strong></td>
									</tr>
									<tr>
										<td height="21">ʹ����ѧ�һ����϶���ϵͳ��ף���ò���죡<strike>ʹ����ѧ</strike> <br> <font
											color="#ff0000">ʹ����ѧ${sessionScope.currentdish.diprice }ʹ����ѧ</font>
											<br> ʹ����ѧ
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="30">ʹ����ѧ: 22</td>
							<td>
								<table width="145" border="0" cellspacing="1" cellpadding="0">
									<tr>
										<td align="center" width="70"><a href=#
											onClick="window.open('addtocart?diid=${sessionScope.currentdish.diid}','shopcart','width=580,height=250,resizable=no,scrollbars=yes')">
												<img src="images/buy_cn.gif" border=0 width="60" height="20">
										</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<P align=center>
						<STRONG><FONT size=4>ʹ����ѧ</FONT> </STRONG>
					</P>
					<HR align=center width="100%" color=#000000 noShade SIZE=1>

					<P align=center>
						<IMG
							style="BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000; WIDTH: 232px; BORDER-TOP-COLOR: #000000; POSITION: static; HEIGHT: 172px; BORDER-RIGHT-COLOR: #000000; align:"
							height=294 alt="" hspace=0 src="images/500047.jpg" width=350
							border=0>
					</P>
					<P align=center>
						<FONT size=3>ʹ����ѧ</FONT>
					</P> <br>
				</td>
			</tr>
	</table>


	<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
		<TBODY>
			<TR>
				<TD background="images/005.gif" height=8></TD>
			</TR>
		</TBODY>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
		<TBODY>
			<TR>
				<TD bgColor=#eeeeee>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD align=middle><BR>
									<P align=center>
										<FONT color=#000000>Copyright &copy;
											2010&nbsp;&nbsp;&nbsp;&nbsp; XXXX���޹�˾����</FONT>
									</P>
									<P align=center></P> <BR> <BR></TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</BODY>
</html>