package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

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
import net.sf.json.JSON;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class AddAddress
 */
@WebServlet("/addAddress")
public class AddAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAddress() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Enumeration em = request.getParameterNames();
		System.out.println("1addd");
		String addressString = request.getParameter("message");
		IAddressDao addressDao = new AddressDaoImpl();
		Address address = new Address();
		
		HttpSession session = request.getSession(false);
		address.setAduserid(1);
		String[] adds=addressString.split(",");
		address.setAdaddress(adds[0]);
		address.setAdlinkman(adds[1]);
		address.setAdphone(adds[2]);

		response.setContentType("text/html;charset=gb2312");
		PrintWriter out=response.getWriter();
		
		if(addressDao.InsertUser(address)==1){
	        out.print(1);
		}else{
			out.print(0);
		}
		out.flush();
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
