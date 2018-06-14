package dao;

import java.util.ArrayList;

import bean.Address;
public class AddressDaoImpl  extends baseDao implements IAddressDao{
	@Override
	public ArrayList<Address> findUserAll() {
		String sql = String.format("select * from Address");
		return this.findObjAll(sql, Address.class);
	}

	@Override
	public Address findUserById(int id) {
		String sql=String.format("select * from Address where Aduserid=?");
		Address order = (Address) this.findObjById(sql, id,Address.class);
		return order;
	}

	@Override
	public ArrayList<Address> findUserBy(String sql, Object[] params) {
		return this.findObjBy(sql, params, Address.class);
	}

	@Override
	public int InsertUser(Address order) {
		String sqlin=String.format("insert into Address values(?,?,?,?,?)");
		Object []params = {order.getAdid(),order.getAduserid(),order.getAdaddress(),
				order.getAdlinkman(),order.getAdphone()};
		return this.modifyObj(sqlin, params);
		
	}

	@Override
	public int UpdateUser(Address order) {
		String sqlup=String.format("update Address set Adaddress=?  where Adid=?");
		Object[] params={order.getAdaddress(),order.getAdid()};
		return this.UpdateObj(sqlup, params);
	}

	@Override
	public int DeleteUser(Address order) {
		String sqlde=String.format("delete from Address  where Adid=?");
		Object[] params={order.getAdid()};
		return this.DeleteObj(sqlde, params);
	}

}
