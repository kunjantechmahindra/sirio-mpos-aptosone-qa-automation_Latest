package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.*;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;

import java.io.IOException;

public class LoginPageStepDefinition extends TestBase {
    LoginPage loginPage = new LoginPage();
    BasketPage basketPage = new BasketPage();
    PaymentPage paymentPage = new PaymentPage();
    ReturnPage returnPage = new ReturnPage();
    StoreOperationsPage storeOperationsPage = new StoreOperationsPage();
    CustomerPage customerPage = new CustomerPage();

    public LoginPageStepDefinition() throws IOException {
    }

    @Given("the sales assistant login to the application with valid username and password")
    public void theSalesAssistantLoginToTheApplicationWithValidUsernameAndPassword() throws InterruptedException {
        if (loginPage.isLoginPageDisplayed()) {
            loginPage.loginToApplication(properties.getProperty("Username"), properties.getProperty("Password"));
        } else if (basketPage.isVoidButtonDisplayed()) {
            basketPage.voidFromBasket();
            if (!properties.getProperty("BrandRegion").equals("DCK")) {
                returnPage.selectReasonCode("Cashier Error");
            }
            paymentPage.selectPrinterByEnteringName();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(properties.getProperty("Username"), properties.getProperty("Password"));
        } else if ((paymentPage.isCloseButtonDisplayed())) {
            paymentPage.clickOnCloseButton();
            paymentPage.voidFromPayment();
            if (!properties.getProperty("BrandRegion").equals("DCK")) {
                returnPage.selectReasonCode("Cashier Error");
            }
            paymentPage.selectPrinterByEnteringName();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(properties.getProperty("Username"), properties.getProperty("Password"));
        } else if ((paymentPage.isVoidButtonDisplayed())) {
            paymentPage.voidFromPayment();
            if (!properties.getProperty("BrandRegion").equals("DCK")) {
                returnPage.selectReasonCode("Cashier Error");
            }
            paymentPage.selectPrinterByEnteringName();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(properties.getProperty("Username"), properties.getProperty("Password"));
        } else if (storeOperationsPage.isTenderExchangeDisplayed()) {
            storeOperationsPage.backFromTenderExchangePage();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(properties.getProperty("Username"), properties.getProperty("Password"));
        } else if (returnPage.isReturnPageDisplayed()) {
            returnPage.backFromReturnPage();
            if (!properties.getProperty("BrandRegion").equals("DCK")) {
                customerPage.clickOnSkipButton();
            }
            basketPage.voidFromBasket();
            if (!properties.getProperty("BrandRegion").equals("DCK")) {
                returnPage.selectReasonCode("Cashier Error");
            }
            paymentPage.selectPrinterByEnteringName();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(properties.getProperty("Username"), properties.getProperty("Password"));
        } else {
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(properties.getProperty("Username"), properties.getProperty("Password"));
        }
    }

    @Given("the sales assistant logs in to the application with {string} security level")
    public void theSalesAssistantLoginToTheApplicationWithValidUsernameAndPasswordAtSecurityLevel(String securityLevel) throws InterruptedException {
        String username;
        String password;

        if ("above".equalsIgnoreCase(securityLevel)) {
            username = properties.getProperty("SecurityLevelAboveUserName");
            password = properties.getProperty("SecurityLevelAbovePassword");
        } else if ("below".equalsIgnoreCase(securityLevel)) {
            username = properties.getProperty("SecurityLevelBelowUserName");
            password = properties.getProperty("SecurityLevelBelowPassword");
        } else {
            throw new AssertionError("Unrecognized security level: " + securityLevel);
        }

        if (loginPage.isLoginPageDisplayed()) {
            loginPage.loginToApplication(username, password);
        } else if (basketPage.isVoidButtonDisplayed()) {
            basketPage.voidFromBasket();
            returnPage.selectReasonCode("Cashier Error");
            paymentPage.selectPrinterByEnteringName();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(username, password);
        } else if (paymentPage.isCloseButtonDisplayed()) {
            paymentPage.clickOnCloseButton();
            paymentPage.voidFromPayment();
            returnPage.selectReasonCode("Cashier Error");
            paymentPage.selectPrinterByEnteringName();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(username, password);
        } else if (paymentPage.isVoidButtonDisplayed()) {
            paymentPage.voidFromPayment();
            returnPage.selectReasonCode("Cashier Error");
            paymentPage.selectPrinterByEnteringName();
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(username, password);
        } else {
            basketPage.logoutFromApplication();
            loginPage.loginToApplication(username, password);
        }
    }

    @And("the sales assistant validate the color of login page")
    public void theSalesAssistantValidateTheColorOfLoginPage() throws IOException {
        loginPage.validateColorOfLoginPage();
    }

    @And("the sales assistant terminate the application")
    public void theSalesAssistantTerminateTheApplication() {
        loginPage.terminateApplication();
    }
}
