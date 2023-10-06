package com.kopo.finalhanaonepayproject.OCR;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class ClovaOCRTemplate {

    private static final String API_URL = "https://kuuwmbjc3d.apigw.ntruss.com/custom/v1/25375/5c4b3a2d74cb728a86cebb05a8785b2fd4a7eaa29bc0ef2281ad0435c2ee14c1/infer";
    private static final String SECRET_KEY = "TXhSaktwRkNFZVhLbE9mS0Fsdm1FeERGa1VQeVdBQ3Y=";

    public static Map<String, String> extractText(String imageFile) {
        Map<String, String> result = new HashMap<>();

        try {
            URL url = new URL(API_URL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setUseCaches(false);
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setReadTimeout(30000);
            con.setRequestMethod("POST");
            String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-OCR-SECRET", SECRET_KEY);

            JSONObject json = new JSONObject();
            json.put("version", "V2");
            json.put("requestId", UUID.randomUUID().toString());
            json.put("timestamp", System.currentTimeMillis());

            JSONObject image = new JSONObject();
            image.put("format", "png");
            image.put("name", "demo");
            JSONArray templateIds = new JSONArray();
            templateIds.put(26592);
            image.put("templateIds", templateIds);

            JSONArray images = new JSONArray();
            images.put(image);
            json.put("images", images);
            String postParams = json.toString();

            con.connect();
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            File file = new File(imageFile);
            writeMultiPart(wr, postParams, file, boundary);
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();

            result = processResponse(response.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws IOException {
        PrintWriter writer = new PrintWriter(new OutputStreamWriter(out, "UTF-8"), true);

        // Send normal param.
        writer.append("--" + boundary).append("\r\n");
        writer.append("Content-Disposition: form-data; name=\"message\"").append("\r\n");
        writer.append("Content-Type: text/plain; charset=UTF-8").append("\r\n");
        writer.append("\r\n");
        writer.append(jsonMessage).append("\r\n");
        writer.flush();

        // Send binary file.
        writer.append("--" + boundary).append("\r\n");
        writer.append("Content-Disposition: form-data; name=\"file\"; filename=\"" + file.getName() + "\"").append("\r\n");
        writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(file.getName())).append("\r\n");
        writer.append("Content-Transfer-Encoding: binary").append("\r\n");
        writer.append("\r\n");
        writer.flush();

        InputStream input = null;
        try {
            input = new FileInputStream(file);
            byte[] buffer = new byte[4096];
            for (int length = 0; (length = input.read(buffer)) > 0;) {
                out.write(buffer, 0, length);
            }
            out.flush(); // Important before continuing with writer!
            writer.append("\r\n");
            writer.flush();
        } finally {
            if (input != null) try { input.close(); } catch (IOException logOrIgnore) {}
        }

        // End of multipart/form-data.
        writer.append("--" + boundary + "--").append("\r\n");
        writer.flush();
    }


    private static Map<String, String> processResponse(String response) {
        System.out.println("Response: " + response);
        Map<String, String> extractedData = new HashMap<>();
        try {
            JSONObject jsonResponse = new JSONObject(response);
            JSONArray images = jsonResponse.getJSONArray("images");
            JSONObject firstImage = images.getJSONObject(0);
            JSONArray fields = firstImage.getJSONArray("fields");

            for (int i = 0; i < fields.length(); i++) {
                JSONObject field = fields.getJSONObject(i);
                String name = field.getString("name");
                if (name.equals("cardNumber") || name.equals("cardCode") || name.equals("userName")
                        || name.equals("validityPeriod")) {
                    String inferText = field.getString("inferText");
                    extractedData.put(name, inferText);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return extractedData;
    }


}
