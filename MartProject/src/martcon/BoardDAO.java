package martcon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

public class BoardDAO {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//게시글 정보 가져오기
	public BoardDTO readDB(int bno) {
		BoardDTO board = new BoardDTO();
		
		String sql = "select * from tbl_board where bno =?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bno);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				board.setBno(rs.getInt("bno"));						//번호
				board.setTitle(rs.getString("title"));				//제목
				board.setContent(rs.getString("content"));			//내용
				board.setWriter(rs.getString("writer"));			//작성자
				board.setRegdate(rs.getDate("regdate"));			//저장일자
				board.setUpdatedate(rs.getDate("updatedate"));		//수정일자
			}
		}catch (Exception e) {
			System.out.println("ID read 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
		return board;
	}
	
	// 게시판 전체 목록 가져오기
	
	public List<BoardDTO> readDBList(int pageNo, int pageLine,
			String cond, String ctext){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		int end = pageNo * pageLine;
		int start = end - pageLine + 1;
		
		String whereCondition = "";
		if(cond != null & ctext != "") {
			whereCondition = "where " + cond + " like '%" + ctext + "%'";
		}
		
		String sql = "select b.* from "
	            + "(select rownum rn, a.* from "
	            + "(select * from tbl_board " + whereCondition
	            + " order by bno desc)a "
	            + ")b"
	            + " where b.rn between " + start + " and " + end;
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setBno(rs.getInt("bno"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setRegdate(rs.getDate("regdate"));
				board.setUpdatedate(rs.getDate("updatedate"));
				list.add(board);
			}
		}catch(Exception e) {
			System.out.println("record 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	
	// totlacnt 구하기
	
	public int totalCnt() {
		int cnt = 0;
		
		String sql = "select count(bno) from tbl_board";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("totalCnt 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
		return cnt;
	}
	
	//maxCnt 구하기
	
	public int maxCnt() {
		int cnt = 0;
		
		String sql = "select max(bno) from tbl_board";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("maxCnt 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
		return cnt;
	}
	
	//게시글 삽입하기
	
	public int insertDB(BoardDTO board) {
		int result = -1;
		
		String sql = "insert into TBL_BOARD (bno, title, content, writer)"
				+ " values(?, ?, ?, ?)";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, board.getBno());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContent());
			ps.setString(4, board.getWriter());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertDB 오류");
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	
	// 게시글 삭제하기
	
	public int deleteDB(int bno) {
		int result = -1;
		
		String sql = "delete TBL_BOARD where bno=?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bno);
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteDB 오류");
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	
	//update
	
	public int updateDB(BoardDTO board) {
		int result = -1;
		
		String sql = "update TBL_BOARD set title=?, content=?,"
				+ " updatedate=sysdate where bno=?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getTitle());
			ps.setString(2, board.getContent());
			ps.setInt(3, board.getBno());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateDB 오류");
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
}