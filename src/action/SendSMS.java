package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.SMSVerification;

/**
 * Servlet implementation class SendSMS
 */
@WebServlet("/sendSMS")
public class SendSMS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendSMS() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num=request.getParameter("phone");
		System.out.println(num);
		if(num.trim().equals("")||num==null){
			System.out.println("kong");
			response.sendRedirect("Register.jsp");
			return;
		}
		if(!Pattern.matches("^1[3|5|8]\\d{9}$", num)){
			System.out.println("手机号格式有误");
			response.sendRedirect("Register.jsp");
			return;
		}
		StringBuffer buffer = new StringBuffer();
		Random random=new Random();
		for(int i=0;i<6;i++)
			buffer.append(random.nextInt(10));
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out=response.getWriter();
		try{
			if(!SMSVerification.send(num, buffer.toString()))
				out.println("发送失败");
			else{

				HttpSession session = request.getSession();
				session.setAttribute("code", buffer.toString());
				session.setAttribute("phone", num);
				session.setAttribute("time", System.currentTimeMillis());
				out.print("发送成功");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
