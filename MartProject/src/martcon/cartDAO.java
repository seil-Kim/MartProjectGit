package martcon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class cartDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public void insertDB(incart ic) {
		String sql = "INSERT INTO incart"
				+ " (Gds_nm, Sale_amt, Gds_buycnt)"
				+ " values (?, ?, ?)";
		try {
			con = DBCon.getCon();
			//insert 문을 이용하여 데이터를 추가 시킨다.
			ps = con.prepareStatement(sql);
			ps.setString(1,  ic.getGds_nm());
			ps.setInt(2,  ic.getSale_amt());
			ps.setInt(3,  ic.getGds_buycnt());
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("cart insert 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
	}
	public List<incart> readAllDB() {
		ArrayList<incart> list = new ArrayList<incart>();
		
		String sql = "select Gds_nm, Sale_amt, Gds_buycnt from incart";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				incart ic = new incart();
				ic.setGds_nm(rs.getString("Gds_nm"));
				ic.setSale_amt(rs.getInt("Sale_amt"));
				ic.setGds_buycnt(rs.getInt("Gds_buycnt"));
				list.add(ic);
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
}
