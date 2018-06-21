package action;

import static org.junit.Assert.assertEquals;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;

import bean.CardItemBean;
import bean.TradeOrder;
import bean.User;
import dao.ITradeOrderDao;
import dao.TradeOrderImpl;
import utils.AlipayConfig;

/**
 * Servlet implementation class ReturnURL
 */
@WebServlet("/returnURL")
public class ReturnURL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturnURL() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hString=new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
		if(hString!=null){
			numcache(request,response);
		}else
			xianshi(request,response);
		
		
		
	}

	private void numcache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// �̻�������
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
		// ֧�������׺�
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
		// ������
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
	
		HttpSession session = request.getSession(false);
		
		ITradeOrderDao tradeOrderDao =  new TradeOrderImpl();
		TradeOrder tradeOrder = new TradeOrder();
		tradeOrder.setOrduserid(((User)session.getAttribute("loginuser")).getUserid());
		tradeOrder.setOrdtradeno(out_trade_no);
		tradeOrder.setOrdalitradeno(trade_no);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date(System.currentTimeMillis());
		tradeOrder.setOrddate(time);
		tradeOrder.setOrdsum(Double.valueOf(session.getAttribute("sum").toString()));
		String diid="";
		Map< Integer,CardItemBean> card = (Map< Integer,CardItemBean>) session.getAttribute("card");
		for (Integer key : card.keySet()) {  
		    //System.out.println("Key = " + key);  
		    for(int i=0;i<card.get(key).getQuantity();i++)
		    	diid+=key+";";
		} 
		tradeOrder.setOrddiid(diid);
		tradeOrder.setOrdadid(1);
		if(tradeOrderDao.InsertUser(tradeOrder)==1)
			System.out.println("��ӳɹ�");
		else
			System.out.println("ʧ��");
		session.setAttribute("sum",0);
		request.getRequestDispatcher("return-url.jsp?out_trade_no="+out_trade_no+"&trade_no="+trade_no+"&total_amount="+total_amount).forward(request, response);
	}

	private void xianshi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// ��ȡ֧����GET����������Ϣ
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// ����������δ����ڳ�������ʱʹ��
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		boolean signVerified;
		try {
			signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
					AlipayConfig.sign_type);
			if (signVerified) {
				// �̻�������
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
				// ֧�������׺�
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
				// ������
				String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
			
				request.getRequestDispatcher("returnURL?out_trade_no="+out_trade_no+"&trade_no="+trade_no+"&total_amount="+total_amount).forward(request, response);
			} else {
				// out.println("��ǩʧ��");
			}
		} catch (AlipayApiException e) {
			e.printStackTrace();
		} // ����SDK��֤ǩ��

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
