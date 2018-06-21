package action;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Address;
import bean.User;
import dao.AddressDaoImpl;
import dao.IAddressDao;

/**
 * Servlet implementation class PayAciton
 */
@WebServlet("/payAction")
public class PayAction extends BaseControl {
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
		HttpSession session = request.getSession();
		if(session.getAttribute("loginuser")==null){
			response.sendRedirect("NewFile.html");
			return;
		}
		request.setAttribute("WIDsubject", "onlineservation");
		request.setAttribute("WIDout_trade_no", GetDateNow());
		ArrayList<Address> addresslist=null;
		IAddressDao addressDao = new AddressDaoImpl();
		String sql = String.format("select * from Address where Aduserid=?");
		User loginuser=(User)session.getAttribute("loginuser");
		Object[] params = {loginuser.getUserid()};
		addresslist=addressDao.findUserBy(sql,params);
		session.setAttribute("addresslist", addresslist);
		request.getRequestDispatcher("pay.jsp").forward(request, response);
	}

	protected String GetDateNow() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMdHms");
		Timestamp timeStamp = new Timestamp(System.currentTimeMillis());
		String vNow="";
		String[] time=timeStamp.toString().split("\\.");
		logger.debug(timeStamp.toString()+"  "+time.length);
		vNow = df.format(timeStamp)+time[1];
		logger.debug(vNow);
		return vNow;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
