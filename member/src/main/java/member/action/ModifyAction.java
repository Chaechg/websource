package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.AllArgsConstructor;
import member.domain.MemberDTO;
import member.domain.UpdateDTO;
import member.service.ModifyService;

@AllArgsConstructor
public class ModifyAction implements Action {
		
	private String path; //view/loginForm.jsp
	
	@Override
	public ActionForward execute(HttpServletRequest request) throws Exception {
		//userid 가져오기 - 세션에서 가져오기
		HttpSession session = request.getSession();
		MemberDTO loginDto =(MemberDTO)session.getAttribute("loginDto");
		String userid = loginDto.getUserid();
		
		// modifyFrom.jsp에서 사용자 입력값 가져오기
		String current_password = request.getParameter("current_password");
		String new_password = request.getParameter("new_password");
		String confirm_password = request.getParameter("confirm_password");
		UpdateDTO updateDdo = new UpdateDTO(userid, current_password, new_password, confirm_password);
		
		if (updateDdo.passwordEqualto(new_password)) {
			//db 작업
			ModifyService service = new ModifyService();
			boolean updateFlag = service.modify(updateDdo);
			//성공 : commit, 현재 세션 해제, 로그인 페이지로 이동
			if (updateFlag) {
				session.invalidate();
				//path = "/view/loginForm.jsp";
				//path과 위의 페이지를 이미 담고 있으므로 생략
			}else {
				//실패 : rollback, 비밀번호 변경 페이지로 이동
				path = "/view/modifyForm.jsp";
			}
		}else {
			//비밀번호 변경 페이지로 이동
			path = "/view/modifyForm.jsp";
		}
		return new ActionForward(path, true);
	}

}
