package aptos.utility;

import aptos.base.TestBase;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;

public class ApiHelper extends TestBase {
    public static String physicalReceiptData;

    public void roboticAction(String actionValue, String subActionValue, String positionValue, String pinValue, Integer stationValue) {
        //String apiUrl = "http://172.16.70.22:8500/robot-action";
        String apiUrl = "http://10.53.192.103:8500/barcode";
        HttpURLConnection connection = null;

        try {
            URL url = new URL(apiUrl);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            String jsonBody = String.format(
                    "{ \"action\":\"%s\",\"sub_action\": \"%s\", \"position\": \"%s\", \"pin\": \"%s\", \"station\": %d, \"auto\": true }",
                    actionValue, subActionValue, positionValue, pinValue, stationValue
            );

            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonBody.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();
            System.out.println("API Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // Read response if the call was successful
                try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                    StringBuilder response = new StringBuilder();
                    String inputLine;
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine.trim());
                    }
                    System.out.println("API Response: " + response);
                }
            } else {
                System.out.println("Failed API call. Response Code: " + responseCode);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    public void enterPin(String stationValue, String pinValue, String optionValue) {
        //string apiUrl = "http://172.16.70.22:8500/enter-pin";
        String apiUrl = "http://10.53.192.103:8500/enter-pin";
        HttpURLConnection connection = null;

        try {
            URL url = new URL(apiUrl);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            String jsonBody = String.format(
                    "{ \"station\": \"%s\", \"pin\": \"%s\", \"option\": \"%s\" }",
                    stationValue, pinValue, optionValue
            );

            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonBody.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();
            System.out.println("API Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // Read response if the call was successful
                try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                    StringBuilder response = new StringBuilder();
                    String inputLine;
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine.trim());
                    }
                    System.out.println("API Response: " + response);
                }
            } else {
                System.out.println("Failed API call. Response Code: " + responseCode);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    public static void displayBarcode(String actionValue, String code, String dataUPCA, Integer delay, Integer stationValue) {
        //String apiUrl = "http://172.16.70.22:8500/barcode";
        String apiUrl = "http://10.53.192.103:8500/barcode";
        String jsonBody = String.format(
                "{ \"action\":\"%s\", \"code\": \"%s\", \"data\": \"%s\", \"delay\": %d, \"station\": %d, \"auto\": true }",
                actionValue, code, dataUPCA, delay, stationValue
        );

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(apiUrl))
                .timeout(Duration.ofSeconds(10)) // Adjust timeout as necessary
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(jsonBody))
                .build();

        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("API Response Code: " + response.statusCode());
            System.out.println("API Response: " + response.body());

        } catch (Exception e) {
            System.err.println("Error during API call: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void captureBarcode(String transactionNumber) {
        //String apiUrl = "http://172.16.70.22:8500/capture-receipt-barcode";
        String apiUrl = "http://10.53.192.103:8500/capture-receipt-barcode";
        String jsonBody = String.format(
                "{ \"txn_no\":\"%s\"}", transactionNumber
        );

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(apiUrl))
                .timeout(Duration.ofSeconds(10)) // Adjust timeout as necessary
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(jsonBody))
                .build();

        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("API Response Code: " + response.statusCode());
            System.out.println("API Response: " + response.body());

        } catch (Exception e) {
            System.err.println("Error during API call: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static String getPhysicalReceiptData(String transactionNumber) {
        //String apiUrl = "http://172.16.70.22:8500/Capture_receipt";
        String apiUrl = "http://10.53.192.103:8500/Capture_receipt";
        String jsonBody = String.format(
                "{ \"transactionnumber\": \"%s\"}", transactionNumber
        );

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(apiUrl))
                .timeout(Duration.ofSeconds(10)) // Adjust timeout as necessary
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(jsonBody))
                .build();

        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("API Response Code: " + response.statusCode());
            System.out.println("API Response: " + response.body());
            physicalReceiptData = response.body();

        } catch (Exception e) {
            System.err.println("Error during API call: " + e.getMessage());
            e.printStackTrace();
        }
        return physicalReceiptData;
    }


}
