package spittr.web;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

public class Test {

    public static void main(String[] args) throws JSONException {

        String string = "{"+"username" +":"+"testre,"+"password"+":password" +"}";
        JSONObject jsonObject = new JSONObject(string);
        System.out.println(jsonObject);

        try {
            URL url = new URL("http://localhost:2222/pizza-shefu/api/v1.0/customers/login/");
            URLConnection connection = url.openConnection();
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream());
            out.write(jsonObject.toString());
            out.close();

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String ttt = null;
            String bld = null;

            while ( (ttt=in.readLine()) != null) {
                bld += ttt;
            }

            System.out.println(bld);
//            System.out.println("\nCrunchify REST Service Invoked Successfully..");
            in.close();
        } catch (Exception e) {
            System.out.println("\nError while calling Crunchify REST Service");
            System.out.println(e);
        }
    }


}
