package persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import domain.MemberDTO;

//클래스 안의 메소드가 static으로만 구성되어 있다면
//
import static persistance.JdbcUtil.*;

@AllArgsConstructor
public class MemberDAO {

	private Connection con;

	public MemberDTO login(MemberDTO dto) {
		MemberDTO dto1 = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select userid, name from member where userid=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPassword());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto1 = new MemberDTO();
				dto1.setUserid(rs.getString("userid"));
				dto1.setName(rs.getString("name"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return dto1;
	}

}