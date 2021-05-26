package martcon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public boolean idcheck(String Mshp_id) {
		String sql = "select Mshp_pw from TR_BUYER where Mshp_id = '" + Mshp_id + "'";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next())
				return true;
			else
				return false;
		}
		catch(Exception e) {
			System.out.println("아이디 read 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return false;
	}
	
	public void insertDB(TR_BUYER buyer) {
		String sql = "INSERT INTO TR_BUYER"
				+ " (Mshp_name, Mshp_id, Mshp_pw, Mshp_tel, Mshp_gender)"
				+ " values (?, ?, ?, ?, ?)";
		try {
			con = DBCon.getCon();
			//insert 문을 이용하여 데이터를 추가 시킨다.
			ps = con.prepareStatement(sql);
			ps.setString(1,  buyer.getMshp_name());
			ps.setString(2,  buyer.getMshp_id());
			ps.setString(3,  buyer.getMshp_pw());
			ps.setString(4,  buyer.getMshp_tel());
			ps.setInt(5,  Integer.parseInt(buyer.getMshp_gender()));
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("user insert 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	//개별 정보 검색
	public TR_BUYER readDB(String Mshp_id) {
		TR_BUYER buyer = new TR_BUYER();
		
		String sql = "select * from TR_BUYER where Mshp_id = '" + Mshp_id + "'";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				buyer.setMshp_name(rs.getString("Mshp_name"));
				buyer.setMshp_id(rs.getString("Mshp_id"));
				buyer.setMshp_pw(rs.getString("Mshp_pw"));
				buyer.setMshp_tel(rs.getString("Mshp_tel"));
				buyer.setMshp_gender(rs.getString("Mshp_gender"));
			}
		}
		catch(Exception e) {
			System.out.println("TR_BUYER 읽기 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return buyer;
	}
	
	//전체 레코드 검색
	public List<TR_BUYER> readAllDB() {
		ArrayList<TR_BUYER> list = new ArrayList<TR_BUYER>();
		
		String sql = "select * from TR_BUYER";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TR_BUYER buyer = new TR_BUYER();
				buyer.setMshp_name(rs.getString("Mshp_name"));
				buyer.setMshp_id(rs.getString("Mshp_id"));
				buyer.setMshp_pw(rs.getString("Mshp_pw"));
				buyer.setMshp_tel(rs.getString("Mshp_tel"));
				buyer.setMshp_gender(rs.getString("Mshp_gender"));
				list.add(buyer);
			}
		}
		catch(Exception e) {
			System.out.println("전체 목록 읽기 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	
	public void dbUpdate(TR_BUYER buyer) {
		
		String sql = "UPDATE userInfo"
				+ " SET name = ?, tel = ?, job = ?"
				+ " WHERE id = ? ";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, buyer.getMshp_name());
			ps.setString(2, buyer.getMshp_tel());
			ps.setString(3, buyer.getMshp_id());
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("record 수정 오류");
		}finally {
			DBCon.close(con, ps, null);
		}
	}
	
	public void deleteDB(String Mshp_id) {
		String sql = "delete userInfo where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, Mshp_id);
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("record 삭제 오류");
		}
		finally {
			DBCon.close(con, ps, null);
		}
	}
}