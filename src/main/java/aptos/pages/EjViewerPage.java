package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.TestDataHelper;
import aptos.utility.WebActions;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;


import java.io.IOException;
import java.time.Duration;
import java.time.LocalTime;

import static aptos.stepDefinition.PaymentPageStepDefinition.*;

public class EjViewerPage extends TestBase {

    BasketPage basketPage = new BasketPage();
    GeneralUtility generalUtility = new GeneralUtility();
    WebActions webActions = new WebActions();



//    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Sign in']")
//    WebElement signInButton = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Sign in']"));
//
//    @FindBy(xpath = "//*[@value='Select retail location']")
//    WebElement storeNumberTxtField;

    // Constructor to initialize the Page Objects
    public EjViewerPage() throws IOException {
        PageFactory.initElements(browserDriver, this);
    }

    public void enterTransactionId() {
        browserDriver.findElement(By.xpath("(//XCUIElementTypeOther[@name='Aptos ONE EJ Viewer'])[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther[6]/XCUIElementTypeOther/XCUIElementTypeButton")).click();
        //browserDriver.findElement(By.xpath("(//XCUIElementTypeOther[@name='Aptos ONE EJ Viewer'])[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther[6]/XCUIElementTypeOther/XCUIElementTypeButton")).click();
        browserDriver.findElement(By.xpath("//XCUIElementTypeTextField[@value='Enter transaction #']")).sendKeys(saleTransactionID);
        browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Cashier']")).click();
    }

    public void enterTheStoreNumber() {
        System.out.println("before "+LocalTime.now());
        browserDriver.findElement(By.xpath("//*[@value='Select retail location']")).sendKeys(properties.getProperty("StoreNumber"));
        System.out.println("After" +LocalTime.now());
//        System.out.println("Enter Store Number");
//        webActions.enterText(storeNumberTxtField,properties.getProperty("StoreNumber"));
//        System.out.println("Store Number entered successfully");
        if (properties.getProperty("Brand").equals("DCK")) {
            browserDriver.findElement(By.xpath("//*[@name='Dropdown select']/descendant::XCUIElementTypeOther[3]/descendant::XCUIElementTypeOther[1]")).click();
        } else {
            System.out.println("before click " +LocalTime.now());
//
            browserDriver.findElement(By.xpath("//*[@name='Dropdown select']/descendant::XCUIElementTypeOther[3]")).click();

            System.out.println("After click " +LocalTime.now());
//
        }
        browserDriver.findElement(By.xpath("(//*[@name='Store'])")).click();
    }

    public void signInToEjViewer() {
        if (isSignInButtonDisplayed()) {
            browserDriver.findElement(By.xpath("//*[@name='Sign in']")).click();
        } else if (isSignOutButtonDisplayed()) {
            browserDriver.findElement(By.xpath("//*[@name='Sign out']")).click();
            isSignOutButtonDisplayed();
            browserDriver.findElement(By.xpath("//*[@name='Sign in']")).click();
        }
        browserDriver.findElement(By.xpath("//*[@name='Username or email']")).sendKeys(properties.getProperty("EJViewerUsername"));
        browserDriver.findElement(By.xpath("//*[@name='Password']")).sendKeys(properties.getProperty("EJViewerPassword"));
        browserDriver.findElement(By.xpath("//*[@name='Sign In']")).click();
        browserDriver.findElement(By.xpath("//*[@name='Reload']")).click();
    }


//    public void signInToEjViewer(){
////        if (isSignInButtonDisplayed()) {
//            System.out.println("Before Action");
//            webActions.clickOnElement(signInButton);
////            browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Sign in']")).click();
//            System.out.println("After Action");
////        }
//    }

