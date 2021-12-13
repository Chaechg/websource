package book.action;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class BookActionForward {
	//ActionForward는 경로와 이동방법을 담고있다.
	private String path;
	private boolean redirct;
}
