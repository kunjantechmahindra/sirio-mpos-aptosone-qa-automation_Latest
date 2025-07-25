package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.ApiHelper;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.TestDataHelper;
import org.json.simple.parser.ParseException;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;
import java.sql.Struct;
import java.text.DecimalFormat;
import java.util.List;

import static aptos.pages.BasketPage.giftCardBalanceAmount;
import static aptos.stepDefinition.GiftCardStepDefinition.saveGiftCardIssueAmount;
import static org.junit.Assert.assertTrue;

public class GiftCardPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();
    ApiHelper apiHelper = new ApiHelper();
    BasketPage basketPage = new BasketPage();

    // Initializing the Page Objects
    public GiftCardPage() throws IOException {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    //@FindBy(xpath = "//*[@name='Gift card']")
    @FindBy(xpath = "//XCUIElementTypeOther[@name='Gift card']")
    WebElement giftCardButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Gift Card-button']")
    WebElement giftCardButtonTNF;

    @FindBy(xpath = "//XCUIElementTypeSecureTextField[@value='Gift card number']")
    WebElement giftCardNumberField;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Gift card amount']")
    WebElement giftCardAmountField;

    @FindBy(xpath = "//*[@name='Issue']")
    WebElement giftCardIssueButton;

    @FindBy(xpath = "//*[@name='Done']")
    WebElement doneKey;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Existing card']")
    WebElement existingCardButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Add value']")
    WebElement addValueButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='$50']")
    WebElement quickChoiceAmountButton50;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='$75']")
    WebElement quickChoiceAmountButton75;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='$100']")
    WebElement quickChoiceAmountButton100;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='$150']")
    WebElement quickChoiceAmountButton150;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='$200']")
    WebElement quickChoiceAmountButton200;

    @FindBy(xpath = "//*[@name=\"Invalid - Refusal\"]")
    WebElement giftCardErrorMessagePopUpInvalidGiftCard;


    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Refused - Refusal']")
    WebElement giftCardErrorMessagePopUpInvalidGiftCardTNF;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement errorMessageCloseButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, \"The entered value isn't allowed. Expected:\")]")
    WebElement giftCardAmountErrorMessage;

