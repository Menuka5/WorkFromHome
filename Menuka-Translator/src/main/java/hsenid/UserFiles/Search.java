package hsenid.UserFiles;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import hsenid.DBConnector;

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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String username = req.getParameter("searchword");
        DBConnector dbpool = (DBConnector) getServletContext().getAttribute("DBConnection");
        JsonArray jsonArray = new JsonArray();

        try {
            Connection myConn = dbpool.getConn();
            String likeQuery = "Select * from userdetails WHERE username LIKE ?";
            preparedStatement = myConn.prepareStatement(likeQuery);
            preparedStatement.setString(1, "%" + username + "%");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("firstName", resultSet.getString("fname"));
                jsonObject.addProperty("lastName", resultSet.getString("lname"));
                jsonObject.addProperty("dob", resultSet.getString("dob"));
                jsonObject.addProperty("country", resultSet.getString("country"));
                jsonObject.addProperty("email", resultSet.getString("email"));
                jsonObject.addProperty("mobile", resultSet.getString("mnumber"));
                jsonObject.addProperty("username", resultSet.getString("username"));

                jsonArray.add(jsonObject);

            }
            out.println(jsonArray);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
