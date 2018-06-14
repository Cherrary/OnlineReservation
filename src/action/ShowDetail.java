package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Dish;

/**
 * Servlet implementation class ShowDetail
 */
@WebServlet("/showDetail")
public class ShowDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDetail() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String Diid = request.getParameter("diid");
		HttpSession session = request.getSession(false);
		ArrayList<Dish> dishs = (ArrayList<Dish>)session.getAttribute("dishlist");
		System.out.println(session.getAttribute("loginuser"));
		System.out.println(session.getAttribute("dishlist"));
		Dish currentdish = null;
		for(Dish dish:dishs){
			if(dish.getDiid()==Integer.parseInt(Diid)){
				currentdish = dish;
				break;
			}
		}
		session.setAttribute("currentdish", currentdish);
		request.getRequestDispatcher("detail.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
