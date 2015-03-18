package myfoodmap.lpw;

public class RSBeen 
{
	private String rsid;
	private String rName;
	private String rAdd;
	private String rTel;
	private String rRuntime;
	private String rMeautime;
	private String rWeb;
	private String rInfo;
	private String rRank_a;
	private String rRank_n;
	
	public RSBeen(String ... rs)
	{
		setRsid(rs[0]);
		setrName(rs[1]);
		
	}

	public String getRsid() 
	{
		return rsid;
	}
	public void setRsid(String rsid) 
	{
		this.rsid = rsid;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrAdd() {
		return rAdd;
	}

	public void setrAdd(String rAdd) {
		this.rAdd = rAdd;
	}

	public String getrTel() {
		return rTel;
	}

	public void setrTel(String rTel) {
		this.rTel = rTel;
	}

	public String getrRuntime() {
		return rRuntime;
	}

	public void setrRuntime(String rRuntime) {
		this.rRuntime = rRuntime;
	}

	public String getrMeautime() {
		return rMeautime;
	}

	public void setrMeautime(String rMeautime) {
		this.rMeautime = rMeautime;
	}

	public String getrWeb() {
		return rWeb;
	}

	public void setrWeb(String rWeb) {
		this.rWeb = rWeb;
	}

	public String getrInfo() {
		return rInfo;
	}

	public void setrInfo(String rInfo) {
		this.rInfo = rInfo;
	}

	public String getrRank_a() {
		return rRank_a;
	}

	public void setrRank_a(String rRank_a) {
		this.rRank_a = rRank_a;
	}

	public String getrRank_n() {
		return rRank_n;
	}

	public void setrRank_n(String rRank_n) {
		this.rRank_n = rRank_n;
	}
	
	

	
	
	
}
