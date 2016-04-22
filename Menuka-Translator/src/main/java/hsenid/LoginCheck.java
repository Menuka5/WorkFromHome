package hsenid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginCheck {
    private static final Logger logger = LogManager.getLogger(LoginCheck.class);
    public Connection myConn;


    public LoginCheck(Connection DBConn) throws IOException, SQLException {
        this.myConn = DBConn;
        logger.info("LoginCheck, Connection stabilised!!");

    }

    public boolean checking(String uName, String pWord) throws SQLException, UnsupportedEncodingException, NoSuchAlgorithmException {

        logger.info("LoginCheck, Checking Login Credentials");
        logger.error("Error Test LoginCheck.java");
        ResultSet rs = null;

        String hashedPass = HashClass.SHA1(pWord);
        PreparedStatement pst = myConn.prepareStatement("select * from users where username=? and password=?");
        pst.setString(1, uName);
        pst.setString(2, hashedPass);
        rs = pst.executeQuery();

        return rs.next();
    }

}
