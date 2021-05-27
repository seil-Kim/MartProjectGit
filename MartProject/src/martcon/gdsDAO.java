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
	
	public boolean cdcheck(String Gds_cd) {
		String sql = "select Gds_nm from TR_GDS where Gds_cd = '" + Gds_cd + "'";
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
			System.out.println("코드 read 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return false;
	}
		
	public void ingdsDB(TR_GDS gds) {
		String sql = "INSERT INTO TR_GDS"
				+ " (Gds_cd, Gds_nm, Sale_amt, Gds_cnt, Reg_dt)"
				+ " values (?, ?, ?, ?, ?)";
		try {
			con = DBCon.getCon();
			//insert 문을 이용하여 데이터를 추가 시킨다.
			ps = con.prepareStatement(sql);
			ps.setString(1,  gds.getGds_cd());
			ps.setString(2,  gds.getGds_nm());
			ps.setInt(3,  gds.getSale_amt());
			ps.setInt(4,  gds.getGds_cnt());
			ps.setString(5,  gds.getReg_dt());
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Gds insert 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	//개별 정보 검색
	public TR_GDS readgdsDB(String Gds_cd) {
		TR_GDS gds = new TR_GDS();
		
		String sql = "select * from TR_GDS where Gds_cd = '" + Gds_cd + "'";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				gds.setGds_cd(rs.getString("Gds_cd"));
				gds.setGds_nm(rs.getString("Gds_nm"));
				gds.setSale_amt(rs.getInt("Sale_amt"));
				gds.setGds_cnt(rs.getInt("Gds_cnt"));
				gds.setReg_dt(rs.getString("Reg_dt"));
			}
		}
		catch(Exception e) {
			System.out.println("TR_GDS 읽기 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return gds;
	}
	
	//전체 레코드 검색
	public List<TR_GDS> readAllDB() {
		ArrayList<TR_GDS> list = new ArrayList<TR_GDS>();
		
		String sql = "select * from TR_GDS";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TR_GDS gds = new TR_GDS();
				gds.setGds_cd(rs.getString("Gds_cd"));
				gds.setGds_nm(rs.getString("Gds_nm"));
				gds.setSale_amt(rs.getInt("Sale_amt"));
				gds.setGds_cnt(rs.getInt("Gds_cnt"));
				gds.setReg_dt(rs.getString("Reg_dt"));
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
	
public void dbUpdate(TR_GDS gds) {
		
		String sql = "UPDATE TR_GDS"
				+ " SET Gds_cd = ?, Gds_nm = ?, Sale_amt = ?, Gds_cnt = ?, Reg_dt = ?"
				+ " WHERE Gds_cd = ? ";

		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,  gds.getGds_cd());
			ps.setString(2,  gds.getGds_nm());
			ps.setInt(3, gds.getSale_amt());
			ps.setInt(4, gds.getGds_cnt());
			ps.setString(5,  gds.getReg_dt());
			ps.setString(6, gds.getGds_cd());
			ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("record 수정 오류");
		}finally {
			DBCon.close(con, ps, null);
		}
	}
	
	public void deleteDB(String Gds_cd) {
		String sql = "delete TR_GDS where Gds_cd = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, Gds_cd);
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