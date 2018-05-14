package dao;

import java.util.ArrayList;

import bean.Dish;


public class DishDaoImpl extends baseDao implements IDishDao{
	@Override
	public ArrayList<Dish> findUserAll() {
		String sql = String.format("select * from Dish");
		return this.findObjAll(sql, Dish.class);
	}

	@Override
	public Dish findUserById(int id) {
		String sql=String.format("select * from Dish where Diid=?");
		Dish dish = (Dish) this.findObjById(sql, id,Dish.class);
		return dish;
	}

	@Override
	public ArrayList<Dish> findUserBy(String sql, Object[] params) {
		return this.findObjBy(sql, params, Dish.class);
	}

	@Override
	public int InsertUser(Dish dish) {
		String sqlin=String.format("insert into Dish values(?,?,?,?,?,?)");
		Object []params = {dish.getDiid(),dish.getDiname(),dish.getDiprice(),dish.getDidiscount(),dish.getDidescribe(),dish.getDiimage()};
		return this.modifyObj(sqlin, params);
		
	}

	@Override
	public int UpdateUser(Dish dish) {
		String sqlup=String.format("update Dish set Didiscount=?  where Diid=?");
		Object[] params={dish.getDidiscount(),dish.getDiid()};
		return this.UpdateObj(sqlup, params);
	}

	@Override
	public int DeleteUser(Dish dish) {
		String sqlde=String.format("delete from Dish  where Diid=?");
		Object[] params={dish.getDiid()};
		return this.DeleteObj(sqlde, params);
	}

}
