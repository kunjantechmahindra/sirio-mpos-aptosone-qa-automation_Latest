package aptos.utility;

import aptos.base.TestBase;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class TestDataHelper extends TestBase {


    /**
     * @param brand
     * @param productType
     * @return Random Product UPC
     * @throws IOException
     * @throws ParseException
     */
    public String readRandomGenericUPSC(String brand, String productType) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/UPCATestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject UPCcode = (JSONObject) obj;

        // Accessing the products for the specified brand
        JSONObject brandObject = (JSONObject) UPCcode.get(brand);
        if (brandObject != null) {
            JSONArray products = (JSONArray) brandObject.get(productType);

            // Select a random product
            if (products != null && products.size() > 0) {
                Random random = new Random();
                int randomIndex = random.nextInt(products.size());
                return (String) products.get(randomIndex); // Return the random product
            } else {
                return null; // Return null if no products found
            }
        } else {
            System.out.println("Brand not found: " + brand);
            return null; // Return null if brand not found
        }
    }


    public static String getCustomerDetail(String brand, int index, String detailType) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/TransactionTestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject jsonData = (JSONObject) obj;

        // Accessing the specified brand
        JSONObject brandData = (JSONObject) jsonData.get(brand);
        if (brandData != null) {
            // Accessing the customers array
            JSONArray customers = (JSONArray) brandData.get("customers");
            if (customers != null && index >= 0 && index < customers.size()) {
                JSONObject customer = (JSONObject) customers.get(index);
                // Return the requested detail
                return (String) customer.get(detailType); // detailType can be "FirstName", "LastName", "Phone", or "email"
            } else {
                System.out.println("Invalid index or no customers found.");
            }
        } else {
            System.out.println("Brand not found: " + brand);
        }
        return null; // Return null if brand or index is invalid
    }

    public void updateCustomerDetail(String brand, int index, String detailType, String newValue) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        File jsonFile = new File("src/main/java/aptos/testData/TransactionTestData.json");

        try (FileReader reader = new FileReader(jsonFile)) {
            Object obj = jsonParser.parse(reader);
            JSONObject jsonData = (JSONObject) obj;

            // Accessing the specified brand
            JSONObject brandData = (JSONObject) jsonData.get(brand);
            if (brandData != null) {
                // Accessing the customers array
                JSONArray customers = (JSONArray) brandData.get("customers");
                if (customers != null && index >= 0 && index < customers.size()) {
                    JSONObject customer = (JSONObject) customers.get(index);
                    // Update the requested detail
                    customer.put(detailType, newValue);

                    // Write the updated JSON back to the file
                    try (FileWriter writer = new FileWriter(jsonFile)) {
                        writer.write(jsonData.toJSONString());
                    }
                } else {
                    throw new IndexOutOfBoundsException("Invalid index: " + index + " or no customers found.");
                }
            } else {
                throw new IllegalArgumentException("Brand not found: " + brand);
            }
        }
    }


    public static String getGiftCardDetail(String brand, int index, String detailType) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/TransactionTestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject jsonData = (JSONObject) obj;

        // Accessing the specified brand
        JSONObject brandData = (JSONObject) jsonData.get(brand);
        if (brandData != null) {
            // Accessing the customers array
            JSONArray giftCardCollection = (JSONArray) brandData.get("giftCard");

            if (giftCardCollection != null && index >= 0 && index < giftCardCollection.size()) {
                JSONObject giftCard = (JSONObject) giftCardCollection.get(index);
                // Return the requested detail
                return (String) giftCard.get(detailType); // detailType can be "CardNumber", "Pin"
            } else {
                System.out.println("Invalid index or no gift card found.");
            }
        } else {
            System.out.println("Brand not found: " + brand);
        }
        return null; // Return null if brand or index is invalid
    }


    public static String generatePhoneNumber() {
        Random random = new Random();
        // Generate a random number between 10000000 and 99999999
        int randomNumber = 10000000 + random.nextInt(90000000);
        // Convert the number to a string
        String randomString = String.valueOf(randomNumber);
        return "99" + randomString;
    }

    public static String generateZipCode() {
        if (properties.getProperty("Region").equals("CA")) {
            Random random = new Random();
            StringBuilder postalCode = new StringBuilder();
            char firstLetter = (char) ('A' + random.nextInt(26)); // Random letter A-Z
            int firstDigit = random.nextInt(10); // Random digit 0-9
            char secondLetter = (char) ('A' + random.nextInt(26)); // Random letter A-Z

            postalCode.append(firstLetter).append(firstDigit).append(secondLetter);

            int secondDigit = random.nextInt(10); // Random digit 0-9
            char thirdLetter = (char) ('A' + random.nextInt(26)); // Random letter A-Z
            int thirdDigit = random.nextInt(10); // Random digit 0-9

            postalCode.append(secondDigit).append(thirdLetter).append(thirdDigit);

            return postalCode.toString();
        } else {
            Random random = new Random();
            int randomNumber = 10000 + random.nextInt(1000);
            return String.valueOf(randomNumber);
        }
    }


    public static String generateReferenceTD() {
        Random random = new Random();
        int randomNumber = 100000 + random.nextInt(10000);
        // Convert the number to a string
        String randomString = String.valueOf(randomNumber);
        return randomString;
    }

    public static String getCouponCode(String brand, String couponName) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/TransactionTestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject jsonData = (JSONObject) obj;

        // Accessing the specified brand
        JSONObject brandData = (JSONObject) jsonData.get(brand);
        if (brandData != null) {
            // Accessing the coupons array
            JSONArray coupons = (JSONArray) brandData.get("coupons");
            if (coupons != null) {
                // Iterate over each coupon object in the array
                for (Object coupon : coupons) {
                    JSONObject couponObject = (JSONObject) coupon;
                    // Check if the coupon object contains the specified coupon name
                    if (couponObject.containsKey(couponName)) {
                        return (String) couponObject.get(couponName); // Return the corresponding coupon code
                    }
                }
            }
        } else {
            System.out.println("Brand not found: " + brand);
        }
        return null; // Return null if brand or coupon name is invalid
    }

    public static String getEmployeeId(String brand, String empId) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/TransactionTestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject jsonData = (JSONObject) obj;

        // Accessing the specified brand
        JSONObject brandData = (JSONObject) jsonData.get(brand);
        if (brandData != null) {
            // Accessing the employeeId array
            JSONArray employeeId = (JSONArray) brandData.get("employeeId");
            if (employeeId != null) {
                // Iterate over each coupon object in the array
                for (Object coupon : employeeId) {
                    JSONObject employeeObject = (JSONObject) coupon;
                    // Check if the coupon object contains the specified coupon name
                    if (employeeObject.containsKey(empId)) {
                        return (String) employeeObject.get(empId); // Return the corresponding coupon code
                    }
                }
            }
        } else {
            System.out.println("Brand not found: " + brand);
        }
        return null; // Return null if brand or coupon name is invalid
    }

    public static String getURL(String brand, String url) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/TransactionTestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject jsonData = (JSONObject) obj;

        // Accessing the specified brand
        JSONObject brandData = (JSONObject) jsonData.get(brand);
        if (brandData != null) {
            // Accessing the URL array
            JSONArray urlValue = (JSONArray) brandData.get("CheetahURL");
            if (urlValue != null) {
                // Iterate over each URL object in the array
                for (Object coupon : urlValue) {
                    JSONObject couponObject = (JSONObject) coupon;
                    // Check if the URL object contains the specified url
                    if (couponObject.containsKey(url)) {
                        return (String) couponObject.get(url); // Return the corresponding URL
                    }
                }
            }
        } else {
            System.out.println("Brand not found: " + brand);
        }
        return null; // Return null if brand or coupon name is invalid
    }

    public static String getSFCCPromoSKU(String brand, String SKU) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/TransactionTestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject jsonData = (JSONObject) obj;

        // Accessing the specified brand
        JSONObject brandData = (JSONObject) jsonData.get(brand);
        if (brandData != null) {
            // Accessing the coupons array
            JSONArray SKUs = (JSONArray) brandData.get("SFCC-SKU");
            if (SKUs != null) {
                // Iterate over each coupon object in the array
                for (Object PromoSKU : SKUs) {
                    JSONObject promoSKUObject = (JSONObject) PromoSKU;
                    // Check if the coupon object contains the specified coupon name
                    if (promoSKUObject.containsKey(SKU)) {
                        return (String) promoSKUObject.get(SKU); // Return the corresponding coupon code
                    }
                }
            }
        } else {
            System.out.println("Brand not found: " + brand);
        }
        return null; // Return null if brand or SKU name is invalid
    }
    public static String getAddress(String brand, int index,String detailType) throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        FileReader reader = new FileReader("src/main/java/aptos/testData/TransactionTestData.json");
        Object obj = jsonParser.parse(reader);
        JSONObject jsonData = (JSONObject) obj;

        // Accessing the specified brand
        JSONObject brandData = (JSONObject) jsonData.get(brand);
        if (brandData != null) {
            // Accessing the customers array
            JSONArray address = (JSONArray) brandData.get("Address");
            if (address != null && index >= 0 && index < address.size()) {
                JSONObject add = (JSONObject) address.get(index);
                // Return the requested detail
                return (String) add.get(detailType); // detailType can be "Address1", "Address2", "City",  "state" or "zipcode"
            } else {
                System.out.println("Invalid index or no addresses found.");
            }
        } else {
            System.out.println("Brand not found: " + brand);
        }
        return null; // Return null if brand or index is invalid
    }
}