package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Card;
import bean.CardItemBean;
import bean.Dish;
import dao.DishDaoImpl;
import dao.IDishDao;

/**
 * Servlet implementation class AddtoCard
 */
@WebServlet("/addtoCard")
public class AddtoCard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddtoCard() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		String diid = request.getParameter("diid");
		IDishDao dishDao = new DishDaoImpl();
		Dish dishtocard = dishDao.findUserById(Integer.parseInt(diid));
		System.out.print(dishtocard);
		HttpSession session = request.getSession(false);
		Map< Integer,CardItemBean> card = (Map< Integer,CardItemBean>) session.getAttribute("card");
		if (card == null) {
			card = new HashMap<>();
			card.put(dishtocard.getDiid(), new CardItemBean(dishtocard, 1));
			out.println("新建且添加成功!");
		} else {
			CardItemBean cartItem = (CardItemBean) card.get(dishtocard.getDiid());
			if (cartItem != null) {
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				out.println("数量+1添加成功!");
			} else {
				card.put(dishtocard.getDiid(), new CardItemBean(dishtocard, 1));
				out.println("新加入且添加成功!");
			}
		}
		
		session.setAttribute("card", card);
		out.close();
		return;
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
