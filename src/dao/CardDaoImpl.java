package dao;

import java.util.ArrayList;

import bean.Card;

public class CardDaoImpl extends baseDao implements ICardDao{

		@Override
		public ArrayList<Card> findUserAll() {
			String sql = String.format("select * from Card ");
			return this.findObjAll(sql, Card.class);
		}

		@Override
		public Card findUserById(int id) {
			String sql=String.format("select * from Card where Carduserid=?");
			Card card = (Card) this.findObjById(sql, id,Card.class);
			return card;
		}

		@Override
		public ArrayList<Card> findUserBy(String sql, Object[] params) {
			return this.findObjBy(sql, params, Card.class);
		}

		@Override
		public int InsertUser(Card card) {
			String sqlin=String.format("insert into Card  values(?,?,?)");
			Object []params = {card.getCardid(),card.getCarduserid(),card.getCarddiid()};
			return this.modifyObj(sqlin, params);
			
		}

		@Override
		public int UpdateUser(Card card) {
			String sqlup=String.format("update Card set Carddiid=?  where Carduserid=?");
			Object[] params={card.getCarddiid(),card.getCarduserid()};
			return this.UpdateObj(sqlup, params);
		}

		@Override
		public int DeleteUser(Card card) {
			String sqlde=String.format("delete from Card  where Carduserid=?");
			Object[] params={card.getCarduserid()};
			return this.DeleteObj(sqlde, params);
		}

}
