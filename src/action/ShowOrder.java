package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CardItemBean;
import bean.Dish;
import bean.OrderItemBean;
import bean.TradeOrder;
import bean.User;
import biz.DishService;
import biz.TradeOrderService;
import dao.DishDaoImpl;
import dao.IDishDao;
import dao.ITradeOrderDao;
import dao.TradeOrderImpl;
import utils.PageModel;

/**
 * Servlet implementation class ShowOrder
 */
@WebServlet("/showOrder")
public class ShowOrder extends BaseControl {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowOrder() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((User)session.getAttribute("loginuser")==null){
			response.sendRedirect("NewFile.html");
			return;
		}
		String actiontype = request.getParameter("actiontype");
		logger.debug(actiontype);
		System.out.println(actiontype);
		switch(actiontype){
		case "show":
			showPage(request, response);
			break;
		case "pagelish":
			pageListView(request, response);
			break;
		}
	}



	private void showPage(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		HttpSession session = request.getSession(false);
		TradeOrderService orderService = new TradeOrderService();
		int pageSize=4;
		int pageNO=1;
		PageModel<TradeOrder> orderpageModel = orderService.findDish4PageList(pageNO, pageSize);
		session.setAttribute("orderlist", orderpageModel.getList());
		session.setAttribute("orderpageModel", orderpageModel);
		System.out.println(orderpageModel.getList());
		ArrayList<OrderItemBean> ordercardlist = showcard(orderpageModel.getList());
		session.setAttribute("ordercardlist", ordercardlist);
		request.getRequestDispatcher("showorder.jsp?pageNO="+pageNO+"&totalpages="+orderpageModel.getTotalPages()).forward(request, response);
	}
	
	private ArrayList<OrderItemBean>  showcard(ArrayList<TradeOrder> arrayList) {
		//Map< Integer,ArrayList<CardItemBean>> ordercard =  new HashMap<>();
		ArrayList<OrderItemBean> ordercardlist = new ArrayList<>();
		IDishDao dishDao = new DishDaoImpl();
		Map< Integer,CardItemBean> ordercard = new HashMap<>();
		for(TradeOrder key:arrayList){
			ordercard.clear();
			String hString=key.getOrddiid();
			String[] dishno=hString.split(";");
			for(int i=0;i<dishno.length;i++){
				Dish dishtocard=(Dish)dishDao.findUserById(Integer.valueOf(dishno[i]));
				CardItemBean cartItem = (CardItemBean) ordercard.get(dishtocard.getDiid());
				if (cartItem != null) {
					cartItem.setQuantity(cartItem.getQuantity() + 1);
				} else {
					ordercard.put(dishtocard.getDiid(), new CardItemBean(dishtocard, 1));
				}
			}
			ordercardlist.add(new OrderItemBean(key, ordercard));
		}
		return ordercardlist;
	}

	private void pageListView(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		logger.debug(request.getParameter("pageNO"));
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=gb2312");
		int pageNO = Integer.parseInt(request.getParameter("pageNO"));
		int pageSize = 4;
		//·ÖÒ³²éÑ¯
		TradeOrderService orderService = new TradeOrderService();
		PageModel<TradeOrder> orderpageModel = orderService.findDish4PageList(pageNO, pageSize);
		logger.debug(orderpageModel.getList());
		HttpSession session = request.getSession(false);
		session.setAttribute("orderlist", orderpageModel.getList());
		session.setAttribute("orderpageModel", orderpageModel);
		ArrayList<OrderItemBean> ordercardlist = showcard(orderpageModel.getList());
		session.setAttribute("ordercardlist", ordercardlist);
		request.getRequestDispatcher("showorder.jsp?pageNO=1&totalpages="+orderpageModel.getTotalPages()).forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
