package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.BasketPage;
import aptos.pages.StoreOperationsPage;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

import java.io.IOException;

public class StoreOperationsPageStepDefinition extends TestBase {


    StoreOperationsPage storeOperationPage = new StoreOperationsPage();
    BasketPage basketPage = new BasketPage();
    MobileActions mobileActions = new MobileActions();

    public StoreOperationsPageStepDefinition() throws IOException {
    }

    @And("the sales assistant clicks on {string} for cash management")
    public void theSalesAssistantClicksOn(String operation) {
        storeOperationPage.clickOnStoreOperationItemsByName(operation);
    }

    @And("the sales assistant assign enter the amount {int}")
    public void theSalesAssistantAssignEnterTheAmount(int amount) {
        storeOperationPage.enterAmount(amount);
    }

    @And("the sales assistant clicks on Select a reason code for cash management")
    public void theSalesAssistantClicksOnSelectAReasonCodeForCashManagement() {
        storeOperationPage.selectReasonCode();
    }

    @And("the sales assistant void the transaction from till operation page")
    public void theSalesAssistantVoidTheTransactionFromTillOperationPage() {
        storeOperationPage.clickOnTillOperator();
        storeOperationPage.clickOnOkButton();
    }

    @And("the sales assistant clicks on store operations from header")
    public void theSalesAssistantClicksOnStoreOperationsFromHeader() {
        storeOperationPage.clickOnStoreOperationsHeader();
    }

    @And("the sales assistant clicks on proceed button")
    public void theSalesAssistantClicksOnProceedButton() {
        storeOperationPage.clickOnProceedButton();
    }

    @And("the sales assistant clicks on counted amount for till out")
    public void theSalesAssistantClicksOnCountedAmountForTillOut() {
        storeOperationPage.clickOnCountedAmount();
    }

    @And("the sales assistant clicks on counted amount for till in")
    public void theSalesAssistantClicksOnCountedAmountForTillIn() throws InterruptedException {
        mobileActions.clickHideKeyboard();
        storeOperationPage.clickOnCountedAmount();
    }

    @And("the sales assistant enters the quantity as {int} on first index")
    public void theSalesAssistantEntersTheQuantityAsOnFirstIndex(int qty) {
        storeOperationPage.enterFirstQuantity(qty);
    }

    @And("the sales assistant assign click on done")
    public void theSalesAssistantAssignClickOnDone() {
        storeOperationPage.clickOnDone();
    }

    @And("the sales assistant clicks on proceed button from variance in amount")
    public void theSalesAssistantClicksOnProceedButtonFromVarianceInAmount() {
        storeOperationPage.clicksOnProceedButtonFromVarianceInAmount();
    }

    @And("the sales assistant clicks on GO to basket button")
    public void theSalesAssistantClicksOnGOToBasketButton() {
        storeOperationPage.clickOnGoToBasketButton();
    }

    @And("the sales assistant clicks on Till out back button")
    public void theSalesAssistantClicksOnTillOutBackButton() {
        storeOperationPage.clickOnTillOutBackButton();
    }

    @And("the sales assistant clicks on till operations back button")
    public void theSalesAssistantClicksOnTillOperationsBackButton() {
        storeOperationPage.clickOnTillOperationBackButton();
    }

    @And("the sales assistant clicks on store operations back button")
    public void theSalesAssistantClicksOnStoreOperationsBackButton() {
        storeOperationPage.clickOnStoreOperations();
    }

    @And("sales assistant clicks on till out button from variance in amount")
    public void salesAssistantClicksOnTillOutButtonFromVarianceInAmount() throws InterruptedException {
        storeOperationPage.clicksOnTillBackVariance();
    }

    @And("the sales assistant enter the amount")
    public void theSalesAssistantEnterTheAmount() {
        storeOperationPage.clickOnEnterAmount();
    }

    @And("the sales assistant clicks on Till in back button")
    public void theSalesAssistantClicksOnTillInBackButton() {
        storeOperationPage.clickOnTillInBackButtonFromVarianceReason();
    }

    @And("sales assistant clicks on till in button from variance in amount")
    public void salesAssistantClicksOnTillInButtonFromVarianceInAmount() throws InterruptedException {
        storeOperationPage.clickOnTillInBackButtonFromVarianceInAmount();
    }

    @And("the sales assistant clicks on any reason code")
    public void theSalesAssistantClicksOnAnyReasonCode() {
        storeOperationPage.clicksOnAnyReasonCode();
    }

    @And("the sales assistant validates No sale is enabled")
    public void theSalesAssistantValidatesNoSaleIsEnabled() throws InterruptedException {
        storeOperationPage.noSaleIsEnabled();
    }

