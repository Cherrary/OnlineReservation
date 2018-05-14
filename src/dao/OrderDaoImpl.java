package dao;

import java.util.ArrayList;

import bean.Order;

public class OrderDaoImpl  extends baseDao implements IOrderDao{
	@Override
	public ArrayList<Order> findUserAll() {
		String sql = String.format("select * from OrderItem");
		return this.findObjAll(sql, Order.class);
	}

	@Override
	public Order findUserById(int id) {
		String sql=String.format("select * from OrderItem where Oruserid=?");
		Order order = (Order) this.findObjById(sql, id,Order.class);
		return order;
	}

	@Override
	public ArrayList<Order> findUserBy(String sql, Object[] params) {
		return this.findObjBy(sql, params, Order.class);
	}

	@Override
	public int InsertUser(Order order) {
		String sqlin=String.format("insert into OrderItem values(?,?,?,?,?,?,?,?,?)");
		Object []params = {order.getOrid(),order.getOruserid(),order.getOraddress(),
				order.getOrlinkman(),order.getOrphone(),order.getOrdate(),
				order.getOrdiid(),order.getOrprice(),order.getOrdescribe()};
		return this.modifyObj(sqlin, params);
		
	}

	@Override
	public int UpdateUser(Order order) {
		String sqlup=String.format("update OrderItem set Ordescribe=?  where Orid=?");
		Object[] params={order.getOrdescribe(),order.getOrid()};
		return this.UpdateObj(sqlup, params);
	}

	@Override
	public int DeleteUser(Order order) {
		String sqlde=String.format("delete from OrderItem  where Orid=?");
		Object[] params={order.getOrid()};
		return this.DeleteObj(sqlde, params);
	}

}
