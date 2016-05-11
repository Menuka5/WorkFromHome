package hsenid.UserFiles;


import hsenid.DBConnector;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

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

public class Search extends HttpServlet {
    private static final Logger logger = LogManager.getLogger(Search.class);


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String username = req.getParameter("searchword");
        DBConnector dbpool = (DBConnector) getServletContext().getAttribute("DBConnection");
        JSONArray jsonArray = new JSONArray();
//        JsonArray jsonArray = new JsonArray();
        logger.info(username);
        try {
            Connection myConn = dbpool.getConn();
//            SELECT * FROM userdetails INNER JOIN group_name ON userdetails.group_id=group_name.group_id
            String likeQuery = "SELECT * FROM userdetails LEFT JOIN group_name ON userdetails.group_id=group_name.group_id WHERE username LIKE ?";
//            String groupQuery = "Select group_name from group_name WHERE group_id = ?";
            preparedStatement = myConn.prepareStatement(likeQuery);
            preparedStatement.setString(1, "%" + username + "%");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                JSONObject jsonObject = new JSONObject();
//                JsonObject jsonObject = new JsonObject();
                jsonObject.put("firstName", resultSet.getString("fname"));
                jsonObject.put("lastName", resultSet.getString("lname"));
                jsonObject.put("dob", resultSet.getString("dob"));
                jsonObject.put("country", resultSet.getString("country"));
                jsonObject.put("email", resultSet.getString("email"));
                jsonObject.put("mobile", resultSet.getString("mnumber"));
                jsonObject.put("username", resultSet.getString("username"));
                jsonObject.put("userRole", resultSet.getString("group_name"));

                jsonArray.put(jsonObject);

            }
            logger.info("JSON ARRAY Created");

            logger.info(jsonArray.toString());

//            resp.getWriter().write(jsonArray.toString());
            out.print(jsonArray);
            out.flush();

        } catch (SQLException e) {
            logger.error(e.getMessage());
        }

    }
}
