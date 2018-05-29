package bean;

import java.io.Serializable;

public class CardItemBean implements Serializable{
	private Dish dish;
	private int quantity;
	public CardItemBean(Dish dishtoadd,int number){
		this.dish=dishtoadd;
		this.quantity=number;
	}
		public Dish getDish() {
		return dish;
	}
	public void setDish(Dish dish) {
		this.dish = dish;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
