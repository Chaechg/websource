package action;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//라이브러리를 이제 빌드 패스에 추가하시면 안되요 메이븐을 쓰겠다고 했기 때문에
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class ActionForward {
	//이동경로와 이동방식 저장
	private String path;
	private boolean redirect;
}
















