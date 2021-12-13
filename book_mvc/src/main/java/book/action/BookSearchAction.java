package book.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import book.domain.BookDTO;
import book.service.BookSearchService;
import lombok.AllArgsConstructor;
@AllArgsConstructor
public class BookSearchAction implements BookAction {
	
	private String path;

	@Override
	public BookActionForward execute(HttpServletRequest request) throws Exception {
		//search.jsp에서 가져오기
		String criteria = request.getParameter("criteria");
		String keyword = request.getParameter("keyword");
		
		//db작업 - 서비스
		BookSearchService service = new BookSearchService();
		List<BookDTO> searchList = service.search(criteria, keyword);
		
		request.setAttribute("list", searchList);
		
		return new BookActionForward(path, false);
		//request하면 false이다.
		}

}
