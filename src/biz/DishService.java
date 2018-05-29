package biz;

import java.util.ArrayList;

import bean.Dish;
import dao.IDishDao;
import utils.DaoFactory;
import utils.PageModel;

public class DishService {

	private IDishDao dishDao;
	
	public PageModel<Dish> findDish4PageList(int pageNo,int pageSize){
		dishDao=(IDishDao)DaoFactory.getDaoFactory().newInstance("dishdao");
		String strsql=String.format("select * from Dish limit ?,?");
		int actualpageNO = (pageNo -1)*pageSize;
		Object[] params={actualpageNO,pageSize};
		ArrayList<Dish> dishlist = dishDao.findUserBy(strsql, params);
		System.out.println(dishlist.size());
		System.out.println(dishlist.get(0).getDiid());
		PageModel<Dish> pageModel = new PageModel<Dish>(pageSize, pageNo, getTotalDishs(), dishlist);
		return pageModel;
	}
	public int getTotalDishs(){
		dishDao = (IDishDao)DaoFactory.getDaoFactory().newInstance("dishdao");
		String strsql = String.format("select count(*) from Dish");
		return dishDao.getTotalDishs(strsql);
	}
}