    public void validatePaymentDetail() {
        WebElement totalAmountEj = browserDriver.findElement(By.xpath("(//*[contains(@label,'" + "$" + totalPaymentSale + "')])"));
        WebElement taxAmountEj = browserDriver.findElement(By.xpath("(//*[contains(@label,'" + "$" + taxAmountSale + "')])"));
        WebElement savingsAmountEj = browserDriver.findElement(By.xpath("//*[contains(@label,'" + "$" + discountAmountSale + "')]"));

        if ((totalAmountEj.getAttribute("label")).contains(totalPaymentSale)) {
            System.out.println("totalPaymentSale exists in totalAmountEj.");
        } else {
            Assert.fail("totalPaymentSale " + totalPaymentSale + "does not exist in totalAmountEj " + totalAmountEj);
        }

        if ((taxAmountEj.getAttribute("label")).contains(taxAmountSale)) {
            System.out.println("taxAmountSale exists in totalAmountEj.");
        } else {
            Assert.fail("taxAmountSale does not exist in totalAmountEj.");
        }

        if ((savingsAmountEj.getAttribute("label")).contains(discountAmountSale)) {
            System.out.println("discountAmountSale exists in totalAmountEj.");
        } else {
            Assert.fail("discountAmountSale does not exist in totalAmountEj.");
        }
    }

    public void validateReasonCode(String reasonCode) {
        try {
            WebElement element = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[contains(@name, '" + reasonCode + "')]"));
            Assert.assertTrue("Reason code '" + reasonCode + "' does not exist.", element.isEnabled());
        } catch (NoSuchElementException e) {
            Assert.fail("Reason code '" + reasonCode + "' does not exist in EJ.");
        }
    }

    public void signOutFromEjViewer() {
        browserDriver.findElement(By.xpath("//*[@name='Sign out']")).click();
        browserDriver.quit();
    }


    public void validateDetails(String details) {
        try {
            WebElement element = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[contains(@name, '" + details + "')]"));
            Assert.assertTrue("Details from aptos '" + details + "' does not exist.", element.isEnabled());
        } catch (NoSuchElementException e) {
            Assert.fail("Details '" + details + "' does not exist in EJ.");
        }
    }

    public void validatesTransactionVoided() {
        try {
            WebElement element = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='Transaction voided']"));
            Assert.assertTrue("Transaction voided details not found", element.isEnabled());
        } catch (NoSuchElementException e) {
            Assert.fail("Transaction voided details not found");
        }
    }

    public void validateReasonCodeID(int reasonCodeID) {
        try {
            WebElement element = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[contains(@name, '" + reasonCodeID + "')]"));
            Assert.assertTrue("Details from aptos '" + reasonCodeID + "' does not exist.", element.isEnabled());
        } catch (NoSuchElementException e) {
            Assert.fail("Details '" + reasonCodeID + "' does not exist in EJ.");
        }
    }

    public void clickOnPaymentAuthDetails() {
        browserDriver.findElement(By.xpath("//*[@name='Payment auth details']")).click();
    }

    public void validateGiftCardBalanceAmountInEJ() {
        WebElement element = browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[contains(@name, '$')]"));
        Assert.assertTrue("Test Failed: Gift Card Balance amount mismatch in EJ", element.getText().contains(BasketPage.giftCardBalanceAmount));
    }

    public boolean isSignInButtonDisplayed() {
        try {
            browserDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
            WebDriverWait wait = new WebDriverWait(browserDriver, Duration.ofSeconds(15));
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@name='Sign in']")));
            return true;
        } catch (TimeoutException e) {
            return false; // Return false if the element is not found
        } finally {
            browserDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public boolean isSignOutButtonDisplayed() {
        try {
            browserDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
            WebDriverWait wait = new WebDriverWait(browserDriver, Duration.ofSeconds(12));
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@name='Sign out']")));
            return true;
        } catch (TimeoutException e) {
            return false; // Return false if the element is not found
        } finally {
            browserDriver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public void saveAPTnumber() {
            String aptNumber=browserDriver.findElement(By.xpath("//XCUIElementTypeStaticText[contains(@name, 'APT')][1]")).getText();
            System.out.println("APT Number is : "+aptNumber);
    }
}