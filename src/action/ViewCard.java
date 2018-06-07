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

import bean.CardItemBean;
import bean.Dish;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actiontype = request.getParameter("actiontype");
		logger.debug(actiontype);
		System.out.println(actiontype);
		switch(actiontype){
		case "default":
			defaultCard(request, response);
			break;
		case "clearCard":
			clearCard(request, response);
			break;
		case "cart":
		}
		
	}

	private void clearCard(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		HttpSession session = request.getSession(false);
		int sum = (int) session.getAttribute("sum");
		Map< Integer,CardItemBean> card = (Map< Integer,CardItemBean>) session.getAttribute("card");
		sum=0;
		card.clear();
		session.setAttribute("card", card);
		session.setAttribute("sum", sum);
		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		request.getRequestDispatcher("showCard.jsp").forward(request, response);
	}

	private void defaultCard(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		request.getRequestDispatcher("showCard.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
