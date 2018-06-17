package action;

import java.io.IOException;
import java.util.regex.Pattern;

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
import dao.IUserDao;
import dao.UserDaoImpl;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String num=request.getParameter("phone");
		String code=request.getParameter("code");
		if(num==null || num.trim().equals("")||code==null || code.trim().equals("")){
			System.out.println("�ֻ�����֤��Ϊ��!");
			response.sendRedirect("Register.jsp");
			return;
		}
		if(!Pattern.matches("^1[3|5|8]\\d{9}$", num)){
			System.out.println("�ֻ���ʽ����");
			response.sendRedirect("Register.jsp");
			return;
		}
		HttpSession session = request.getSession();
		String code_session = (String)session.getAttribute("code");
		String number = (String)session.getAttribute("phone");
		Long time=(Long)session.getAttribute("time");
		
		session.removeAttribute("code");
		session.removeAttribute("phone");
		session.removeAttribute("time");
		
		if(code_session==null ||code_session.trim().equals("")){
			System.out.println("��֤��Ϊ��");
			response.sendRedirect("Register.jsp");
			return;
		}
		if((System.currentTimeMillis()-time)/1000/60>=10){
			System.out.println("��֤���ѹ���");
			response.sendRedirect("Register.jsp");
			return;
		}
		if(!num.trim().equalsIgnoreCase(number)){
			System.out.println("�ֻ����벻һ��");
			response.sendRedirect("Register.jsp");
			return;
		}
		if(code_session.trim().equalsIgnoreCase(code)){
			System.out.println("ע��ɹ�");
			IUserDao userDao = new UserDaoImpl();
			User user = new User();
			user.setUsername(request.getParameter("loginName"));
			user.setUserpassword(request.getParameter("loginPass"));
			if(userDao.InsertUser(user)==1){
				System.out.println("ע��ɹ�");
				response.sendRedirect("regsuccess.jsp");
			}
		}else{
			System.out.println("��֤�벻һ��");
			response.sendRedirect("Register.jsp");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
