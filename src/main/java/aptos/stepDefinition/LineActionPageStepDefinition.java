package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.BasketPage;
import aptos.pages.LineActionPage;
import io.cucumber.java.en.And;

import java.io.IOException;

import static aptos.pages.LineActionPage.priceOverRideAmount;

public class LineActionPageStepDefinition extends TestBase {

    LineActionPage lineActionPage = new LineActionPage();
    BasketPage basketPage = new BasketPage();

    public static int taxAmount;

    public static int changeQuantityCount;

    public LineActionPageStepDefinition() throws IOException {
    }

    @And("the sales assistant selects {string} Option from line Action")
    public void theSalesAssistantSelectsOptionFromLineAction(String option) {
        lineActionPage.clickOnLineActionItem(option);
    }

    @And("the sales assistant selects {string} Option from basket page")
    public void theSalesAssistantSelectsOptionFromBasketPage(String option) {
        lineActionPage.clickOnLineActionItem(option);
    }

    @And("the sales assistant enter price as {int}")
    public void theSalesAssistantEnterPriceAs(int priceOverRideGivenAmount) {
        int amount = priceOverRideGivenAmount * 100;
        lineActionPage.enterOverridePrice(String.valueOf(amount));
        priceOverRideAmount = String.valueOf(priceOverRideGivenAmount);
    }

    @And("the sales assistant select transaction discount")
    public void theSalesAssistantSelectTransactionDiscount() {
        lineActionPage.clickOnTransactionDiscount();
    }

    @And("the sales assistant clicks on confirm button")
    public void theSalesAssistantClicksOnConfirmButton() {
        lineActionPage.clickOnConfirmButton();
    }

    @And("the sales assistant enter new tax as {int}")
    public void theSalesAssistantEnterNewTaxAs(int tax) throws InterruptedException {
        lineActionPage.enterTaxPercentage(tax);
        lineActionPage.clickOnApplyButton();
    }

    @And("the sales assistant enter the tax ID")
    public void theSalesAssistantEnterTheTaxID() {
        lineActionPage.enterTaxID();
    }

    @And("the sales assistant clicks on reason code as tax exempt")
    public void theSalesAssistantClicksOnReasonCodeAsTaxExempt() {
        lineActionPage.enterTaxExemptReasonCode();
    }

    @And("the sales assistant clicks on Select a reason code button on tax exempt page")
    public void theSalesAssistantClicksOnSelectAReasonCodeButtonOnTaxExemptPage() {
        lineActionPage.clickOnReasonCodeTaxExempt();
    }

    @And("the sales assistant clicks on amount button for tax override")
    public void theSalesAssistantClicksOnAmountButton() {
        lineActionPage.clickOnTaxOverrideAmount();
    }


    @And("the sales assistant enter new tax amount as {int}")
    public void theSalesAssistantEnterNewTaxAmountAs(int amount) {
        //for tax override detailed calculation
        taxAmount = amount;
        String taxOverrideAmount = String.valueOf(amount * 100);
        lineActionPage.enterNewTaxAmount(taxOverrideAmount);
        lineActionPage.clickOnApplyButton();
    }

    @And("the sales assistant validate if tax exempt button is enabled")
    public void theSalesAssistantValidateIfTaxExemptButtonIsEnabled() {
        lineActionPage.isTaxExemptButtonEnabled();
    }

    @And("the sales assistant validate if tax override button is enabled")
    public void theSalesAssistantValidateIfTaxOverrideButtonIsEnabled() {
        lineActionPage.isTaxOverrideButtonEnabled();
    }

    @And("the sales assistant validate if tax override button is unavailable")
    public void theSalesAssistantValidateIfTaxOverrideButtonIsUnavailable() {
        lineActionPage.isTaxOverRideButtonUnAvailable();
    }

    @And("the sales assistant validates Price override line action function is enabled")
    public void theSalesAssistantValidatesPriceOverrideLineActionFunctionIsEnabled() {
        lineActionPage.isPriceOverRideButtonEnabled();
    }

    @And("the sales assistant selects {string} as the comment")
    public void theSalesAssistantSelectsAsTheComment(String comment) {
        lineActionPage.itemComments(comment);
    }

    @And("the sales assistant validates comment tag is added to the product")
    public void theSalesAssistantValidatesCommentTagIsAddedToTheProduct() throws InterruptedException {
        lineActionPage.validateItemComment();
    }

    @And("the sales assistant validate gift receipt option at line level is enable")
    public void theSalesAssistantValidateGiftReceiptOptionAtLineLevelIsEnable() {
        lineActionPage.isGiftReceiptAtItemLevelEnable();
    }

