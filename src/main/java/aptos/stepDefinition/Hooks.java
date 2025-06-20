package aptos.stepDefinition;

import aptos.base.TestBase;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.qameta.allure.Allure;
import org.openqa.selenium.NoSuchSessionException;

import java.io.ByteArrayInputStream;
import java.io.IOException;

public class Hooks extends TestBase {

    @Before
    public void setUp() throws IOException {
        TestBase.initializeAppiumDriverForSafari();
        TestBase.initializeAppiumDriver();
    }

    @After
    public void tearDown(Scenario scenario) throws IOException, InterruptedException {
        if (scenario.isFailed()) {
            captureFailedScreenshot(scenario.getName());
        }
        quitAllDrivers();
    }

    private void captureFailedScreenshot(String scenarioName) throws IOException {
        byte[] screenshot = TestBase.captureScreenshot(scenarioName);
        Allure.addAttachment("Failed Screenshot: " + scenarioName, new ByteArrayInputStream(screenshot));
    }

    private void quitAllDrivers() throws InterruptedException {
        Thread.sleep(1500);
       if (driver != null) {
            try {
                driver.getSessionId(); // This will throw an exception if the session is inactive
                driver.quit();
                System.out.println("Appium driver has been quit.");
            } catch (NoSuchSessionException e) {
                System.err.println("Appium driver session was already terminated.");
            } catch (Exception e) {
                System.err.println("Failed to quit Appium driver: " + e.getMessage());
            }
        } else {
            System.out.println("Appium driver was not initialized.");
        }
    }

}
