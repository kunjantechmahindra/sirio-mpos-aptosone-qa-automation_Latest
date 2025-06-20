package aptos.stepDefinition;

import aptos.pages.GiftCardPage;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.TestDataHelper;
import io.cucumber.java.en.And;
import io.cucumber.java.eo.Do;
import org.json.simple.parser.ParseException;

import java.io.IOException;

import static aptos.base.TestBase.properties;

public class GiftCardStepDefinition {

    GiftCardPage giftCardPage = new GiftCardPage();

    public static String saveGiftCardIssueAmount;
    public static String giftCardCurrentBalance;

    public GiftCardStepDefinition() throws IOException {
    }

    @And("the sales assistant clicks on gift card button")
    public void theSalesAssistantClicksOnGiftCardButton() {
        giftCardPage.clickOnGiftCardButton();
    }

    @And("the sales assistant enters gift card number from index {int}")
    public void theSalesAssistantEntersGiftCardNumberFromIndex(int index) throws IOException, ParseException {
        giftCardPage.enterGiftCardNumber(index);
        giftCardPage.clickOnDoneKey();
    }

    @And("the sales assistant enters gift card amount {int}")
    public void theSalesAssistantEntersGiftCardAmount(int giftCardAmount) {
        giftCardAmount = giftCardAmount * 100;
        giftCardPage.enterGiftCardAmount(String.valueOf(giftCardAmount));
        // saveGiftCardIssueAmount = Double.parseDouble(giftCardPage.saveGiftCardAmount(giftCardAmount));
    }

    @And("the sales assistant clicks on issue button")
    public void theSalesAssistantClicksOnIssueButton() {
        giftCardPage.clickOnDoneKey();
    }

    @And("the sales assistant clicks on existing gift card button")
    public void theSalesAssistantClicksOnExistingGiftCardButton() {
        giftCardPage.clickOnExistingCardButton();
    }

    @And("the sales assistant clicks on add value button")
    public void theSalesAssistantClicksOnAddValueButton() {
        giftCardPage.clickOnDoneKey();
    }

    @And("the sales assistant clicks on add value button from payment page")
    public void theSalesAssistantClicksOnAddValueButtonFromPaymentPage() {
        giftCardPage.clickOnAddValueButton();
    }

    @And("the sales assistant validates gift card quick choice buttons are enabled")
    public void theSalesAssistantValidatesGiftCardQuickChoiceButtonsAreEnabled() {
        giftCardPage.isQuickChoiceAmountForIssueEnabled();
    }

    @And("the sales assistant validates existing gift card button is enabled")
    public void theSalesAssistantValidatesExistingGiftCardButtonIsEnabled() {
        giftCardPage.isExistingGiftCardButtonEnabled();
        giftCardPage.clickOnExistingCardButton();
    }

    @And("the sales assistant validates gift card option is enabled for tender")
    public void theSalesAssistantValidatesGiftCardOptionIsEnabledForTender() {
        giftCardPage.isGiftCardTenderButtonEnabled();
    }

    @And("the sales assistant clicks on issue button from payment page")
    public void theSalesAssistantClicksOnIssueButtonFromPaymentPage() {
        giftCardPage.clickOnGiftCardIssueButton();
    }

    @And("the sales assistant validates the error message")
    public void theSalesAssistantValidatesTheErrorMessage() {
        giftCardPage.errorMessagePopupValidation();
        giftCardPage.closeErrorPopup();
    }

    @And("the sales assistant validate the displayed error message")
    public void theSalesAssistantValidateTheDisplayedErrorMessage() {
        giftCardPage.isErrorMessageDisplayed();
    }

    @And("the sales assistant validate issue button is disabled")
    public void theSalesAssistantValidateIssueButtonIsDisabled() {
        giftCardPage.isIssueButtonDisabled();
    }

    @And("the sales assistant enters valid gift card amount {string}")
    public void theSalesAssistantEntersValidGiftCardAmount(String giftCardAmount) {
        giftCardPage.enterValidGiftCardAmount(giftCardAmount);
    }

    @And("the sales assistant enters gift card amount {string}")
    public void theSalesAssistantEntersGiftCardAmount(String giftCardAmount) {
        System.out.println(giftCardAmount);
        giftCardPage.enterGiftCardAmount(giftCardAmount);
        saveGiftCardIssueAmount = giftCardAmount;
        System.out.println(saveGiftCardIssueAmount);
    }

    @And("the sales assistant clicks on gift card button from Refund")
    public void theSalesAssistantClicksOnGiftCardButtonFromRefund() {
        giftCardPage.clickOnGiftCardButtonRefund();
    }

    @And("the sales assistant enters minimum gift card amount {string}")
    public void theSalesAssistantEntersMinimumGiftCardAmount(String giftCardAmount) {
        giftCardPage.enterGiftCardAmount(String.valueOf(giftCardAmount));
    }