    @And("the sales assistant validates void item button is enable")
    public void theSalesAssistantValidatesVoidItemButtonIsEnable() {
        lineActionPage.isVoidItemButtonEnabled();
    }

    @And("the sales assistant enter minimum amount as {string}")
    public void theSalesAssistantEnterMinimumAmountAs(String amount) {
        lineActionPage.enterOverridePrice(amount);
    }

    @And("the sales assistant validates reason code is mandatory for transactional level tax exempt")
    public void theSalesAssistantValidatesReasonCodeIsMandatoryForTransactionalLevelTaxExempt() {
        lineActionPage.isReasonCodeExists();
    }

    @And("the sales assistant validate error message prompt")
    public void theSalesAssistantValidateErrorMessagePrompt() {
        lineActionPage.isErrorPromptDisplayed();
    }

    @And("the sales assistant validates Change Quantity button from line Action")
    public void theSalesAssistantValidatesChangeQuantityButtonFromLineAction() throws InterruptedException {
        lineActionPage.changeQuantityButton();
    }

    @And("the sales assistant stores Current tax rate")
    public void theSalesAssistantStoresCurrentTaxRate() {
        lineActionPage.storeCurrentTaxRate();
    }

    @And("the sales assistant validate {string} $off applied correctly")
    public void theSalesAssistantValidate$offAppliedCorrectly(String amountOff) {
        lineActionPage.validateAmountOffApplied(amountOff);
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant clicks on HST Exemption")
    public void theSalesAssistantClicksOnHSTExemption() {
        lineActionPage.selectHSTExemptions();
    }

    @And("the sales assistant clicks on PST Exemption")
    public void theSalesAssistantClicksOnPSTExemption() {
        lineActionPage.selectPSTExemptions();
    }

    @And("the sales assistant enters maximum price")
    public void theSalesAssistantEntersMaximumPrice() {
        //if (properties.getProperty("StoreNumber").equals("400528")) {
        lineActionPage.itemPriceOverrideMaximumPrice();
        //}
    }

    @And("the sales assistant enter less price")
    public void theSalesAssistantEnterLessPrice() {
        lineActionPage.itemPriceOverrideLessPrice();
    }

    @And("the sales assistant validates Change Quantity button is available")
    public void theSalesAssistantValidatesChangeQuantityButtonIsAvailable() throws InterruptedException {
        lineActionPage.changeQuantityButtonValidation();
    }

    @And("the sales assistant clicks on GST & PST Exemption")
    public void theSalesAssistantClicksOnGSTPSTExemption() {
        if (properties.getProperty("StoreNumber").equals("101214")) {
            lineActionPage.selectGSTPSTExemptions();
        }
    }

    @And("the sales assistant enter maximum amount as {string}")
    public void theSalesAssistantEnterMaximumAmountAs(String amount) {
        lineActionPage.enterOverridePrice(amount);
    }

    @And("the sales assistant increase quantity by {int}")
    public void theSalesAssistantIncreaseQuantityBy(int count) {
        changeQuantityCount = count;
        lineActionPage.increaseQuantity(count);
    }

    @And("the sales assistant selects the Change Quantity button")
    public void theSalesAssistantSelectsTheChangeQuantityButton() {
        lineActionPage.selectChangeQuantityButton();
    }

    @And("the sales assistant enters {string} as the quantity")
    public void theSalesAssistantEntersAsTheQuantity(String quantity) throws InterruptedException {
        lineActionPage.enterItemQuantity(quantity);
    }

    @And("the sales assistant validates the error message while giving price below the threshold value")
    public void theSalesAssistantValidatesTheErrorMessageWhileGivingPriceBelowTheThresholdValue() throws InterruptedException {
        lineActionPage.validateErrorMessage();
    }
    @And("the sales assistant enter threshold lower price as {string}")
    public void theSalesAssistantEnterThresholdLowerPriceAs(String thresholdPriceOverrideAmount) {
        lineActionPage.enterThresholdLowerPriceForOverride(thresholdPriceOverrideAmount);
    }

    @And("the sales assistant saves the final price")
    public void theSalesAssistantSavesTheFinalPrice() {
        lineActionPage.savesItemPrice();
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant verify the return price of the Item with Discount")
    public void theSalesAssistantVerifyTheReturnPriceOfTheItemWithDiscount() {
        lineActionPage.verifyReturnPriceForDiscountItem();
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant verify the return price of the TEMP MD item")
    public void theSalesAssistantVerifyTheReturnPriceOfTheTEMPMDItem() {
        lineActionPage.verifyReturnPriceOfTempMD();
        basketPage.clickOnCancelButton();
    }
}
