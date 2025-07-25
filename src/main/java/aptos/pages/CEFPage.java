package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;
import java.util.List;

import static aptos.pages.EmailValidation.countOccurrences;
import static aptos.stepDefinition.PaymentPageStepDefinition.*;

public class CEFPage extends TestBase {

    // Constructor to initialize the Page Objects
    public CEFPage() throws IOException {
        PageFactory.initElements(browserDriver, this);
    }

    public void signInToCEF() {
        System.out.println(properties.getProperty("CEFPageUsername"));
        browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Username']/following-sibling::XCUIElementTypeTextField\n")).sendKeys(properties.getProperty("CEFPageUsername"));
        browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Password']/following-sibling::XCUIElementTypeSecureTextField\n")).sendKeys(properties.getProperty("CEFPassword"));
        browserDriver.findElement(By.xpath("//XCUIElementTypeButton[@name='Login']")).click();
    }

    public void clickOnEventSearch() {
        browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='SEARCH']")).click();
        browserDriver.findElement(By.xpath("//XCUIElementTypeLink[@name='Event Search']")).click();
    }

    public void enterBusinessID() {
        String region = properties.getProperty("Region");
        String storeNo = properties.getProperty("StoreNumber");
        String terminal = properties.getProperty("StoreTerminal");
        String brandValue = properties.getProperty("Brand");

        String brandPrefix = "";
        if ("TNF".equals(brandValue)) {
            brandPrefix = "NF";
        } else if ("TBL".equals(brandValue)) {
            brandPrefix = "TB";
        }
        if (!brandPrefix.isEmpty()) {
            String businessID = brandPrefix + ":" + region + ":RT:" + storeNo + ":" + terminal + ":" + saleTransactionID;
            // Output the generated business ID for logging or debugging
            System.out.println(businessID);
            // Send the business ID to the text field
            browserDriver.findElement(By.xpath("(//XCUIElementTypeOther[@name='CEF - Event Search'])[1]/XCUIElementTypeOther[18]/XCUIElementTypeTextField")).sendKeys(businessID);
            // Proceed with the final clicks
            browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Business ID']")).click();
            browserDriver.findElement(By.xpath("//XCUIElementTypeButton[@name='Submit']")).click();
        }
    }

    public void validateTransactionFlowToESB() {
        List<WebElement> elements = browserDriver.findElements(By.xpath("//XCUIElementTypeStaticText[contains(@name, 'APTOSONE')]"));
        Assert.assertTrue("Duplicate values", (elements.size() == 1));

        //validate the existences of AptosONe
        boolean isElementDisplayed = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='APTOSONE']")).isDisplayed();
        Assert.assertTrue("Transactions are not flowing to ESB", isElementDisplayed);
        if (properties.getProperty("Brand").equals("DCK")) {
            String status = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Complete']")).getText();
            Assert.assertTrue("AptosOne hasn't reached ESB", status.contains("Complete"));
        } else if (properties.getProperty("BrandRegion").equals("TBL-CA")) {
            String status = browserDriver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Complete'])[4]")).getText();
            Assert.assertTrue("AptosOne hasn't reached ESB", status.contains("Complete"));
        } else {
            String status = browserDriver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Complete'])[6]")).getText();
            Assert.assertTrue("AptosOne hasn't reached ESB", status.contains("Complete"));
        }
    }

    public void logout() {
        browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='LOGOUT']")).click();
    }

    public void enterDateAndBusinessIDForDCK(String date) {
        String storeNo = properties.getProperty("StoreNumber");
        String businessID = storeNo + ":" + date + ":" + saleTransactionID;
        browserDriver.findElement(By.xpath("(//XCUIElementTypeOther[@name='CEF - Event Search'])[1]/XCUIElementTypeOther[18]/XCUIElementTypeTextField")).sendKeys(businessID);
        browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Business ID']")).click();
        browserDriver.findElement(By.xpath("//XCUIElementTypeButton[@name='Submit']")).click();

    }
}
