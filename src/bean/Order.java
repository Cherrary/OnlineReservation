package bean;

import java.sql.Timestamp;

public class Order {
	private int Orid;
	private int Oruserid;
	private String Oraddress;
	private String Orlinkman;
	private int Orphone;
	private Timestamp Ordate;
	private String Ordiid;
	private double Orprice;
	private String Ordescribe;
	
	public int getOrid() {
		return Orid;
	}
	public void setOrid(int orid) {
		Orid = orid;
	}
	public int getOruserid() {
		return Oruserid;
	}
	public void setOruserid(int oruserid) {
		Oruserid = oruserid;
	}
	public String getOraddress() {
		return Oraddress;
	}
	public void setOraddress(String oraddress) {
		Oraddress = oraddress;
	}
	public String getOrlinkman() {
		return Orlinkman;
	}
	public void setOrlinkman(String orlinkman) {
		Orlinkman = orlinkman;
	}
	public int getOrphone() {
		return Orphone;
	}
	public void setOrphone(int orphone) {
		Orphone = orphone;
	}
	public Timestamp getOrdate() {
		return Ordate;
	}
	public void setOrdate(Timestamp ordate) {
		Ordate = ordate;
	}
	public String getOrdiid() {
		return Ordiid;
	}
	public void setOrdiid(String ordiid) {
		Ordiid = ordiid;
	}
	public double getOrprice() {
		return Orprice;
	}
	public void setOrprice(double orprice) {
		Orprice = orprice;
	}
	public String getOrdescribe() {
		return Ordescribe;
	}
	public void setOrdescribe(String ordescribe) {
		Ordescribe = ordescribe;
	}
}
