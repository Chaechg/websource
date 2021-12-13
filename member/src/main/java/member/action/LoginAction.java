package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.AllArgsConstructor;
import member.domain.MemberDTO;
import member.service.LoginService;

@AllArgsConstructor
public class LoginAction implements Action {
	
	private String path;

	@Override
	public ActionForward execute(HttpServletRequest request) throws Exception {
		// 사용자의 입력값 가져오기
		String userid = request.getParameter("userid");
		String password = request.getParameter("current_password");
		
		//db 작업 부탁 => service
		LoginService service = new LoginService();
		MemberDTO loginDto = service.loginService(userid,password); //사용자가 넘김 => 서비스가 받을 수 있게 한다.
		
		if (loginDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginDto", loginDto);	
		}
		
		return new ActionForward(path, true);
	}

}
