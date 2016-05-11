package hsenid.UserFiles;

import hsenid.DBConnector;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteUser extends HttpServlet{

    private static final Logger logger = LogManager.getLogger(DeleteUser.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PreparedStatement preparedStatement = null;
        String username = req.getParameter("delete");
        DBConnector dbpool = (DBConnector) getServletContext().getAttribute("DBConnection");
        logger.info(username);

        try {
            Connection myConn = dbpool.getConn();

            String deleteQuery = "DELETE FROM Customers WHERE username=?";
            preparedStatement = myConn.prepareStatement(deleteQuery);
            preparedStatement.setString(1, username);
            preparedStatement.executeQuery();

        } catch (SQLException e) {
            logger.error(e.getMessage());
        }
    }
}
