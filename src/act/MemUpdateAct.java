package act;

import javax.servlet.http.*;
import vo.*;

public class MemUpdateAct implements Action {
	// ȸ�� ���� ���� ���� url�� �����ִ� Ŭ����
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ActionForward forward = new ActionForward();
			forward.setPath("/member/my_info_form.jsp");

			return forward;
		}
	}
