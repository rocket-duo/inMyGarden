package act;

import javax.servlet.http.*;
import vo.*;


public interface Action {
// ���� ��û�� ó���� �� �̵��� �� ������ Ÿ������ �̵��ǰ� �ϱ� ���� �������̽�
	ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// �� ��û�� ó���ϴ� ActionŬ�������� ���������� �����ؾ� �ϴ� �޼ҵ�μ� ����� �޼ҵ�
}
