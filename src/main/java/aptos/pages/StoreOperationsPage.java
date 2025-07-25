package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.ApiHelper;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import org.junit.Assert;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.IOException;
import java.time.Duration;

import static aptos.stepDefinition.PaymentPageStepDefinition.saleTransactionID;
import static org.junit.Assert.assertTrue;

public class StoreOperationsPage extends TestBase {
    GeneralUtility generalUtility = new GeneralUtility();
    MobileActions mobileActions = new MobileActions();
    PaymentPage paymentPage = new PaymentPage();
    LineActionPage lineActionPage = new LineActionPage();

    // Initializing the Page Objects
    public StoreOperationsPage() throws IOException {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Amount']")
    WebElement amountText;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Reason code')])[last()]")
    WebElement reasonCode;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till operations'])[last()]")
    WebElement tillOperatorHeader;

    @FindBy(xpath = "//*[@name='OK']")
    WebElement okButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Store operations'])[last()]")
    WebElement storeOperationsHeader;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Proceed'])[last()]")
    WebElement proceedButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Counted amount'])[2]")
    WebElement countedAmountClick;

    @FindBy(xpath = "(//XCUIElementTypeTextField[@value='0'])[1]")
    WebElement quantity;

    @FindBy(xpath = "//*[@name='Done']")
    WebElement doneKey;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Proceed']")
    WebElement proceedInVarAmount;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Go to basket']")
    WebElement goToBasketButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='MainScreen-header-left-button']")
    WebElement arrowBackButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till out'])[2]")
    WebElement tillOutBack;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till out'])[2]")
    WebElement tillOutBackVariance;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till operations'])[1]")
    WebElement tillOperationBack;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Store operations'])[3]")
    WebElement storeOperationButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Enter amount'])[2]")
    WebElement clickOnEnterAmount;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till in'])[2]")
    WebElement tillInBackButtonFromVarReason;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till in'])[2]")
    WebElement tillInBackVariance;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='CORRECT CHANGE']")
    WebElement reasonCodeNoSale;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Correct Change']")
    WebElement reasonCodeNoSaleTNF;

    @FindBy(xpath = "(//*[@name='No sale'])")
    WebElement noSaleButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Basket'])[last()]")
    WebElement backToBasket;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Tender exchange'])")
    WebElement tenderExchangeButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Additional permission is required.']")
    WebElement errorMessagePopUp;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement buttonClosePopUp;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Paid out'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement backArrowPaidOut;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till operations'])[1]")
    WebElement tillOperationBackBelow;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Paid in'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement backArrowPaidIn;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Reason code >'])[3]")
    WebElement reasonCodeNoSaleProceed;

    @FindBy(xpath = "//*[@name='CONTESTS CUSTOMER ACCOMODATIONS DRAWER/SAFE FUND MAINTENANCE POSTAGE SUPPLIES TEAM MEALS']")
    WebElement allReasonCodeAlphabeticOrderTBL;

    @FindBy(xpath = "//*[@name='Fill the Fridge Holiday Meal Inventory Meal Supplies/Postage']")
    WebElement allReasonCodeAlphabeticOrderTNF;

    @FindBy(xpath = "//*[@name='Fill the Fridge Holiday Meal Inventory Meal Money Found in Drawer Supplies/Postage']")
    WebElement paidInReasonCodeAlphabeticOrderTNF;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='No sale'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement noSaleBackButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='AUDIT']")
    WebElement noSaleReasonCodesAudit;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='CORRECT CHANGE']")
    WebElement noSaleReasonCodeCorrectChange;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Audit']")
    WebElement noSaleReasonCodesAuditTNF;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Correct Change']")
    WebElement noSaleReasonCodeCorrectChangeTNF;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Price']")
    WebElement priceEntryPrompt;

    @FindBy(xpath = "//XCUIElementTypeOther[2]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther[2]")
    WebElement tenderExchangeOptions;

    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, 'Expected:')]")
    WebElement expectedAmount;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Coins']")
    WebElement coinsButton;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='0'][1]")
    WebElement coinsFirstTextField;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Proceed'])[1]/XCUIElementTypeOther[1]")
    WebElement iPhoneTillInBackButtonFromVarReason;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Variance in amount'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement iPhoneTillInBackVariance;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Proceed'])[1]/XCUIElementTypeOther[1]")
    WebElement iPhoneTillOperationBack;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Till operations'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement iPhoneStoreOperationButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Fill the Fridge']")
    WebElement paidInReasonCodeFirst;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Holiday Meal']")
    WebElement paidInReasonCodeSecond;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Inventory Meal']")
    WebElement paidInReasonCodeThird;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Money Found in Drawer']")
    WebElement paidInReasonCodeFourth;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='Supplies/Postage']")
    WebElement paidInReasonCodeFifth;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Tender exchange Continue']/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement tenderExchangeBackButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Tender exchange']")
    WebElement tenderExchangeTitle;

    //Actions
    public void clickOnStoreOperationItemsByName(String name) {
        mobileActions.clickOnElementByName(name);
    }

    public void enterAmount(int amount) {
        mobileActions.enterText(amountText, String.valueOf(amount * 100));
    }

    public void selectReasonCode() {
        mobileActions.clickOnElement(reasonCode);
    }

    public void clickOnTillOperator() {
        mobileActions.clickOnElement(tillOperatorHeader);
    }

    public void clickOnProceedButton() {
        mobileActions.clickOnElement(proceedButton);
    }

    public void clickOnOkButton() {
        mobileActions.clickOnElement(okButton);
    }

    public void clickOnStoreOperationsHeader() {
        mobileActions.clickOnElement(storeOperationsHeader);
    }

    public void clickOnCountedAmount() {
        mobileActions.clickOnElement(countedAmountClick);
    }

    public void enterFirstQuantity(Integer amount) {
        mobileActions.enterText(quantity, String.valueOf(amount));
    }

    public void clickOnDone() {
        mobileActions.clickOnElement(doneKey);
    }

    public void clicksOnProceedButtonFromVarianceInAmount() {
        mobileActions.clickOnElement(proceedInVarAmount);
    }

    public void clickOnGoToBasketButton() {
        mobileActions.clickOnElement(goToBasketButton);
    }

    public void clickOnTillOutBackButton() {
        mobileActions.clickOnElement(tillOutBack);
        mobileActions.clickOnElement(okButton);
    }

    public void clicksOnTillBackVariance() throws InterruptedException {
        Thread.sleep(3000);
        mobileActions.clickOnElement(tillOutBackVariance);
    }

    public void clickOnTillOperationBackButton() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            mobileActions.clickOnElement(iPhoneTillOperationBack);
            mobileActions.clickOnElement(okButton);
        } else {
            mobileActions.clickOnElement(tillOperationBack);
            mobileActions.clickOnElement(okButton);
        }
    }

    public void clickOnStoreOperations() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            mobileActions.clickOnElement(iPhoneStoreOperationButton);
        } else {
            mobileActions.clickOnElement(storeOperationButton);
        }
    }

    public void clickOnEnterAmount() {
        mobileActions.clickOnElement(clickOnEnterAmount);
    }

    public void clickOnTillInBackButtonFromVarianceReason() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            mobileActions.clickOnElement(iPhoneTillInBackButtonFromVarReason);
            mobileActions.clickOnElement(okButton);
        } else {
            mobileActions.clickOnElement(tillInBackButtonFromVarReason);
            mobileActions.clickOnElement(okButton);
        }
    }

    public void clickOnTillInBackButtonFromVarianceInAmount() throws InterruptedException {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            mobileActions.clickOnElement(iPhoneTillInBackVariance);
        } else {
            Thread.sleep(3000);// Waiting time to click on till in back button
            mobileActions.clickOnElement(tillInBackVariance);
        }
    }

    public void clicksOnAnyReasonCode() {
        if (properties.getProperty("Brand").equals("TBL")) {
            mobileActions.clickOnElement(reasonCodeNoSale);
        } else {
            mobileActions.clickOnElement(reasonCodeNoSaleTNF);
        }
    }

    public void noSaleIsEnabled() throws InterruptedException {
        assertTrue("Element is not enabled", generalUtility.isElementEnabled(noSaleButton));
        if ((properties.getProperty("DeviceName").contains("iPhone"))) {
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            mobileActions.clickOnElement(backToBasket);
        }
    }

    public void isReasonCodeDisplayedInAlphabeticOrder() {
        if (properties.getProperty("Brand").equals("TNF")) {
            boolean result = generalUtility.isElementDisplayed(allReasonCodeAlphabeticOrderTNF);
            assertTrue("ReasonCode not in Order", result);
        } else {
            boolean result = generalUtility.isElementDisplayed(allReasonCodeAlphabeticOrderTBL);
            assertTrue("ReasonCode not in Order", result);
        }
    }

    public void isReasonCodeDisplayedAlphabeticOrderForPaidIn() {
        if (properties.getProperty("Brand").equals("TNF")) {
            boolean result = generalUtility.isElementDisplayed(paidInReasonCodeAlphabeticOrderTNF);
            assertTrue("ReasonCode not in Order", result);
        }
    }

    public void clickOnNoSaleButton() {
        mobileActions.clickOnElement(noSaleButton);
    }

    public void tenderExchnageEnabled() {
        assertTrue("Element is not enabled", generalUtility.isElementEnabled(tenderExchangeButton));
        mobileActions.clickOnElement(backToBasket);
    }

    public void isReceiptOptionsDisplayed() {
        generalUtility.isElementDisplayed(paymentPage.emailButton);
        generalUtility.isElementDisplayed(paymentPage.printButton);
        generalUtility.isElementDisplayed(paymentPage.emailAndPrintButton);
    }

    public void errorMessageDisplayedOrNot() {
        boolean status = generalUtility.isElementDisplayed(errorMessagePopUp);
        assertTrue("Error message not displayed", status);
        mobileActions.clickOnElement(buttonClosePopUp);
    }

    public void clickOnBackArrowButton() {
        mobileActions.clickOnElement(backArrowPaidOut);
    }

    public void clickOnTillOpBelow() {
        mobileActions.clickOnElement(tillOperationBackBelow);
    }

    public void clickOnBackButtonFromPaidIn() {
        mobileActions.clickOnElement(backArrowPaidIn);
    }

    public void clickOnNoSaleReasonCode() {
        mobileActions.clickOnElement(reasonCodeNoSaleProceed);
    }

    public void clickOnNoSaleBackArrowButton() {
        mobileActions.clickOnElement(noSaleBackButton);
    }

    public void validateNoSaleReasonCode() {
        if (properties.getProperty("Brand").equals("TBL")) {
            generalUtility.isElementDisplayed(noSaleReasonCodesAudit);
            generalUtility.isElementDisplayed(noSaleReasonCodeCorrectChange);
        } else {
            generalUtility.isElementDisplayed(noSaleReasonCodesAuditTNF);
            generalUtility.isElementDisplayed(noSaleReasonCodeCorrectChangeTNF);
        }
    }

    public void isPriceEntryPromptDisplayed() {
        generalUtility.isElementDisplayed(priceEntryPrompt);
    }

    public void enterPriceToTheItem(String amount) throws InterruptedException {
        mobileActions.enterText(lineActionPage.enterPrice, amount);
        mobileActions.clickHideKeyboard();
    }

    public void clickOnTenderExchangeButton() {
        mobileActions.clickOnElement(tenderExchangeButton);
    }

    public void validateOnlyCashOptionIsAvailableForTenderExchange() {
        String exchangeOptions = generalUtility.getTextFromElement(tenderExchangeOptions);
        Assert.assertFalse("Test Failed: More options available than cash", exchangeOptions.contains("Card"));
        Assert.assertFalse("Test Failed: More options available than cash", exchangeOptions.contains("Gift Card"));
    }

    public void clicksOnContinueButton() {
        mobileActions.clickOnElement(paymentPage.continueButton);
    }

    public void enterTheExpectedAmount() {
        String expectedAuditAmount = generalUtility.getTextFromElement(expectedAmount).replace("Expected: $", " ");
        expectedAuditAmount = expectedAuditAmount.replaceAll("[\\$(),]", "").trim();
        System.out.println("Expected Audit Amt: " + expectedAuditAmount);
        double doublevalue = Double.parseDouble(expectedAuditAmount);
        System.out.println("2: " + doublevalue);
        int expectedTillAuditAmountInt = (int) doublevalue;
        System.out.println("3: " + expectedTillAuditAmountInt);
        System.out.println("1 Exp Till Aud Amt: " + expectedTillAuditAmountInt);
        double decimalParts = doublevalue - expectedTillAuditAmountInt;
        decimalParts = Math.round(decimalParts * 100.0) / 100.0;
        System.out.println("4: " + decimalParts);
        int decimalPart = (int) (decimalParts * 100);
        System.out.println("Expected: " + expectedTillAuditAmountInt);
        System.out.println("Decimal: " + decimalPart);
        clickOnEnterAmount();
        if (decimalPart == 0) {
            enterFirstQuantity(expectedTillAuditAmountInt);
        } else {
            enterFirstQuantity(expectedTillAuditAmountInt);
            enterTheCoinsValue(decimalPart);
        }

    }

    public void validateReceiptReprinted() {
        String receiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        System.out.println(receiptContent);
        Assert.assertTrue("Test Failed: The receipt has not been reprinted", receiptContent.contains("REPRINT"));
    }

    public void enterTheCoinsValue(Integer coinsValue) {
        coinsButton.click();
        mobileActions.enterText(coinsFirstTextField, String.valueOf(coinsValue));
    }

    public void validateAllPaidInReasonCodes() {
        boolean reasonCodeFirst = generalUtility.isElementDisplayed(paidInReasonCodeFirst);
        boolean reasonCodeSecond = generalUtility.isElementDisplayed(paidInReasonCodeSecond);
        boolean reasonCodeThird = generalUtility.isElementDisplayed(paidInReasonCodeThird);
        boolean reasonCodeFourth = generalUtility.isElementDisplayed(paidInReasonCodeFourth);
        boolean reasonCodeFifth = generalUtility.isElementDisplayed(paidInReasonCodeFifth);

        Assert.assertTrue("Reason code mismatch", reasonCodeFirst);
        Assert.assertTrue("Reason code mismatch", reasonCodeSecond);
        Assert.assertTrue("Reason code mismatch", reasonCodeThird);
        Assert.assertTrue("Reason code mismatch", reasonCodeFourth);
        Assert.assertTrue("Reason code mismatch", reasonCodeFifth);
    }

    public boolean isTenderExchangeDisplayed() {
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
            wait.until(ExpectedConditions.visibilityOf(tenderExchangeTitle));
            return true;
        } catch (TimeoutException e) {
            return false;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public void backFromTenderExchangePage() {
        mobileActions.clickOnElement(tenderExchangeBackButton);
    }
}
