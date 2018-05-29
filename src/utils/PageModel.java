package utils;

import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class PageModel<T> {

	private int pageSize;// 每页记录数
	private int pageNo;// 当前页号
	private int totalrecords;// 记录数目
	private ArrayList<T> list;// 结果集

	public PageModel(int pageSize, int pageNo, int totalrecords, ArrayList<T> list) {
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalrecords = totalrecords;
		this.list = list;
	}

	/**
	 * 返回总页数
	 * 
	 * @return
	 */
	public int getTotalPages() {
		return (totalrecords + pageSize - 1) / pageSize;
	}

	/**
	 * 返回第一页
	 * 
	 * @return
	 */
	public int getTopPageNo() {
		return 1;
	}

	/**
	 * 返回上一页
	 * 
	 * @return
	 */
	public int getPrePageNO() {
		if (pageNo <= 1)
			return 1;
		return pageNo - 1;
	}

	/**
	 * 返回下一页
	 * 
	 * @return
	 */
	public int getNextPageNO() {
		if (pageNo >= getTotalPages())
			return getTotalPages();
		return pageNo + 1;
	}

	/**
	 * 返回最后一页
	 * 
	 * @return
	 */
	public int getBottomPageNO() {
		return getTotalPages();
	}

	/**
	 * 返回总记录数
	 * 
	 * @return
	 */
	public int getTotalrecords() {
		return totalrecords;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public ArrayList<T> getList() {
		return list;
	}

	public void setList(ArrayList<T> list) {
		this.list = list;
	}

	public void setTotalrecords(int totalrecords) {
		this.totalrecords = totalrecords;
	}
}