    @And("the sales assistant validates Tender exchange is enabled")
    public void theSalesAssistantValidatesTenderExchangeIsEnabled() {
        storeOperationPage.tenderExchnageEnabled();
    }

    @And("the sales assistant clicks on No sale")
    public void theSalesAssistantClicksOnNoSale() {
        storeOperationPage.clickOnNoSaleButton();
    }

    @And("the sales assistant clicks on reason code button")
    public void theSalesAssistantClicksOnReasonCodeButton() {
        storeOperationPage.selectReasonCode();
    }

    @Then("the sales assistant validate the receipt options")
    public void theSalesAssistantValidateTheReceiptOptions() {
        storeOperationPage.isReceiptOptionsDisplayed();
    }

    @And("the sales assistant checks an error message is displayed")
    public void theSalesAssistantChecksAnErrorMessageIsDisplayed() {
        storeOperationPage.errorMessageDisplayedOrNot();
    }

    @And("the sales assistant clicks on back arrow button from paid out")
    public void theSalesAssistantClicksOnBackArrowButtonFromPaidOut() {
        storeOperationPage.clickOnBackArrowButton();
    }

    @And("the sales assistant clicks on till operations back button for below security level")
    public void theSalesAssistantClicksOnTillOperationsBackButtonForBelowSecurityLevel() {
        storeOperationPage.clickOnTillOpBelow();
    }

    @And("the sales assistant clicks on back arrow button from paid in")
    public void theSalesAssistantClicksOnBackArrowButtonFromPaidIn() {
        storeOperationPage.clickOnBackButtonFromPaidIn();
    }

    @And("the sales assistant clicks on Select reason code for no sale")
    public void theSalesAssistantClicksOnSelectAReasonCodeForNoSale() {
        storeOperationPage.clickOnNoSaleReasonCode();
    }

    @And("the sales assistant clicks on back button from no sale")
    public void theSalesAssistantClicksOnBackButtonFromNoSale() {
        storeOperationPage.clickOnNoSaleBackArrowButton();
    }

    @And("the sales assistant validates the reason code list for no sale")
    public void theSalesAssistantValidatesTheReasonCodeList() {
        storeOperationPage.validateNoSaleReasonCode();
    }

    @And("the sales assistant validate if reason code is displayed in alphabetic order")
    public void theSalesAssistantValidateIfReasonCodeIsDisplayedInAlphabeticOrder() {
        storeOperationPage.isReasonCodeDisplayedInAlphabeticOrder();
    }

    @And("the sales assistant validate price entry prompt is displayed")
    public void theSalesAssistantValidatePriceEntryPromptIsDisplayed() {
        storeOperationPage.isPriceEntryPromptDisplayed();
    }

    @And("the sales assistant edit price as {int}")
    public void theSalesAssistantEditPriceAs(int amount) throws InterruptedException {
        amount = amount * 100;
        storeOperationPage.enterPriceToTheItem(String.valueOf(amount));
    }

    @And("the sales assistant clicks on Tender exchange button")
    public void theSalesAssistantClicksOnTenderExchangeButton() {
        storeOperationPage.clickOnTenderExchangeButton();
    }

    @And("the sales assistant validate only cash option is available for exchange")
    public void theSalesAssistantValidateOnlyCashOptionIsAvailableForExchange() {
        storeOperationPage.validateOnlyCashOptionIsAvailableForTenderExchange();
    }

    @And("the sales assistant clicks on continue button to exchange")
    public void theSalesAssistantClicksOnContinueButtonToExchange() {
        storeOperationPage.clicksOnContinueButton();
    }

    @And("the sales assistant clicks on cancel button from tender exchange")
    public void theSalesAssistantClicksOnCancelButtonFromTenderExchange() {
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant clicks on any reason code TNF")
    public void theSalesAssistantClicksOnAnyReasonCodeTNF() {
        storeOperationPage.clicksOnAnyReasonCode();
    }

    @And("the sales assistant enters the amount for Till Audit")
    public void theSalesAssistantEntersTheAmountForTillAudit() {
        storeOperationPage.enterTheExpectedAmount();
    }

    @And("the sales assistant validate that the receipt is reprinted")
    public void theSalesAssistantValidateThatTheReceiptIsReprinted() {
        storeOperationPage.validateReceiptReprinted();
    }

    @And("the sales assistant validate if reason code is displayed in alphabetic order for Paid In")
    public void theSalesAssistantValidateIfReasonCodeIsDisplayedInAlphabeticOrderForPaidIn() {
        storeOperationPage.isReasonCodeDisplayedAlphabeticOrderForPaidIn();
    }

    @And("the sales assistant validate all the reason codes for Paid In")
    public void theSalesAssistantValidateAllTheReasonCodesForPaidIn() {
        storeOperationPage.validateAllPaidInReasonCodes();
    }
}
