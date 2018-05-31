package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;

import utils.AlipayConfig;

/**
 * Servlet implementation class PayAciton
 */
@WebServlet("/payAction")
public class PayAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayAction() {
        super();
   }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//AlipayConfig alipayConfig = new AlipayConfig();
		//AlipayClient alipayClient = new DefaultAlipayClient(alipayConfig.gatewayUrl,alipayConfig.app_id,alipayConfig.merchant_private_key,"json", alipayConfig.charset, alipayConfig.alipay_public_key, alipayConfig.sign_type);
		request.setAttribute("WIDout_trade_no", 1);
		request.setAttribute("WIDtotal_amount", 0.1);
		request.setAttribute("WIDsubject", "onlineservation");
		request.setAttribute("WIDbody", "delicious");
		request.getRequestDispatcher("pay.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
