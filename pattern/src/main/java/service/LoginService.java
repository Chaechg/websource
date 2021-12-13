package service;

import java.sql.Connection;

import domain.MemberDTO;
import persistance.MemberDAO;

import static persistance.JdbcUtil.*;

public class LoginService {
	public MemberDTO loginService(String userid, String password) {
		//db 작업 => 비즈니스 로직(모델)
		Connection con = getConnection();
		MemberDAO dao = new MemberDAO(con);
		
		MemberDTO loginDto = dao.login(new MemberDTO(userid, password));
			
		return loginDto;
	}
}
