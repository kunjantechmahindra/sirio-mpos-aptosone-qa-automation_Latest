package aptos.base;

import io.appium.java_client.AppiumDriver;

import io.appium.java_client.ios.IOSDriver;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Properties;

public class TestBase {

    public static AppiumDriver driver;
    public static AppiumDriver browserDriver;
    public static WebDriver macDriver;
    public static Properties properties;


    public TestBase() {
        try {
            properties = new Properties();
            FileInputStream fis = new FileInputStream("src/main/java/aptos/configuration/config.properties");
            properties.load(fis);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void initializeAppiumDriver() throws MalformedURLException {
        DesiredCapabilities cap = new DesiredCapabilities();
        cap.setCapability("deviceName", properties.getProperty("DeviceName"));
        cap.setCapability("udid", properties.getProperty("Udid"));
        cap.setCapability("platformName", properties.getProperty("PlatformName"));
        cap.setCapability("platformVersion", properties.getProperty("PlatformVersion"));
        cap.setCapability("automationName", properties.getProperty("AutomationName"));
        cap.setCapability("bundleId", properties.getProperty("BundleId"));

        URL url = new URL("http://127.0.0.1:4723/");
        driver = new AppiumDriver(url, cap);
        browserDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
    }

    public static void initializeAppiumDriverForSafari() throws MalformedURLException {
        DesiredCapabilities cap = new DesiredCapabilities();
        cap.setCapability("deviceName", properties.getProperty("DeviceName"));
        cap.setCapability("udid", properties.getProperty("Udid"));
        cap.setCapability("platformName", properties.getProperty("PlatformName"));
        cap.setCapability("platformVersion", properties.getProperty("PlatformVersion"));
        cap.setCapability("automationName", properties.getProperty("AutomationName"));
        cap.setCapability("browserName", "Chrome"); // Use Chrome
        cap.setCapability("appium:chromeOptions", new HashMap<>()); // Optional: Any specific Chrome options can be added here
        URL url = new URL("http://127.0.0.1:4723/");
        browserDriver = new IOSDriver(url, cap);
        browserDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
    }

    public static void launchUrl(String url) {
        TestBase.browserDriver.navigate().to(url);
    }

    protected static byte[] captureScreenshot(String scenarioName) throws IOException {
        byte[] screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
        String timestamp = LocalDateTime.now().format(formatter);
        String screenshotPath = "src/main/java/aptos/screenshots/" + scenarioName + "_" + timestamp + ".png";

        try (FileOutputStream fos = new FileOutputStream(new File(screenshotPath))) {
            fos.write(screenshot);
        }
        return screenshot; // Return the screenshot bytes for Allure attachment
    }

    public static void launchChromeInMac() {
        String chromedriverPath = "src/main/java/aptos/driver/chromedriver";
        System.setProperty("webdriver.chrome.driver", chromedriverPath);
        macDriver = new ChromeDriver();
        macDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
    }

    public static void launchUrlInChromeMac(String url) {
        macDriver.get(url);
    }
    public static void quitChromeBrowserInMac() {
      macDriver.quit();
    }


}
