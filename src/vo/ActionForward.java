package vo;

public class ActionForward {
// ��û�� ó���� �� �� �������� �̵��� �� �̵��ϴ� ���(����ġ�� �����̷�Ʈ)�� ������ �ִ� Ŭ����
	private String path;		// �̵��� ���������� url�� ������ ����
	private boolean redirect;	// �̵� ���(true : �����̷�Ʈ, false : ����ġ)�� ������ ����
	// boolean�����̹Ƿ� ���� �������� ������ �⺻������ false�� ��
	public ActionForward() {}
	public ActionForward(String path, boolean redirect) {
		this.path = path;
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
}
