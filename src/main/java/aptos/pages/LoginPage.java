package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.IOException;
import java.time.Duration;

import static org.junit.Assert.assertTrue;

public class LoginPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();
    BasketPage basketPage = new BasketPage();

    // Initializing the Page Objects
    public LoginPage() throws IOException {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "//*[@name='LoginScreen-userName-textInput']")
    WebElement username;

    @FindBy(xpath = "//*[@name='LoginScreen-password-textInput']")
    WebElement password;

    @FindBy(xpath = "//*[@name='Done']")
    WebElement doneKey;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='LoginScreen-signIn-button']")
    WebElement signIn;

    @FindBy(xpath = "//XCUIElementTypeImage")
    WebElement logo;

    //Actions
    public void loginToApplication(String uName, String pWord) {
        mobileActions.enterText(username, uName);
        mobileActions.enterText(password, pWord);
        mobileActions.clickOnElement(doneKey);
    }

    public boolean isLoginPageDisplayed() {
        try {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
            wait.until(ExpectedConditions.visibilityOf(username));
            return true;
        } catch (TimeoutException e) {
            return false; // Return false if the element is not found
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public void validateColorOfLoginPage() throws IOException {
        generalUtility.isElementDisplayed(logo);
    }

    public void terminateApplication() {
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("taskkill", "/F", "/IM", "com.aptos.scp.storeselling.vfcorp.nora.test");
            processBuilder.start();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}





