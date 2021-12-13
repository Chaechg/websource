package book.action;

import javax.servlet.http.HttpServletRequest;

import book.service.BookDeleteService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class BookDeleteAction implements BookAction {
	
	private String path;
	
	@Override
	public BookActionForward execute(HttpServletRequest request) throws Exception {
		//delete.jsp에서 넘긴 값 가져오기
		String code = request.getParameter("code");
		
		//db작업
		BookDeleteService service = new BookDeleteService();
		boolean deleteFlag = service.bookDelete(code);
		
		if (!deleteFlag) {
			path = "/index.jsp?tab=delete";
		}
		return new BookActionForward(path, true);
	}

}
