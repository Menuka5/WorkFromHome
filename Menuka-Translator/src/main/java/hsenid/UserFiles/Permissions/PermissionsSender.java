package hsenid.UserFiles.Permissions;

import hsenid.DBConnector;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PermissionsSender extends HttpServlet{
    private final static Logger logger = LogManager.getLogger(PermissionsSender.class);
    Connection myConn=null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBConnector dbPool = (DBConnector) getServletContext().getAttribute("DBConnection");

        try {
            myConn = dbPool.getConn();
        } catch (SQLException e) {
            logger.error(e.getMessage());
        }
    }

    public String[] sendPermissions(String username){
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String quary= "SELECT permission FROM userdetails INNER JOIN group_permission ON userdetails.group_id = group_permission.group_id INNER JOIN permissions ON permissions.permission_id = group_permission.permission_id WHERE userdetails.username = ?";
        

        return new String[Integer.parseInt("s")];
    }


}
