package bean;

import java.sql.Date;

public class TradeOrder {
	private int Ordid;
	private int Orduserid;
	private String Ordtradeno;
	private String Ordalitradeno;
	private String Orddiid;
	private Date Orddate;
	private Double Ordsum;
	private int Ordadid;
	public int getOrdid() {
		return Ordid;
	}
	public void setOrdid(int ordid) {
		Ordid = ordid;
	}
	public int getOrduserid() {
		return Orduserid;
	}
	public void setOrduserid(int orduserid) {
		Orduserid = orduserid;
	}
	public String getOrdtradeno() {
		return Ordtradeno;
	}
	public void setOrdtradeno(String ordtradeno) {
		Ordtradeno = ordtradeno;
	}
	public String getOrdalitradeno() {
		return Ordalitradeno;
	}
	public void setOrdalitradeno(String ordalitradeno) {
		Ordalitradeno = ordalitradeno;
	}
	public String getOrddiid() {
		return Orddiid;
	}
	public void setOrddiid(String orddiid) {
		Orddiid = orddiid;
	}
	public Date getOrddate() {
		return Orddate;
	}
	public void setOrddate(Date orddate) {
		Orddate = orddate;
	}
	public Double getOrdsum() {
		return Ordsum;
	}
	public void setOrdsum(Double ordsum) {
		Ordsum = ordsum;
	}
	public int getOrdadid() {
		return Ordadid;
	}
	public void setOrdadid(int ordadid) {
		Ordadid = ordadid;
	}
	
}
