package biz;

import java.util.Map;

import bean.Card;
import bean.CardItemBean;
import bean.User;
import dao.CardDaoImpl;
import dao.ICardDao;

public class CardService {
	private static ICardDao cardDao;
	public static int addtoSQL(Map< Integer,CardItemBean> cartItem,User user){
		cardDao=new CardDaoImpl();
		Card card=cardDao.findUserById(user.getUserid());
		String carddiid=card.getCarddiid();
		for(CardItemBean value:cartItem.values()){
			for(int i=0;i<value.getQuantity();i++)
				carddiid+=value.getDish().getDiid()+";";
		}
		if(add( carddiid, user.getUserid())==1)
			return 1;
		else
			return 0;
	}
	public static int add(String hString,int userid){
		cardDao=new CardDaoImpl();
		Card card=new Card();
		card.setCarddiid(hString);
		card.setCarduserid(userid);
		if(cardDao.UpdateUser(card)==1)
			return 1;
		else
			return 0;
	}
}
