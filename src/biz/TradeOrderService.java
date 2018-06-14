package biz;

import java.util.ArrayList;

import com.alipay.api.domain.TradeRecord;

import bean.Dish;
import bean.TradeOrder;
import dao.IDishDao;
import dao.ITradeOrderDao;
import utils.DaoFactory;
import utils.PageModel;

public class TradeOrderService {
	private ITradeOrderDao tradeOrderDao;
	
	public PageModel<TradeOrder> findDish4PageList(int pageNo,int pageSize){
		tradeOrderDao=(ITradeOrderDao)DaoFactory.getDaoFactory().newInstance("tradeorderdao");
		String strsql=String.format("select * from TradeOrder limit ?,?");
		int actualpageNO = (pageNo -1)*pageSize;
		Object[] params={actualpageNO,pageSize};
		ArrayList<TradeOrder> orderlist = tradeOrderDao.findUserBy(strsql, params);
		System.out.println(orderlist.size());
		System.out.println(orderlist.get(0).getOrdid());
		PageModel<TradeOrder> pageModel = new PageModel<TradeOrder>(pageSize, pageNo, getTotalOrders(), orderlist);
		return pageModel;
	}
	public int getTotalOrders(){
		tradeOrderDao = (ITradeOrderDao)DaoFactory.getDaoFactory().newInstance("tradeorderdao");
		String strsql = String.format("select count(*) from TradeOrder ");
		return tradeOrderDao.getTotalDishs(strsql);
	}
}