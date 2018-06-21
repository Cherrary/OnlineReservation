package action;

import static org.junit.Assert.assertNotNull;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import bean.Card;
import bean.CardItemBean;
import bean.Dish;
import bean.OrderItemBean;
import bean.TradeOrder;
import bean.User;
import biz.CardService;
import biz.DishService;
import biz.TradeOrderService;
import biz.UserService;
import dao.CardDaoImpl;
import dao.DishDaoImpl;
import dao.ICardDao;
import dao.IDishDao;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actiontype = request.getParameter("actiontype");
		logger.debug(actiontype);
		System.out.println(actiontype + "::");
		switch (actiontype) {
		case "login":
			loginCheck(request, response);
			break;
		case "pagelist":
			pageListView(request, response);
			break;
		case "detail":
		case "cart":
		default:
			System.out.println("no match");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

	/**
	 * 登录验证
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void loginCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = request.getParameter("loginName");
		String pwd = request.getParameter("loginPass");
		User users = new User();
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=gb2312");
		users.setUsername(user);
		users.setUserpassword(pwd);
		logger.debug(user + "   " + pwd);
		UserService userService = (UserService) DaoFactory.getDaoFactory().newInstance("userservice");
		if (userService.available(user, pwd) == true) {
			users.setUserid(userService.findId(user));
			HttpSession session = request.getSession(true);
			session.setAttribute("loginuser", users);
			Map<Integer, CardItemBean> cartItem = (Map<Integer, CardItemBean>) session.getAttribute("card");
			ICardDao cardDao = new CardDaoImpl();
			if (cartItem != null && !cartItem.isEmpty()) {
				CardService cardService = new CardService();
				if(CardService.addtoSQL(cartItem, users)==1)
					System.out.println("addSuccess");
				cartItem.clear();
			}
			if (cartItem == null)
				cartItem = new HashMap<>();
			Card card = cardDao.findUserById(users.getUserid());
			String carddiid = card.getCarddiid();
			String[] cardno = carddiid.split(";");
			IDishDao dishDao = new DishDaoImpl();
			int sum = 0;
			for (int i = 0; i < cardno.length-1; i++) {
				Dish dishtocard = (Dish) dishDao.findUserById(Integer.valueOf(cardno[i]));
				CardItemBean cart = (CardItemBean) cartItem.get(dishtocard.getDiid());
				if (cart != null) {
					cart.setQuantity(cart.getQuantity() + 1);
				} else {
					cartItem.put(dishtocard.getDiid(), new CardItemBean(dishtocard, 1));
				}
				sum+=dishtocard.getDiprice()-dishtocard.getDidiscount();
			}
			session.setAttribute("card",cartItem);
			session.setAttribute("sum", sum);
			request.getRequestDispatcher("show.jsp").forward(request, response);
		} else {
			response.sendRedirect("NewFile.html");
		}
	}

	private void pageListView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println(");;;");
		logger.debug(request.getParameter("pageNO"));
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=gb2312");
		int pageNO = Integer.parseInt(request.getParameter("pageNO"));
		int pageSize = 9;
		// 分页查询
		DishService dishService = new DishService();
		PageModel<Dish> pageModel = dishService.findDish4PageList(pageNO, pageSize);
		logger.debug(pageModel.getList());
		HttpSession session = request.getSession(false);
		session.setAttribute("dishlist", pageModel.getList());
		session.setAttribute("pageModel", pageModel);
		session.setAttribute("pageNO", pageNO);
		session.setAttribute("totalpages", pageModel.getTotalPages());
		System.out.println(pageNO);
		request.getRequestDispatcher("show.jsp?changePages=1").forward(request, response);

	}
}
