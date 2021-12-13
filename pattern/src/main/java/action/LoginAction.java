package action;
//저는 패키지명을 잡을때 처음부터 패턴.액션으로 잡은 상태라 그렇게 한거고
//철기님은 지금 액션으로만 잡았기 때문에 그냥 이렇게 하셔야 해요
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.MemberDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import service.LoginService;

@AllArgsConstructor
@Getter
public class LoginAction implements Action {
	
	private String path; //index.jsp

	@Override
	public ActionForward execute(HttpServletRequest request) throws Exception {
		//사용자가 넘기는 값 가져오기
//		String no = request.getParameter("no");
//		System.out.println("no "+no);
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		//서비스 작업
		LoginService service = new LoginService();
		MemberDTO loginDto = service.loginService(userid, password);
		
		//결과에 따라 ActionFoward 객체 생성
		if (loginDto == null) { //로그인 실패
			path = "/view/login.jsp"; //로그인 폼 보여주기
		}else { // 로그인 성공 => 세션에 값 담기
			HttpSession session = request.getSession();
			session.setAttribute("loginDto", loginDto);
		}
		//로그인 실패 new ActionForward("/view/login.jsp",true)
		//로그인 성공 new ActionForward("/index.jsp",true)
		
		return new ActionForward(path, true);
	}

}