    @And("the sales assistant enters maximum gift card amount {string}")
    public void theSalesAssistantEntersMaximumGiftCardAmount(String giftCardAmount) {
        giftCardPage.enterGiftCardAmount(String.valueOf(giftCardAmount));
    }

    @And("the sales assistant validates the Minimum issue amount error message")
    public void theSalesAssistantValidatesTheMinimumIssueAmountErrorMessage() {
        giftCardPage.clickOnDoneKey();
        giftCardPage.giftCardAmountErrorMessage();
    }

    @And("the sales assistant validates the Maximum issue amount error message")
    public void theSalesAssistantValidatesTheMaximumIssueAmountErrorMessage() {
        giftCardPage.clickOnDoneKey();
        giftCardPage.giftCardAmountErrorMessage();
    }

    @And("the sales assistant validates the error message for gift card discount and price override")
    public void theSalesAssistantValidatesTheErrorMessageForGiftCardDiscount() {
        giftCardPage.validateDiscountNotApplicableToGiftCardPopUp();
        giftCardPage.closeErrorPopup();
    }

    @And("the sales assistant validates the gift card balance")
    public void theSalesAssistantValidatesTheGiftCardBalance() {
        giftCardPage.validateGiftCardBalance();
    }

    @And("the sales assistant validate transactional level discount don't applied to issued gift card")
    public void theSalesAssistantValidateTransactionalLevelDiscountDonTAppliedToIssuedGiftCard() {
        giftCardPage.validateTransactionalDiscountNotApplicableToGiftCardPopUp();
        giftCardPage.closeErrorPopup();
    }

    @And("the sales assistant validate add value is disabled")
    public void theSalesAssistantValidateAddValueIsDisabled() {
        giftCardPage.isAddValueButtonDisabled();
    }

    @And("the sales assistant validates the gift card balance after applying discounts")
    public void theSalesAssistantValidatesTheGiftCardBalanceAfterApplyingDiscounts() {
        giftCardPage.validateGiftCardBalanceAfterTopUp();
    }

    @And("the sales assistant validates the error message for minimum value")
    public void theSalesAssistantValidatesTheErrorMessageForMinimumValue() {
        giftCardPage.clickOnDoneKey();
        giftCardPage.validateBalanceRequiredErrorMessage();
    }

    @And("the sales assistant clicks on Cash for Exchange")
    public void theSalesAssistantClicksOnCashForExchange() {
        giftCardPage.clickOnTenderExchangeCashButton();
    }

    @And("the sales assistant clicks on swipe button")
    public void theSalesAssistantClicksOnSwipeButton() throws InterruptedException {
        giftCardPage.clickOnSwipeButton();
    }

    @And("the sales assistant navigate to gift card balance inquiry page")
    public void theSalesAssistantNavigateToGiftCardBalanceInquiryPage() {
        giftCardPage.navigateToGiftCardBalanceInquiryPage();
    }

    @And("the sales assistant clicks on balance swipe button")
    public void theSalesAssistantClicksOnBalanceSwipeButton(){
        giftCardPage.clickOnBalanceSwipeButton();
    }

    @And("the sales assistant enter wrong pin number from index {int}")
    public void theSalesAssistantEnterWrongPinNumberFromIndex(int index) {
        giftCardPage.enterWrongPin(index);
    }

    @And("the sales assistant close the invalid pin pop up window")
    public void theSalesAssistantCloseTheInvalidPinPopUpWindow() {
        giftCardPage.closeInvalidPopUpWindow();
    }

    @And("the sales assistant validates the Gift Card balance by swiping the card from index {int}")
    public void theSalesAssistantValidatesTheGiftCardBalanceBySwipingTheCardFromIndex(int index) throws IOException, ParseException, InterruptedException {
        giftCardPage.giftCardBalanceBySwiping(index);
    }

    @And("the sales assistant clicks the back button on balance inquiry page after validating error message")
    public void theSalesAssistantClicksTheBackButtonOnBalanceInquiryPageAfterValidatingErrorMessage() {
        giftCardPage.clicksBackButtonOnBalanceInquiryPageAfterErrorValidation();
    }

    @And("the sales assistant validates Tender Exchange error message")
    public void theSalesAssistantValidatesTenderExchangeErrorMessage() {
        giftCardPage.tenderExchangeErrorMessage();
    }

    @And("the sales assistant clicks on back button from Tender Exchange")
    public void theSalesAssistantClicksOnBackButtonFromTenderExchange() {
        giftCardPage.clickTenderExchangeBackButton();
    }

    @And("the sales assistant clicks on swipe button from Tender Exchange")
    public void theSalesAssistantClicksOnSwipeButtonFromTenderExchange() {
        giftCardPage.clickOnTenderExchangeSwipeButton();
    }
}
