package member.action;

import javax.servlet.http.HttpServletRequest;

import lombok.AllArgsConstructor;
import member.service.DuplicationService;

@AllArgsConstructor
public class DuplicationAction implements Action {
	
	private String path;

	@Override
	public ActionForward execute(HttpServletRequest request) throws Exception {
		// 중복검사할 아이디 가져오기
		String userid = request.getParameter("userid");
		
		// 서비스 작업 요청
		DuplicationService service = new DuplicationService();
		boolean dupFlag = service.dupId(userid);
		
		request.setAttribute("dupId", dupFlag); //dupId는 true 또는 false일 수 있다.
		
		return new ActionForward(path, false); //request.setAttribute가 들어오면 무조건 false
	}

}
