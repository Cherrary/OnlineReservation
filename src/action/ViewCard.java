package action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import bean.Card;
import bean.CardItemBean;
import bean.Dish;
import bean.User;
import biz.CardService;
import biz.UserService;
import dao.CardDaoImpl;
import dao.ICardDao;
import utils.PageModel;

/**
 * Servlet implementation class ViewCard
 */
@WebServlet("/viewCard")
public class ViewCard extends BaseControl {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewCard() {
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
		System.out.println(actiontype);
		switch (actiontype) {
		case "default":
			defaultCard(request, response);
			break;
		case "clearCard":
			clearCard(request, response);
			break;
		case "delete":
			deleteCard(request, response);
			break;
		case "subtract":
			subtractCard(request,response);
			break;
		case "addup":
			addupCard(request,response);
			break;
		}

	}

	private void addupCard(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		HttpSession session = request.getSession(false);
		Map<Integer, CardItemBean> card = (Map<Integer, CardItemBean>) session.getAttribute("card");
		int diid = Integer.parseInt(request.getParameter("diid"));
		CardItemBean cardItemBean = (CardItemBean) card.get(diid);
		cardItemBean.setQuantity(cardItemBean.getQuantity() + 1);
		session.setAttribute("card", card);
		int sum=(int) session.getAttribute("sum");
		sum+=cardItemBean.getDish().getDiprice()-cardItemBean.getDish().getDidiscount();
		session.setAttribute("sum", sum);
		User user = (User) session.getAttribute("loginuser");
		String hString = "";
		if (user != null) {
			for (CardItemBean value : card.values()) {
				for (int i = 0; i < value.getQuantity(); i++)
					hString += value.getDish().getDiid() + ";";
			}
			if (CardService.add(hString, ((User) session.getAttribute("loginuser")).getUserid()) == 1) {
				request.getRequestDispatcher("showCard.jsp").forward(request, response);
			}
		}else
			request.getRequestDispatcher("showCard.jsp").forward(request, response);
		
	}

	private void subtractCard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession(false);
		Map<Integer, CardItemBean> card = (Map<Integer, CardItemBean>) session.getAttribute("card");
		int diid = Integer.parseInt(request.getParameter("diid"));
		CardItemBean cardItemBean = (CardItemBean) card.get(diid);
		if(cardItemBean.getQuantity()<=1){
			request.getRequestDispatcher("showCard.jsp").forward(request, response);
			return;
		}
		cardItemBean.setQuantity(cardItemBean.getQuantity() - 1);
		session.setAttribute("card", card);
		int sum=(int) session.getAttribute("sum");
		sum-=cardItemBean.getDish().getDiprice()-cardItemBean.getDish().getDidiscount();
		session.setAttribute("sum", sum);
		User user = (User) session.getAttribute("loginuser");
		String hString = "";
		if (user != null) {
			for (CardItemBean value : card.values()) {
				for (int i = 0; i < value.getQuantity(); i++)
					hString += value.getDish().getDiid() + ";";
			}
			if (CardService.add(hString, ((User) session.getAttribute("loginuser")).getUserid()) == 1) {
				request.getRequestDispatcher("showCard.jsp").forward(request, response);
			}
		}else
			request.getRequestDispatcher("showCard.jsp").forward(request, response);
	}

	private void deleteCard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Map<Integer, CardItemBean> card = (Map<Integer, CardItemBean>) session.getAttribute("card");
		int diid = Integer.parseInt(request.getParameter("diid"));
		String hString = "";
		CardItemBean cardItemBean=card.remove(diid);
		session.setAttribute("card", card);
		int sum=(int) session.getAttribute("sum");
		sum-=cardItemBean.getQuantity()*(cardItemBean.getDish().getDiprice()-cardItemBean.getDish().getDidiscount());
		session.setAttribute("sum", sum);
		User user = (User) session.getAttribute("loginuser");
		if (user != null) {
			for (CardItemBean value : card.values()) {
				for (int i = 0; i < value.getQuantity(); i++)
					hString += value.getDish().getDiid() + ";";
			}
			if (CardService.add(hString, ((User) session.getAttribute("loginuser")).getUserid()) == 1) {
				request.getRequestDispatcher("showCard.jsp").forward(request, response);
			}
		}else
			request.getRequestDispatcher("showCard.jsp").forward(request, response);
	}

	private void clearCard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Map<Integer, CardItemBean> card = (Map<Integer, CardItemBean>) session.getAttribute("card");
		if (card != null) {
			int sum = (int) session.getAttribute("sum");
			sum = 0;
			card.clear();
			session.setAttribute("card", card);
			session.setAttribute("sum", sum);
		}
		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		User user = (User) session.getAttribute("loginuser");
		String hString = "";
		if (user != null) {
			if (CardService.add(hString, ((User) session.getAttribute("loginuser")).getUserid()) == 1) {
				request.getRequestDispatcher("showCard.jsp").forward(request, response);
			}
		}
		request.getRequestDispatcher("showCard.jsp").forward(request, response);
	}

	private void defaultCard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		request.getRequestDispatcher("showCard.jsp").forward(request, response);
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
