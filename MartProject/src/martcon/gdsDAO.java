package martcon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class gdsDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	
	
	//전체 레코드 검색
	public List<TR_GDS> readAllDB() {
		ArrayList<TR_GDS> list = new ArrayList<TR_GDS>();
		
		String sql = "select Gds_nm, Sale_amt, Gds_cnt from TR_GDS";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TR_GDS gds = new TR_GDS();
				gds.setGds_nm(rs.getString("Gds_nm"));
				gds.setSale_amt(rs.getInt("Sale_amt"));
				gds.setGds_cnt(rs.getInt("Gds_cnt"));
				list.add(gds);
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