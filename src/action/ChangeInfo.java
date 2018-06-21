package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.IUserDao;
import dao.UserDaoImpl;

/**
 * Servlet implementation class ChangeInfo
 */
@WebServlet("/changeInfo")
public class ChangeInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		IUserDao userDao = new UserDaoImpl();
		User user=(User)session.getAttribute("loginuser");
		user.setUsername(request.getParameter("loginName"));
		user.setUserpassword(request.getParameter("password"));
		user.setUserphone(request.getParameter("phone"));
		if(userDao.UpdateUser(user)==1){
			session.setAttribute("loginuser", user);
			
		}

		request.getRequestDispatcher("myinformation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
