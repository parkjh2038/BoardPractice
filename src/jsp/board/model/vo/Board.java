package jsp.board.model.vo;

import java.sql.Date;

public class Board {
	private int bid;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private int bCount;
	private Date bDate;
	private Date modifyDate;
	private String status;
	
	public Board() {}

	public Board(int bid, String bTitle, String bContent, String bWriter, int bCount, Date bDate, Date modifyDate,
			String status) {
		super();
		this.bid = bid;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.bDate = bDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bCount=" + bCount + ", bDate=" + bDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}

}
