package vo;

public class OrderPageInfo {
	// �ֹ� ���� ��Ͽ��� ����¡�� ���� �ʿ��� �����͵��� ������ Ŭ����(���� & ����Ʈ ����)
		private int cpage, pcnt, spage, epage, rcnt, psize, bsize;
		// ���� ��������ȣ, ��������, ����������, ����������, �Խñۼ�, ������ũ��, ���ũ��
		private String keyword, bcata, scata, sprice, eprice;
		// ����Ʈ�� ���ο��� ���������� ����� �˻����� ������ ������ ������
		private String isview, sdate, edate, stock, schtype;
		// ���ο����� ����� �˻����� ������ ������ ������
		private String ord;	// ��������
		
		private String oistatus;
		
	
		public String getOistatus() {
			return oistatus;
		}
		public void setOistatus(String oistatus) {
			this.oistatus = oistatus;
		}
		public int getCpage() {
			return cpage;
		}
		public void setCpage(int cpage) {
			this.cpage = cpage;
		}
		public int getPcnt() {
			return pcnt;
		}
		public void setPcnt(int pcnt) {
			this.pcnt = pcnt;
		}
		public int getSpage() {
			return spage;
		}
		public void setSpage(int spage) {
			this.spage = spage;
		}
		public int getEpage() {
			return epage;
		}
		public void setEpage(int epage) {
			this.epage = epage;
		}
		public int getRcnt() {
			return rcnt;
		}
		public void setRcnt(int rcnt) {
			this.rcnt = rcnt;
		}
		public int getPsize() {
			return psize;
		}
		public void setPsize(int psize) {
			this.psize = psize;
		}
		public int getBsize() {
			return bsize;
		}
		public void setBsize(int bsize) {
			this.bsize = bsize;
		}
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		public String getBcata() {
			return bcata;
		}
		public void setBcata(String bcata) {
			this.bcata = bcata;
		}
		public String getScata() {
			return scata;
		}
		public void setScata(String scata) {
			this.scata = scata;
		}
		public String getSprice() {
			return sprice;
		}
		public void setSprice(String sprice) {
			this.sprice = sprice;
		}
		public String getEprice() {
			return eprice;
		}
		public void setEprice(String eprice) {
			this.eprice = eprice;
		}
		public String getIsview() {
			return isview;
		}
		public void setIsview(String isview) {
			this.isview = isview;
		}
		public String getSdate() {
			return sdate;
		}
		public void setSdate(String sdate) {
			this.sdate = sdate;
		}
		public String getEdate() {
			return edate;
		}
		public void setEdate(String edate) {
			this.edate = edate;
		}
		public String getStock() {
			return stock;
		}
		public void setStock(String stock) {
			this.stock = stock;
		}
		public String getSchtype() {
			return schtype;
		}
		public void setSchtype(String schtype) {
			this.schtype = schtype;
		}
		public String getOrd() {
			return ord;
		}
		public void setOrd(String ord) {
			this.ord = ord;
		}
		
		
}