//    @FindBy(xpath = "(//*[@name='Gift card amount'])[2]/XCUIElementTypeOther/XCUIElementTypeTextField")
//    WebElement clearAndEnterGiftCardAmount;

    @FindBy(className = "XCUIElementTypeTextField")
    WebElement clearAndEnterGiftCardAmount;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name=\"Gift cards can't be discounted.\"]")
    WebElement discountNotApplicableToGiftCardError;

    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, \"The entered value isn't allowed\")]")
    WebElement minimumAmountError;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='MainScreen-header-title' and @label = 'Gift card']")
    WebElement giftCardHeader;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Gift Card-button']")
    WebElement refundGiftCard;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name=\"Manual discounts don't apply to issued gift cards.\"]")
    WebElement transactionalDiscountNotApplicableToGiftCardPopUp;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Cash')])[last()]")
    WebElement tenderExchangeCashButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Required']")
    WebElement balanceRequiredErrorMessage;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Swipe'])[last()]")
    WebElement swipeButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Swipe'])[2]")
    WebElement balanceSwipeButton;

    //@FindBy(xpath = "//XCUIElementTypeStaticText[@name='INVALID_PIN - WrongPIN']")
    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Authorization failed']")
    WebElement invalidPinErrorMessage;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement closeButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='MainScreen-header-title' and @label = 'Gift card']")
    WebElement labelGiftCardHeader;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Balance inquiry unsuccessful Refusal'])[1]")
    WebElement balanceInquiryErrorMessgae;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Balance inquiry Close']/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement balanceInquiryBackButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Balance inquiry unsuccessful']")
    WebElement tenderExchangeErrorMessage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Tender exchange Cancel']/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement tenderExchangeBackButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Swipe'])[2]")
    WebElement tenderExchangeSwipeButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Balance inquiry']")
    WebElement balanceInquiryHeader;

    //Actions
    public void clickOnGiftCardButton() {
        mobileActions.clickOnElement(giftCardButton);
    }

    public void enterGiftCardNumber(int index) throws IOException, ParseException {
        String giftCardNumber = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "cardNumber");
        mobileActions.enterText(giftCardNumberField, giftCardNumber);
    }

    public void enterGiftCardAmount(String amount) {
        mobileActions.enterText(giftCardAmountField, amount);
    }

    public void clickOnGiftCardIssueButton() {
        mobileActions.clickOnElement(giftCardIssueButton);
    }

    public void clickOnDoneKey() {
        mobileActions.clickOnElement(doneKey);
    }

    public void clickOnExistingCardButton() {
        mobileActions.clickOnElement(existingCardButton);
    }

    public void isExistingGiftCardButtonEnabled() {
        boolean existingGiftCardButtonEnabled = generalUtility.isElementEnabled(existingCardButton);
        Assert.assertTrue("Existing gift card button not enabled", existingGiftCardButtonEnabled);
    }

    public void clickOnAddValueButton() {
        mobileActions.clickOnElement(addValueButton);
    }

    public void isQuickChoiceAmountForIssueEnabled() {
        if (properties.getProperty("Brand").equals("DCK")) {
            for (int amount = 25; amount <= 150; amount += 25) {
                if (amount == 125) {
                    continue;
                }
                WebElement quickChoiceAmountButton = driver.findElement(By.xpath("//XCUIElementTypeOther[@name='$" + amount + "']"));
                boolean quickChoiceButton = generalUtility.isElementEnabled(quickChoiceAmountButton);
                Assert.assertTrue("Quick choice button " + amount + " not enabled", quickChoiceButton);

            }
        } else {
            boolean quickChoiceButton50 = generalUtility.isElementEnabled(quickChoiceAmountButton50);
            Assert.assertTrue("Quick choice button 50 not enabled", quickChoiceButton50);
            boolean quickChoiceButton75 = generalUtility.isElementEnabled(quickChoiceAmountButton75);
            Assert.assertTrue("Quick choice button 75 not enabled", quickChoiceButton75);
            boolean quickChoiceButton100 = generalUtility.isElementEnabled(quickChoiceAmountButton100);
            Assert.assertTrue("Quick choice button 100 not enabled", quickChoiceButton100);
            boolean quickChoiceButton150 = generalUtility.isElementEnabled(quickChoiceAmountButton150);
            Assert.assertTrue("Quick choice button 150 not enabled", quickChoiceButton150);
            boolean quickChoiceButton200 = generalUtility.isElementEnabled(quickChoiceAmountButton200);
            Assert.assertTrue("Quick choice button 200 not enabled", quickChoiceButton200);
        }
    }

    public void isGiftCardTenderButtonEnabled() {
        String brand = properties.getProperty("Brand");
        if (brand == "TBL") {
            boolean giftCardButtonForTenderTBL = generalUtility.isElementEnabled(giftCardButton);
            Assert.assertTrue("Gift card tender button not enabled", giftCardButtonForTenderTBL);
        } else {
            boolean giftCardButtonForTenderTNF = generalUtility.isElementEnabled(giftCardButtonTNF);
            Assert.assertTrue("Gift card tender button not enabled", giftCardButtonForTenderTNF);
        }
    }

    public void errorMessagePopupValidation() {
        String brand = properties.getProperty("Brand");
        boolean errorPopup;
        if (brand.equals("TBL")) {
            errorPopup = generalUtility.isElementEnabled(giftCardErrorMessagePopUpInvalidGiftCard);
        } else {
            errorPopup = generalUtility.isElementEnabled(giftCardErrorMessagePopUpInvalidGiftCardTNF);
        }
        Assert.assertTrue("No error message showing while adding invalid gift card details", errorPopup);
    }


    public void closeErrorPopup() {
        mobileActions.clickOnElement(errorMessageCloseButton);
    }

    public void isErrorMessageDisplayed() {
        mobileActions.clickOnElement(giftCardHeader);
        boolean errorMessage = generalUtility.isElementDisplayed(giftCardAmountErrorMessage);
        assertTrue("No Error Message Displayed", errorMessage);
    }

    public void enterValidGiftCardAmount(String amount) {
        mobileActions.clearAndEnterText(clearAndEnterGiftCardAmount, amount);
    }

    public void isIssueButtonDisabled() {
        clickOnGiftCardIssueButton();
        generalUtility.isElementDisplayed(giftCardHeader);
    }

    public void validateDiscountNotApplicableToGiftCardPopUp() {
        boolean errorPopUp = generalUtility.isElementDisplayed(discountNotApplicableToGiftCardError);
        Assert.assertTrue("Discounts applying to gift card", errorPopUp);
    }

    public void clickOnGiftCardButtonRefund() {
        generalUtility.isElementDisplayed(refundGiftCard);
        mobileActions.clickOnElement(refundGiftCard);
    }

    public void giftCardAmountErrorMessage() {
        String errorMessage = generalUtility.getTextFromElement(minimumAmountError);
        assertTrue("Error message has not been displayed", errorMessage.contains("The entered value isn't allowed"));
    }

    public void isAddValueButtonDisabled() {
        clickOnAddValueButton();
        generalUtility.isElementDisplayed(giftCardHeader);
    }

    public void validateTransactionalDiscountNotApplicableToGiftCardPopUp() {
        boolean errorPopUp = generalUtility.isElementDisplayed(transactionalDiscountNotApplicableToGiftCardPopUp);
        Assert.assertTrue("Transactional discounts applying to gift card", errorPopUp);
    }

    public void validateGiftCardBalance() {
        Assert.assertTrue("Gift card not issued", giftCardBalanceAmount.equalsIgnoreCase(saveGiftCardIssueAmount));
    }

    public void clickOnTenderExchangeCashButton() {
        mobileActions.clickOnElement(tenderExchangeCashButton);
    }

    public void validateGiftCardBalanceAfterTopUp() {
        String giftCardCurrentBalance = giftCardBalanceAmount;
        Assert.assertTrue("Gift card balance mismatch", giftCardBalanceAmount.equalsIgnoreCase(giftCardCurrentBalance));
    }

    public void validateBalanceRequiredErrorMessage() {
        String errorMessage = generalUtility.getTextFromElement(balanceRequiredErrorMessage);
        assertTrue("Error message has not been displayed", errorMessage.contains("Required"));
    }

    public void clickOnSwipeButton() throws InterruptedException {
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(swipeButton);
    }

    public void navigateToGiftCardBalanceInquiryPage() {
        mobileActions.clickOnElement(basketPage.hamburgerButton);
        mobileActions.waitAndClickOnElement(basketPage.giftCardBalance, 5);
    }

    public void clickOnBalanceSwipeButton(){
        mobileActions.clickOnElement(balanceInquiryHeader);
        mobileActions.clickOnElement(balanceSwipeButton);
    }

    public void enterWrongPin(int index) {
        String pin = null;
        try {
            pin = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "pin");
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        apiHelper.enterPin(properties.getProperty("RoboticsStation"), pin, "ok");
    }

    public void closeInvalidPopUpWindow() {
        generalUtility.isElementDisplayed(invalidPinErrorMessage);
        mobileActions.clickOnElement(closeButton);
    }

    public void giftCardBalanceBySwiping(int index) throws IOException, ParseException, InterruptedException {
        mobileActions.clickOnElement(basketPage.hamburgerButton);
        Thread.sleep(500); //Delay is to open up the list and select Gift Card Balance
        mobileActions.clickOnElement((basketPage.giftCardBalance));
        mobileActions.clickOnElement(swipeButton);

        new Thread(() -> {
            String pin = null;
            try {
                pin = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "pin");
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            apiHelper.enterPin(properties.getProperty("RoboticsStation"), pin, "ok");
        }).start();
    }

    public void clicksBackButtonOnBalanceInquiryPageAfterErrorValidation(){
        String errorMessage = generalUtility.getTextFromElement(balanceInquiryErrorMessgae);
        assertTrue("Test failed: Custom Message is not correctly displayed", errorMessage.contains("Balance inquiry unsuccessful Refusal"));
        mobileActions.clickOnElement(balanceInquiryBackButton);
    }

    public void tenderExchangeErrorMessage(){
        String errorMessage = generalUtility.getTextFromElement(tenderExchangeErrorMessage);
        assertTrue("Test Failed: Tender Exchange error message not displayed", errorMessage.contains("Balance inquiry unsuccessful"));
    }

    public void clickTenderExchangeBackButton(){
        mobileActions.clickOnElement(tenderExchangeBackButton);
    }

    public void clickOnTenderExchangeSwipeButton(){
        mobileActions.clickOnElement(tenderExchangeSwipeButton);
    }
}





