package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.assertTrue;

public class DiscountPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();

    // Initializing the Page Objects
    public DiscountPage() {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "(//*[@label='Discount'])[last()]")
    WebElement transactionDiscount;

    @FindBy(xpath = "//*[@value='Discount amount']")
    WebElement transactionDiscountAmount;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Select a reason']")
    WebElement selectReasonButton;

    @FindBy(xpath = "(//*[@name='Apply'])[last()]")
    WebElement applyButton;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Discount')][1]")
    WebElement discountAmountLabel;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Percent']")
    WebElement discountPercentageButton;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='0%']")
    WebElement discountPercentageText;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Exceeds allowed value']")
    WebElement percentageErrorMessage;

    @FindBy(xpath = "//XCUIElementTypeTextField[contains(@value, '%')]")
    WebElement discountPercentageTextField;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Manager approval This action requires manager approval. Username Password']")
    WebElement managerApprovalPopUp;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Cancel'])[2]")
    WebElement cancelButtonFromManagerApprovalPopUp;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Cancel'])[last()]")
    WebElement cancelButtonOnlineItemAction;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Additional permission is required.']")
    WebElement errorMessagePopUp;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement buttonClosePopUp;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Cancel']")
    WebElement buttonCancelFromDiscount;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Exceeds allowed value']")
    WebElement exceededValuesErrorMessage;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name=\"Gift cards can't be discounted.\"]")
    WebElement discountNotApplicableToGiftCardError;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement errorMessageCloseButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Amount']")
    WebElement discountAmountButton;

    //Actions
    public void clickOnTransactionDiscount() {
        mobileActions.clickOnElement(transactionDiscount);
    }

    public void clickOnPercentageButton() throws InterruptedException {
        mobileActions.iPhoneHideKeyboard();
        mobileActions.clickOnElement(discountPercentageButton);
    }

    public void clickOnAmountButton() throws InterruptedException {
        mobileActions.iPhoneHideKeyboard();
        mobileActions.clickOnElement(discountAmountButton);
    }

    public void enterTransactionDiscountAmount(String amount) {
        mobileActions.enterText(transactionDiscountAmount, amount);
    }

    public void enterTransactionDiscountPercentage(String percentage) {
        mobileActions.enterText(discountPercentageText, percentage);
    }

    public void clickOnSelectAReasonButton() throws InterruptedException {
        mobileActions.iPhoneHideKeyboard();
        mobileActions.clickOnElement(selectReasonButton);
    }

    public void clickOnApplyButton() {
        mobileActions.clickOnElement(applyButton);
    }

    public void getDiscountAmount(String discount) throws InterruptedException {
        Thread.sleep(3000);     //Delay for the discount to get applied
        String discountText = generalUtility.getTextFromElement(discountAmountLabel);
        Assert.assertTrue("Expected discount not found in the text", discountText.contains(discount));
    }

    public void validateLimitOfPercentageDiscount() {
        Assert.assertTrue("Error message is not showing for Exceeds value",generalUtility.isElementDisplayed(percentageErrorMessage));
    }

    public void reenterDiscountPercentage(String percentage) {
        discountPercentageTextField.clear();
        mobileActions.enterText(discountPercentageTextField, percentage);
    }

    public void validateManagerApprovalPopUp() throws InterruptedException {
        mobileActions.clickHideKeyboard();
        generalUtility.isElementDisplayed(managerApprovalPopUp);
        mobileActions.clickOnElement(cancelButtonFromManagerApprovalPopUp);
        mobileActions.clickOnElement(cancelButtonOnlineItemAction);
    }

    public void validatePopUpAndClicksOnCancelButton()
    {
        boolean status = generalUtility.isElementDisplayed(errorMessagePopUp);
        assertTrue("Error message not displayed", status);
        mobileActions.clickOnElement(buttonClosePopUp);
        mobileActions.clickOnElement(buttonCancelFromDiscount);
    }

    public void validateErrorMessageInDiscountPageEnteringPerAmountExceeds()
    {
        boolean status = generalUtility.isElementDisplayed(exceededValuesErrorMessage);
        assertTrue("Exceeds allowed value not displayed", status);
        mobileActions.clickOnElement(cancelButtonOnlineItemAction);
    }

    public void validateDiscountNotApplicableToGiftCardPopUp() {
        boolean errorPopUp = generalUtility.isElementDisplayed(discountNotApplicableToGiftCardError);
        Assert.assertTrue("Discounts applying to gift card", errorPopUp);
    }

    public void closeErrorPopup() {
        mobileActions.clickOnElement(errorMessageCloseButton);
        mobileActions.clickOnElement(cancelButtonOnlineItemAction);
    }
}