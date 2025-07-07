package dao;

import java.sql.*;
import java.util.*;
import dto.MemberDTO;

public class MemberDAO {
    private Connection conn;

    public MemberDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // JSTL에 맞춰 driver 수정
            conn = DriverManager.getConnection(
                "jdbc:mysql://192.168.111.101:3306/goodsdb", "goods", "goods1234"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int insertMember(MemberDTO member) {
        String sql = "INSERT INTO members (m_id, m_password, m_name, m_gender, m_birth, m_mail, m_phone, m_address, m_regist_day) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, member.getM_id());
            pstmt.setString(2, member.getM_password());
            pstmt.setString(3, member.getM_name());
            pstmt.setString(4, member.getM_gender());
            pstmt.setString(5, member.getM_birth());
            pstmt.setString(6, member.getM_mail());
            pstmt.setString(7, member.getM_phone());
            pstmt.setString(8, member.getM_address());
            pstmt.setDate(9, new java.sql.Date(member.getM_regist_day().getTime()));
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<MemberDTO> getAllMembers() {
        List<MemberDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM members";

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                MemberDTO m = new MemberDTO();
                m.setM_id(rs.getString("m_id"));
                m.setM_password(rs.getString("m_password"));
                m.setM_name(rs.getString("m_name"));
                m.setM_gender(rs.getString("m_gender"));
                m.setM_birth(rs.getString("m_birth"));
                m.setM_mail(rs.getString("m_mail"));
                m.setM_phone(rs.getString("m_phone"));
                m.setM_address(rs.getString("m_address"));
                m.setM_regist_day(rs.getDate("m_regist_day"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public MemberDTO getMemberById(String m_id) {
        String sql = "SELECT * FROM members WHERE m_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, m_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    MemberDTO m = new MemberDTO();
                    m.setM_id(rs.getString("m_id"));
                    m.setM_password(rs.getString("m_password"));
                    m.setM_name(rs.getString("m_name"));
                    m.setM_gender(rs.getString("m_gender"));
                    m.setM_birth(rs.getString("m_birth"));
                    m.setM_mail(rs.getString("m_mail"));
                    m.setM_phone(rs.getString("m_phone"));
                    m.setM_address(rs.getString("m_address"));
                    m.setM_regist_day(rs.getDate("m_regist_day"));
                    return m;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int updateMember(MemberDTO member) {
        String sql = "UPDATE members SET m_name=?, m_password=?, m_mail=?, m_phone=?, m_address=?, m_gender=?, m_birth=?, m_regist_day=? WHERE m_id=?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, member.getM_name());
            pstmt.setString(2, member.getM_password());
            pstmt.setString(3, member.getM_mail());
            pstmt.setString(4, member.getM_phone());
            pstmt.setString(5, member.getM_address());
            pstmt.setString(6, member.getM_gender());
            pstmt.setString(7, member.getM_birth());
            pstmt.setDate(8, new java.sql.Date(member.getM_regist_day().getTime()));
            pstmt.setString(9, member.getM_id());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int deleteMember(String m_id) {
        String sql = "DELETE FROM members WHERE m_id=?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, m_id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void close() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
