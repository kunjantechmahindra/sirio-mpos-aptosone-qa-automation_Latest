package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.W3CActions;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import javax.xml.xpath.XPath;
import java.io.IOException;
import java.nio.file.WatchEvent;

import static org.junit.Assert.assertTrue;

public class LandingPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();

    W3CActions w3CActions = new W3CActions();
    BasketPage basketPage = new BasketPage();

    // Initializing the Page Objects
    public LandingPage() throws IOException {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "(//*[@name='Start Basket'])[3]")
    WebElement startBasket;

    //    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Hi')])[3]//XCUIElementTypeOther[1]//XCUIElementTypeOther[1]//XCUIElementTypeOther")

//    @FindBy(xpath = "(//XCUIElementTypeOther[@name=\"Hi User level 30.\n" +
//            "\n" +
//            "Remember to ask every customer for their email address. Start Basket\"])[3]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
//    you an XPLR Pass member? Sign in to earn points on every purchase or join now for free. Start Basket\"])[3]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    //XCUIElementTypeOther[@name="User Hi User.

    @FindBy(xpath = "(//XCUIElementTypeOther[@name=\"User Hi User.\n" +
            "\n" +
            "Remember to ask every customer for their email address. Horizontal scroll bar, 1 page Vertical scroll bar, 1 page Start Basket Resume Horizontal scroll bar, 1 page Vertical scroll bar, 1 page\"])[3]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement hamburgerButtonFromLandingPage;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name=\"Hi Testing Automation.\n" +
            "\n" +
            "Please make sure to suggest additional items (Socks, Belts, Wallets, Bags and Hats/Caps) Start Basket\"])[3]/XCUIElementTypeOther[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement hamburgerButtonFromLandingPageDCK;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Sales history']")
    WebElement salesHistoryHam;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Today's sales']")
    WebElement todaySalesHistory;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Last sale']")
    WebElement lastSaleHistory;

    @FindBy(xpath = "//*[@name='MainScreen-header-left-button']")
    WebElement hamburgerButton;

    @FindBy(xpath = "//*[@label='Sign out']")
    WebElement signOutButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Search customer']")
    WebElement searchCustomerButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Product inquiry']")
    WebElement productInquiryButtton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Sales history']")
    WebElement salesHistoryButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Gift card balance']")
    WebElement giftCardBalanceButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Reprint']")
    WebElement reprintButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Store operations']")
    WebElement storeOperationButton;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Information')]")
    WebElement informationButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Change password']")
    WebElement changePasswordButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Preferences']")
    WebElement preferencesButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Sign out']")
    WebElement SignOutButton;

    //    @FindBy(xpath = "//XCUIElementTypeOther//XCUIElementTypeOther[1]")
    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'COMMERCE')]/XCUIElementTypeOther[1]")
    WebElement closeHamburgerMenu;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='Close drawer']")
    WebElement closeHamburgerMenuIPhone;
    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, 'Hi')]")
    WebElement landingPageMessage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Close terminal']")
    WebElement closeTerminalButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Open terminal']")
    WebElement openTerminalButton;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='Yes']")
    WebElement yesButtonCloseTerminal;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Yes']")
    WebElement yesButtonOpenTerminal;

    //@FindBy(xpath = "//XCUIElementTypeOther[@label='Store operations']")
    @FindBy(xpath = "//XCUIElementTypeOther[@name='Store operations']")
    WebElement storeOperations;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='No']")
    WebElement noButtonOpenTerminal;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Start Basket'])[2]")
    WebElement iPhoneStartBasket;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='MainScreen-header-none-button']")
    WebElement iPhoneHamburgerButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Search customer']")
    WebElement iPhoneSearchCustomerButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Home']")
    WebElement homeButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Basket']")
    WebElement basketButtonHamburger;

    //Actions
    public void clickOnStartBasket() {
        mobileActions.clickOnElement(startBasket);
    }

    public void clickOnHamburgerMenu() {
        mobileActions.clickOnElement(hamburgerButton);
    }

    public void clickOnSalesHistory() {
        generalUtility.isElementDisplayed(salesHistoryHam);
        mobileActions.clickOnElement(salesHistoryHam);
    }

    public void validateStartBasket() {
        if (properties.getProperty("DeviceName").equals("iPhone"))
        {
            generalUtility.waitForElementToBeVisible(iPhoneStartBasket, 12);
            boolean isDisplayed = generalUtility.isElementDisplayed(iPhoneStartBasket);
            assertTrue("Test Failed: Start page has not been displayed", isDisplayed);
        }
        else {
            generalUtility.waitForElementToBeVisible(startBasket, 12);
            boolean isDisplayed = generalUtility.isElementDisplayed(startBasket);
            assertTrue("Test Failed: Landing page has not been displayed", isDisplayed);
        }
    }

    public void validateHamburgerButton() {

        if (properties.getProperty("DeviceName").equals("iPhone")) {
            boolean isDisplayed = generalUtility.isElementDisplayed(iPhoneHamburgerButton);
            assertTrue("Test Failed: Hamburger button has not been displayed", isDisplayed);
            mobileActions.clickOnElement(iPhoneHamburgerButton);
        }
            else if (properties.getProperty("Brand").equals("DCK")) {
            boolean isDisplayed = generalUtility.isElementDisplayed(hamburgerButtonFromLandingPageDCK);
            assertTrue("Test Failed: Hamburger button has not been displayed", isDisplayed);
        } else {
            boolean isDisplayed = generalUtility.isElementDisplayed(hamburgerButtonFromLandingPage);
            assertTrue("Test Failed: Hamburger button has not been displayed", isDisplayed);
        }
    }

    public void logoutFromLandingPage() {
        mobileActions.clickOnElement(hamburgerButtonFromLandingPage);
        mobileActions.waitAndClickOnElement(signOutButton, 5);
    }

    public void hamburgerOptionValidation() throws InterruptedException {
        mobileActions.clickUsingCoordinates(driver, 27, 47);
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            boolean isDisplayed = generalUtility.isElementDisplayed(iPhoneSearchCustomerButton);
            assertTrue("Search Customer button is unavailable", isDisplayed);
        }
            else if (properties.getProperty("Brand").equals("TBL")) {
            boolean isDisplayed = generalUtility.isElementDisplayed((homeButton));
            assertTrue("home button is unavailable",isDisplayed);
        } else if (properties.getProperty("Brand").equals("TNF")) {
            boolean isDisplayed = generalUtility.isElementDisplayed(searchCustomerButton);
            assertTrue("Search Customer button is unavailable", isDisplayed);
        }
        boolean isDisplayed = generalUtility.isElementDisplayed(searchCustomerButton);
        assertTrue("Search Customer button is unavailable", isDisplayed);
        isDisplayed = generalUtility.isElementDisplayed(productInquiryButtton);
        assertTrue("Product Inquiry button is unavailable", isDisplayed);
        isDisplayed = generalUtility.isElementDisplayed(salesHistoryButton);
        assertTrue("Sales History button is unavailable", isDisplayed);
        isDisplayed = generalUtility.isElementDisplayed(giftCardBalanceButton);
        assertTrue("Gift Card Balance button is unavailable", isDisplayed);
        isDisplayed = generalUtility.isElementDisplayed(reprintButton);
        assertTrue("Reprint button is unavailable", isDisplayed);
        isDisplayed = generalUtility.isElementDisplayed(storeOperationButton);
        assertTrue("Store Operations button is unavailable", isDisplayed);
        w3CActions.scrollHamburgerMenu();
        isDisplayed = generalUtility.isElementDisplayed(informationButton);
        assertTrue("Information button is unavailable", isDisplayed);
        isDisplayed = generalUtility.isElementDisplayed(changePasswordButton);
        assertTrue("Change Password button is unavailable", isDisplayed);
        w3CActions.scrollHamburgerMenu();
        isDisplayed = generalUtility.isElementDisplayed(preferencesButton);
        assertTrue("Preferences button is unavailable", isDisplayed);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            w3CActions.scrollDown();
        }
        isDisplayed = generalUtility.isElementDisplayed(SignOutButton);
        assertTrue("Sign Out button is unavailable", isDisplayed);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            w3CActions.scrollUp();
            mobileActions.clickOnElement(closeHamburgerMenuIPhone);
        }else{
        mobileActions.clickOnElement(closeHamburgerMenu);
    }}

    public void validateCustomMessage(String message) {
        WebElement customMessage = driver.findElement(By.xpath("//XCUIElementTypeStaticText[contains(@name," + message + "')]"));
        generalUtility.isElementDisplayed(customMessage);
    }

    public void validateLandingPageMessage(String message) {
        String customMessage = generalUtility.getTextFromElement(landingPageMessage);
        assertTrue("Test failed: Custom Message is not correctly displayed", customMessage.contains(message));
    }

    public void clickOnReprint() {
        generalUtility.isElementEnabled(reprintButton);
        mobileActions.clickOnElement(reprintButton);
    }

    public void validateCloseTerminal() throws InterruptedException {
        mobileActions.clickUsingCoordinates(driver, 39, 49);
        mobileActions.waitAndClickOnElement(storeOperations, 3);
        Assert.assertTrue("Close Terminal Functionality is not available", generalUtility.isElementDisplayed(closeTerminalButton));
    }

    public void clickOnCloseTerminal() {
        mobileActions.clickOnElement(closeTerminalButton);
        mobileActions.clickOnElement(yesButtonCloseTerminal);
        Assert.assertTrue("Test Failed: Terminal is not closed", generalUtility.isElementDisplayed(openTerminalButton));
    }

    public void clickOnOpenTerminal() {
        mobileActions.clickOnElement(openTerminalButton);
        mobileActions.clickOnElement(yesButtonOpenTerminal);
    }

    public void cancelCloseTerminalOperation() {
        mobileActions.clickOnElement(noButtonOpenTerminal);
    }

    public void clickOnCloseTerminalButton() {
        mobileActions.clickOnElement(closeTerminalButton);
    }

    public void clickOnBackButtonFromStoreOperationPageToBasketPage() throws InterruptedException {
        mobileActions.clickUsingCoordinates(driver,10,20);
    }


}