package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.W3CActions;
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

import static aptos.pages.EmailValidation.returnBarcodeNumber;
import static aptos.stepDefinition.PaymentPageStepDefinition.originalPaymentMode;
import static aptos.stepDefinition.PaymentPageStepDefinition.totalPaymentSale;

public class ReturnPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    W3CActions w3CActions = new W3CActions();
    GeneralUtility generalUtility = new GeneralUtility();
    LoginPage loginPage = new LoginPage();
    BasketPage basketPage = new BasketPage();
    PaymentPage paymentPage = new PaymentPage();
    CustomerPage customerPage = new CustomerPage();
//    PaymentPageStepDefinition paymentPageStepDefinition = new PaymentPageStepDefinition();

    // Initializing the Page Objects
    public ReturnPage() throws IOException {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "//*[@name='ReturnWithTransactionScreen-scanOrder-camera']")
    WebElement cameraButtonInReturn;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='Ok']")
    WebElement buttonOkForAssignOriginalCustomerToReturn;

    @FindBy(xpath = "//*[@name='ReturnDetailsScreen-done-button']")
    WebElement returnDoneButton;

    @FindBy(xpath = "//*[@name='ReturnDetailsScreen-header-right-button' and @label='Return all']")
    WebElement returnAllButton;

    @FindBy(xpath = "//*[contains(@label, 'PRICE ADJUSTMENT')]")
    WebElement reasonCode;

    @FindBy(xpath = "//*[@name='Signature Pad demo']")
    WebElement signaturePad;

    @FindBy(xpath = "//*[@name='Accept']")
    WebElement acceptButton;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='Ok']")
    WebElement okButton;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='Cancel']")
    WebElement cancelButton;

    @FindBy(xpath = "//*[@name='ReturnWithTransactionScreen-noReceipt-button']")
    WebElement noReceiptReturn;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='MainScreen-header-left-button' or @name='MainScreen-header-none-button']")
    WebElement arrowBackButton;

    @FindBy(xpath = " //XCUIElementTypeOther[@name='MainScreen-header-none-button']")
    WebElement iPhoneArrowBackButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Diners (...0046)-button']")
    WebElement dinersCardForRefund;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-American Express (...1006)-button']")
    WebElement amexCardForRefund;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name,'Payment-Debit')]")
    WebElement originalTenderButton;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name,'Payment-MasterCard')]")
    WebElement originalTenderButtonTBLCA;

    @FindBy(xpath = "(//*[@name='Return'])[last()]")
    WebElement returnButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReturnWithTransactionScreen-returnSearch-button']")
    WebElement returnSearchReturnOption;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReturnWithTransactionScreen-searchCustomer-button']")
    WebElement customerSearchReturnOption;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReturnWithTransactionScreen-header-left-button']")
    WebElement backButtonFromReturnPage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='TransactionScreen-transactionsList']")
    WebElement customerFirstReturnTransaction;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ReturnSearchScreen-retailLocationId-textInput']")
    WebElement storeNumberTextField;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ReturnSearchScreen-transactionNumber-textInput']")
    WebElement transactionNumberReturnSearch;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ReturnSearchScreen-deviceId-textInput']")
    WebElement terminalReturnSearch;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReturnSearchScreen-header-right-button']")
    WebElement searchButtonFromReturnSearchPage;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ReturnSearchScreen-deviceId-textInput']")
    WebElement terminalTextField;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ReturnSearchScreen-transactionNumber-textInput']")
    WebElement transactionNumberTextField;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReturnSearchScreen-header-right-button']")
    WebElement searchButton;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='Continue']")
    WebElement continueButton;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Username']")
    WebElement userNameTextField;

    @FindBy(xpath = "//XCUIElementTypeSecureTextField[@value='Password']")
    WebElement passwordTextField;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Payment-Debit (...0119)-button'])[1]")
    WebElement visaDebitFiftyPerOne;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Payment-Debit (...0119)-button'])[2]")
    WebElement visaDebitFiftyPerSecond;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Payment-American Express (.')])[1]")
    WebElement amexCardFirst;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Payment-American Express (.')])[2]")
    WebElement amexCardSecond;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Payment-Membership Rewards Returns-button')]")
    WebElement membershipRewardButtonRefundLoyal;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ReturnWithTransactionScreen-scanOrder-textInput']")
    WebElement returnBarcodeField;

    @FindBy(xpath = "(//*[@label='Return mode'])[last()]")
    WebElement returnPageHeader;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Approve']")
    WebElement approveButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Discover')])")
    WebElement originalPaymentDiscover;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'MasterCard')])")
    WebElement originalPaymentMastercard;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Debit')])")
    WebElement originalPaymentVisa;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'American Express')])")
    WebElement originalPaymentAmex;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='The returnable period has expired.']")
    WebElement returnablePeriodExpirePopUp;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Username']")
    WebElement managerUsername;

    @FindBy(xpath = "//XCUIElementTypeSecureTextField[@value='Password']")
    WebElement managerPassword;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Approve']")
    WebElement managerApprovalButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReturnDetailsScreen-header-left-button']")
    WebElement backButtonFromReturnProductDetailsPage;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ActionPanel-textInput']")
    WebElement inputTextField;

    @FindBy(xpath = "//*[@name='Search']")
    WebElement searchKey;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReturnWithTransactionScreen-header-title']")
    WebElement returnPageTitle;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReturnWithTransactionScreen-header-left-button']")
    WebElement returnPageBackButton;

    //Actions
    public void clickOnCameraButtonInReturnScreen() {
        mobileActions.clickOnElement(cameraButtonInReturn);
    }

    public void clickOnReturnAllButton() {
        mobileActions.clickOnElement(returnAllButton);
    }

    public void clickOnDoneButton() {
        mobileActions.clickOnElement(returnDoneButton);
    }

    public void selectReasonCode(String returnCode) {
        String xpathExpression = "//*[@name='ReasonCodeListScreen-reasonCode-select' and contains(@label, '" + returnCode + "')]";
        try {
            WebElement element = driver.findElement(By.xpath(xpathExpression));
            mobileActions.clickOnElement(element);
        } catch (NoSuchElementException e) {
            throw new AssertionError("Element with reason code '" + returnCode + "' not found.");
        }
    }

    public void signForTransaction() {
        w3CActions.fetchCoordinatesAndDrawLine(signaturePad);
    }

    public void clickOnAcceptButton() {
        mobileActions.clickOnElement(acceptButton);
    }

    public void clickOnOkButton() {
        mobileActions.clickOnElement(okButton);
    }

    public void clickOnCancelButton() {
        mobileActions.clickOnElement(okButton);
    }

    public void clickOnNoReceipt() {
        mobileActions.clickOnElement(noReceiptReturn);
    }

    public void clickOnBackArrowButton() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            generalUtility.isElementDisplayed(customerPage.assignCustomerButton);
            mobileActions.clickOnElement(iPhoneArrowBackButton);
        } else {
            mobileActions.clickOnElement(arrowBackButton);
        }

    }

    public void clickOnDinerCardFoRefund() {
        mobileActions.clickOnElement(dinersCardForRefund);
    }

    public void clickOkButtonForAssignOriginalSaleCusToReturn() {
        mobileActions.clickOnElement(buttonOkForAssignOriginalCustomerToReturn);
    }

    public void isReturnPageHeaderDisplayed() {
        generalUtility.isElementDisplayed(returnPageHeader);
    }

    public void clickReturnProductAtPosition(int index) {
        WebElement product = driver.findElement(By.xpath(" (//XCUIElementTypeStaticText[@name='ReturnDetailsScreen-itemShortDescription'])[" + index + "]"));
        mobileActions.clickOnElement(product);
    }

    public void isReturnAllButtonEnabled() {
        boolean returnAllButtonExist = generalUtility.isElementEnabled(returnAllButton);
        Assert.assertTrue("Return all button not enabled", returnAllButtonExist);
        mobileActions.clickOnElement(returnAllButton);
    }

    public void isOriginalTenderAvailable() {
//        if(properties.getProperty("BrandRegion").equals("TBL-CA")){
//            generalUtility.isElementDisplayed(originalTenderButtonTBLCA);
//        }else{
//        generalUtility.isElementDisplayed(originalTenderButton);
//        }
        if (originalPaymentMode.equalsIgnoreCase("visa") || originalPaymentMode.equalsIgnoreCase("visa debit")) {
            generalUtility.isElementDisplayed(originalPaymentVisa);
        } else if (originalPaymentMode.equalsIgnoreCase("master")) {
            generalUtility.isElementDisplayed(originalPaymentMastercard);
        } else if (originalPaymentMode.equalsIgnoreCase("discover")) {
            generalUtility.isElementDisplayed(originalPaymentDiscover);
        } else if (originalPaymentMode.equalsIgnoreCase("amex")) {
            generalUtility.isElementDisplayed(originalPaymentAmex);
        }
    }

    public void isReturnProduct(int index) {
        String brand = properties.getProperty("Brand");
        String returnText;
        if (properties.getProperty("DeviceName").contains("iPhone")){
            if(index==1){
                w3CActions.scrollUp();
            }
            WebElement returnProductIphone = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Return: 0 RTL - Changed Mind'])["+ index +"]"));
            returnText = generalUtility.getTextFromElement(returnProductIphone);
            Assert.assertTrue("Not a return product", returnText.contains("Return:"));
        }
        if (brand.equals("TBL")) {
            WebElement returnProductTBL = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Return: 1 RTL - CHANGED MIND'])[" + index + "]"));
            returnText = generalUtility.getTextFromElement(returnProductTBL);
        } else if ((brand.equals("DCK"))) {
            WebElement returnProductDCK = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Return: Changed Mind'])[" + index + "]"));
            returnText = generalUtility.getTextFromElement(returnProductDCK);
        } else {
            WebElement returnProductTNF = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Return: 0 RTL - Changed Mind'])[" + index + "]"));
            returnText = generalUtility.getTextFromElement(returnProductTNF);
        }
        Assert.assertTrue("Not a return product", returnText.contains("Return:"));

    }

    public void clickOnAmexCardFoRefund() {
        mobileActions.clickOnElement(amexCardForRefund);
    }

    public void isReturnButtonEnabled() {
        boolean returnButtonExist = generalUtility.isElementEnabled(returnButton);
        Assert.assertTrue("Return button not enabled", returnButtonExist);
        mobileActions.clickOnElement(returnButton);
    }

    public void isReturnEnabledWithOptionCustomerSearch() {
        if (properties.getProperty("Brand").equals("TBL")) {
            boolean customerSearchEnabled = generalUtility.isElementEnabled(customerSearchReturnOption);
            Assert.assertTrue("Customer search button not enabled", customerSearchEnabled);
        } else if (properties.getProperty("Brand").equals("TNF")) {
            boolean customerSearchEnabled = generalUtility.isElementEnabled(customerSearchReturnOption);
            Assert.assertTrue("Customer search button not enabled", customerSearchEnabled);
        }
    }

    public void isReturnEnabledWithOptionReturnSearch() {
        boolean returnSearch = generalUtility.isElementEnabled(returnSearchReturnOption);
        Assert.assertTrue("Return Search button not enabled", returnSearch);
    }

    public void isReturnEnableWithOptionNoReceipt() {
        boolean noReceiptOptionEnabled = generalUtility.isElementEnabled(noReceiptReturn);
        Assert.assertTrue("No receipt option not enabled", noReceiptOptionEnabled);
    }

    public void clicksOneReturnPageBackButton() {
        mobileActions.clickOnElement(backButtonFromReturnPage);
    }

    public void clickOnCustomerSearchButton() {
        mobileActions.clickOnElement(customerSearchReturnOption);
    }

    public void selectFirstTransactionForReturned() {
        mobileActions.clickOnElement(customerFirstReturnTransaction);

    }

    public void isSignaturePadDisplayed() {
        generalUtility.isElementDisplayed(signaturePad);
    }

    public void entersTransactionDetails(String store, String terminal, String transactionId) {
        mobileActions.enterText(storeNumberTextField, store);
        mobileActions.enterText(terminalTextField, terminal);
        mobileActions.enterText(transactionNumberTextField, transactionId);
        mobileActions.clickOnElement(searchButton);
    }

    public void clicksContinueButton() {
        mobileActions.clickOnElement(continueButton);
    }

    public void managerApproval(String userName, String password) throws InterruptedException {
        mobileActions.enterText(userNameTextField, userName);
        mobileActions.enterText(passwordTextField, password);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(approveButton);
        //mobileActions.clickOnElement(loginPage.doneKey);
    }

    public void clicksOnReturnSearch() {
        mobileActions.clickOnElement(returnSearchReturnOption);
    }

    public void clickOnFirstVisaDebitCard() {
        mobileActions.clickOnElement(visaDebitFiftyPerOne);
    }

    public void clickOnSecondVisaDebitCard() {
        mobileActions.clickOnElement(visaDebitFiftyPerSecond);
    }

    public void clickOnFirstAmexCard() {
        mobileActions.clickOnElement(amexCardFirst);
    }

    public void clickOnSecondAmexCard() {
        mobileActions.clickOnElement(amexCardSecond);
    }

    public void clickOnMemberShipRewardsReturnButtonInRefund() {
        mobileActions.clickOnElement(membershipRewardButtonRefundLoyal);
    }

    public void verifyReceiptBarcode() {
        Assert.assertTrue("Receipt barcode is unavailable", returnAllButton.isDisplayed());
    }

    public void enterReturnBarcode() {
        mobileActions.enterText(returnBarcodeField, returnBarcodeNumber);
        mobileActions.clickOnElement(basketPage.searchKey);
    }

    public void passTerminalNumber() throws InterruptedException {
        mobileActions.enterText(terminalTextField, properties.getProperty("TerminalNumber"));
        mobileActions.clickHideKeyboard();
    }

    public void passTransactionNumber(String transactionNumber) {
        mobileActions.enterText(transactionNumberTextField, transactionNumber);
    }

    public void validateReturnAmount() {
        String totalSummary = generalUtility.getTextFromElement(basketPage.totalSummaryLabel).replaceAll("[\\$()]", "").trim();
        assert totalPaymentSale.equals(totalSummary) : "Validation Failed:Sale Amount " + totalPaymentSale + "is not equal to Refund Amount " + totalSummary;
    }

    public void enterTransactionID(String transactionID) throws InterruptedException {
        mobileActions.clickHideKeyboard();
        mobileActions.enterText(transactionNumberTextField, transactionID);
        mobileActions.clickOnElement(searchButton);
    }

    public void validateReturnablePeriodExpiredMessage() {
        Assert.assertTrue("No Error popup message came", generalUtility.isElementDisplayed(returnablePeriodExpirePopUp));
        mobileActions.clickOnElement(continueButton);
    }

    public void managerApprovalCred() throws InterruptedException {
        mobileActions.clickHideKeyboard();
        managerUsername.sendKeys(properties.getProperty("Username"));
        managerPassword.sendKeys(properties.getProperty("Password"));
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(managerApprovalButton);
    }

    public void backFromReturnProductDetailsPage() {
        mobileActions.clickOnElement(backButtonFromReturnProductDetailsPage);
    }

    public void enterUPCAManually(String ProductCode)
    {
        mobileActions.enterText(inputTextField, String.valueOf(ProductCode));
        mobileActions.clickOnElement(searchKey);
    }

    public boolean isReturnPageDisplayed() {
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
            wait.until(ExpectedConditions.visibilityOf(returnPageTitle));
            return true;
        } catch (TimeoutException e) {
            return false;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public void backFromReturnPage() {
        mobileActions.clickOnElement(returnPageBackButton);
    }
}
