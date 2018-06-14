package dao;

import java.util.ArrayList;

import bean.TradeOrder;

public class TradeOrderImpl extends baseDao implements ITradeOrderDao{
	@Override
	public ArrayList<TradeOrder> findUserAll() {
		String sql = String.format("select * from TradeOrder");
		return this.findObjAll(sql, TradeOrder.class);
	}

	@Override
	public TradeOrder findUserById(int id) {
		String sql=String.format("select * from TradeOrder where Ordid=?");
		TradeOrder order = (TradeOrder) this.findObjById(sql, id,TradeOrder.class);
		return order;
	}

	@Override
	public ArrayList<TradeOrder> findUserBy(String sql, Object[] params) {
		return this.findObjBy(sql, params, TradeOrder.class);
	}

	@Override
	public int InsertUser(TradeOrder order) {
		String sqlin=String.format("insert into TradeOrder values(?,?,?,?,?,?,?)");
		Object []params = {order.getOrdid(),order.getOrduserid(),order.getOrdtradeno(),
				order.getOrdalitradeno(),order.getOrddiid(),order.getOrddate(),order.getOrdsum()};
		return this.modifyObj(sqlin, params);
		
	}

	@Override
	public int UpdateUser(TradeOrder order) {
		String sqlup=String.format("update TradeOrder set Orddiid=?  where Ordid=?");
		Object[] params={order.getOrddiid(),order.getOrdid()};
		return this.UpdateObj(sqlup, params);
	}

	@Override
	public int DeleteUser(TradeOrder order) {
		String sqlde=String.format("delete from TradeOrder  where Ordid=?");
		Object[] params={order.getOrdid()};
		return this.DeleteObj(sqlde, params);
	}
	
	@Override
	public int getTotalDishs(String sql){
		return this.getTotalRecords(sql);
	}
}
