package utils;

import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class PageModel<T> {

	private int pageSize;// ÿҳ��¼��
	private int pageNo;// ��ǰҳ��
	private int totalrecords;// ��¼��Ŀ
	private ArrayList<T> list;// �����

	public PageModel(int pageSize, int pageNo, int totalrecords, ArrayList<T> list) {
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalrecords = totalrecords;
		this.list = list;
	}

	/**
	 * ������ҳ��
	 * 
	 * @return
	 */
	public int getTotalPages() {
		return (totalrecords + pageSize - 1) / pageSize;
	}

	/**
	 * ���ص�һҳ
	 * 
	 * @return
	 */
	public int getTopPageNo() {
		return 1;
	}

	/**
	 * ������һҳ
	 * 
	 * @return
	 */
	public int getPrePageNO() {
		if (pageNo <= 1)
			return 1;
		return pageNo - 1;
	}

	/**
	 * ������һҳ
	 * 
	 * @return
	 */
	public int getNextPageNO() {
		if (pageNo >= getTotalPages())
			return getTotalPages();
		return pageNo + 1;
	}

	/**
	 * �������һҳ
	 * 
	 * @return
	 */
	public int getBottomPageNO() {
		return getTotalPages();
	}

	/**
	 * �����ܼ�¼��
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
