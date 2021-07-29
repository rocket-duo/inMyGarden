package vo;

public class OrderInfo {
	String oi_id, mi_id, oi_name, oi_phone, oi_email, oi_receiver, oi_recphone;
	String oi_zip, oi_addr1, oi_addr2, oi_payment, oi_status, oi_cmt, oi_invoice, oi_date, oi_modify;
	int oi_pay, oi_usepnt, oi_delipay, oi_totalpay, ai_idx;
	// 주문정보 관련
	
	String pi_id, od_pdtname, od_pdtimg, od_option;
	int od_idx, od_pdtprice, od_cnt, od_savepnt;
	// 주문 상세정보 관련
	
	
	
	public String getOi_email() {
		return oi_email;
	}
	public int getOi_totalpay() {
		return oi_totalpay;
	}
	public void setOi_totalpay(int oi_totalpay) {
		this.oi_totalpay = oi_totalpay;
	}
	public void setOi_email(String oi_email) {
		this.oi_email = oi_email;
	}
	public String getOi_receiver() {
		return oi_receiver;
	}
	public void setOi_receiver(String oi_receiver) {
		this.oi_receiver = oi_receiver;
	}
	public String getOi_recphone() {
		return oi_recphone;
	}
	public void setOi_recphone(String oi_recphone) {
		this.oi_recphone = oi_recphone;
	}



	
	public String getOi_id() {
		return oi_id;
	}
	public void setOi_id(String oi_id) {
		this.oi_id = oi_id;
	}
	public String getMi_id() {
		return mi_id;
	}
	public void setMi_id(String mi_id) {
		this.mi_id = mi_id;
	}
	public String getOi_name() {
		return oi_name;
	}
	public void setOi_name(String oi_name) {
		this.oi_name = oi_name;
	}
	public String getOi_phone() {
		return oi_phone;
	}
	public void setOi_phone(String oi_phone) {
		this.oi_phone = oi_phone;
	}
	public String getOi_zip() {
		return oi_zip;
	}
	public void setOi_zip(String oi_zip) {
		this.oi_zip = oi_zip;
	}
	public String getOi_addr1() {
		return oi_addr1;
	}
	public void setOi_addr1(String oi_addr1) {
		this.oi_addr1 = oi_addr1;
	}
	public String getOi_addr2() {
		return oi_addr2;
	}
	public void setOi_addr2(String oi_addr2) {
		this.oi_addr2 = oi_addr2;
	}
	public String getOi_payment() {
		return oi_payment;
	}
	public void setOi_payment(String oi_payment) {
		this.oi_payment = oi_payment;
	}
	public String getOi_status() {
		return oi_status;
	}
	public void setOi_status(String od_status) {
		this.oi_status = od_status;
	}
	public String getOi_cmt() {
		return oi_cmt;
	}
	public void setOi_cmt(String oi_cmt) {
		this.oi_cmt = oi_cmt;
	}
	public String getOi_invoice() {
		return oi_invoice;
	}
	public void setOi_invoice(String oi_invoice) {
		this.oi_invoice = oi_invoice;
	}
	public String getOi_date() {
		return oi_date;
	}
	public void setOi_date(String oi_date) {
		this.oi_date = oi_date;
	}
	public String getOi_modify() {
		return oi_modify;
	}
	public void setOi_modify(String oi_modify) {
		this.oi_modify = oi_modify;
	}
	public int getOi_pay() {
		return oi_pay;
	}
	public void setOi_pay(int oi_pay) {
		this.oi_pay = oi_pay;
	}
	public int getOi_usepnt() {
		return oi_usepnt;
	}
	public void setOi_usepnt(int oi_usepnt) {
		this.oi_usepnt = oi_usepnt;
	}
	public int getOi_delipay() {
		return oi_delipay;
	}
	public void setOi_delipay(int oi_delipay) {
		this.oi_delipay = oi_delipay;
	}
	public int getAi_idx() {
		return ai_idx;
	}
	public void setAi_idx(int ai_idx) {
		this.ai_idx = ai_idx;
	}
	public String getPi_id() {
		return pi_id;
	}
	public void setPi_id(String pi_id) {
		this.pi_id = pi_id;
	}
	public String getOd_pdtname() {
		return od_pdtname;
	}
	public void setOd_pdtname(String od_pdtname) {
		this.od_pdtname = od_pdtname;
	}
	public String getOd_pdtimg() {
		return od_pdtimg;
	}
	public void setOd_pdtimg(String od_pdtimg) {
		this.od_pdtimg = od_pdtimg;
	}
	public String getOd_option() {
		return od_option;
	}
	public void setOd_option(String od_option) {
		this.od_option = od_option;
	}
	public int getOd_idx() {
		return od_idx;
	}
	public void setOd_idx(int od_idx) {
		this.od_idx = od_idx;
	}
	public int getOd_pdtprice() {
		return od_pdtprice;
	}
	public void setOd_pdtprice(int od_pdtprice) {
		this.od_pdtprice = od_pdtprice;
	}
	public int getOd_cnt() {
		return od_cnt;
	}
	public void setOd_cnt(int od_cnt) {
		this.od_cnt = od_cnt;
	}
	public int getOd_savepnt() {
		return od_savepnt;
	}
	public void setOd_savepnt(int od_savepnt) {
		this.od_savepnt = od_savepnt;
	}


}
