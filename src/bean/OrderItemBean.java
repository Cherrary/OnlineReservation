package bean;

import java.io.Serializable;
import java.util.Map;

public class OrderItemBean  implements Serializable{
	private TradeOrder order;
	private Map<Integer, CardItemBean> ordercard;
	public OrderItemBean(TradeOrder tradeorder,Map<Integer, CardItemBean> card){
		this.order=tradeorder;
		this.ordercard=card;
	}

	public TradeOrder getOrder() {
		return order;
	}
	public void setOrder(TradeOrder order) {
		this.order = order;
	}
	public Map<Integer, CardItemBean> getOrdercard() {
		return ordercard;
	}
	public void setOrdercard(Map<Integer, CardItemBean> ordercard) {
		this.ordercard = ordercard;
	}
}
