package member.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class MemberDTO {
	private String userid;
	private String password;
	private String changePassword;
	private String name;
	private String gender;
	private String email;
	//인자를 2개 받는 생성자가 필요해 새로 생성
	public MemberDTO(String userid, String password) {
		this.userid = userid;
		this.password = password;
	}
}
