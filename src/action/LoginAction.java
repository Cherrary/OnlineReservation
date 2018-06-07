package action;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.sun.jndi.toolkit.dir.DirSearch;

import bean.Dish;
import bean.User;
import biz.DishService;
import biz.UserService;
import utils.DaoFactory;
import utils.PageModel;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/loginAction")

public class LoginAction extends BaseControl {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actiontype = request.getParameter("actiontype");
		logger.debug(actiontype);
		System.out.println(actiontype);
		switch(actiontype){
		case "login":
			loginCheck(request, response);
			break;
		case "pagelish":
			pageListView(request, response);
			break;
		case "detail":
		case "cart":
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actiontype = request.getParameter("actiontype");
		logger.debug(actiontype);
		System.out.println(request.getParameter("actiontype"));
		doGet(request, response);
		
	}
	/**
	 * 登录验证
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("loginName");
		String pwd=request.getParameter("loginPass");
		User users=new User();
		users.setUsername(user);
		users.setUserpassword(pwd);
		logger.debug(user+ "   "+pwd);
		UserService userService=(UserService) DaoFactory.getDaoFactory().newInstance("userservice");
		if(userService.available(user,pwd)==true){
			HttpSession session = request.getSession(true);
			session.setAttribute("loginuser", users);
			DishService dishService = new DishService();
			int pageSize=6;
			int pageNO=1;
			PageModel<Dish> pageModel = dishService.findDish4PageList(pageNO, pageSize);
			session.setAttribute("dishlist", pageModel.getList());
			session.setAttribute("pageModel", pageModel);
			session.setAttribute("sum", 0);
			System.out.println(pageModel.getList());
			request.getRequestDispatcher("show2.jsp?pageNO="+pageNO+"&totalpages="+pageModel.getTotalPages()).forward(request, response);
		}else{
			response.sendRedirect("login.html");
		}
	}
	private void pageListView(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		logger.debug(request.getParameter("pageNO"));
		int pageNO = Integer.parseInt(request.getParameter("pageNO"));
		int pageSize = 6;
		//分页查询
		DishService dishService = new DishService();
		PageModel<Dish> pageModel = dishService.findDish4PageList(pageNO, pageSize);
		logger.debug(pageModel.getList());
		HttpSession session = request.getSession(false);
		session.setAttribute("dishlist", pageModel.getList());
		session.setAttribute("pageModel", pageModel);
		request.getRequestDispatcher("show2.jsp?pageNO=1&totalpages="+pageModel.getTotalPages()).forward(request, response);
		
	}
}
