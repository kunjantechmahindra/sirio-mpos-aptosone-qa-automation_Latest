package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.BasketPage;
import aptos.pages.DiscountPage;
import io.cucumber.java.en.And;

import java.io.IOException;

public class DiscountPageStepDefinition extends TestBase {

    DiscountPage discountPage = new DiscountPage();
    BasketPage basketPage = new BasketPage();

    public static Double discountPercentage;
    public static int amountDiscount;

    public DiscountPageStepDefinition() throws IOException {
    }

    @And("the sales assistant select transaction discount button")
    public void theSalesAssistantSelectTransactionDiscountButton() {
        discountPage.clickOnTransactionDiscount();
    }

    @And("the sales assistant enter discount amount as {int}")
    public void theSalesAssistantEnterDiscountAmountAs(int discount) {
        amountDiscount = discount;
        discount = discount * 100;
        discountPage.enterTransactionDiscountAmount(String.valueOf(discount));
    }

    @And("the sales assistant clicks on Select a reason code button")
    public void theSalesAssistantClicksOnSelectAReasonCodeButton() throws InterruptedException {
        discountPage.clickOnSelectAReasonButton();
    }

    @And("the sales assistant clicks on Apply button")
    public void theSalesAssistantClicksOnApplyButton() {
        discountPage.clickOnApplyButton();
    }

    @And("the sales assistant validate the discount applied as {string}")
    public void theSalesAssistantValidateTheDiscountAppliedAs(String discount) throws InterruptedException {
        discountPage.getDiscountAmount(discount);
    }

    @And("the sales assistant clicks on percentage button")
    public void theSalesAssistantClicksOnPercentageButton() throws InterruptedException {
        discountPage.clickOnPercentageButton();
    }

    @And("the sales assistant enter discount percentage as {int}")
    public void theSalesAssistantEnterDiscountPercentageAs(int percentage) {
        discountPage.enterTransactionDiscountPercentage(String.valueOf(percentage));
        discountPercentage = (double) percentage;
    }

    @And("the sales assistant validate error message for exceeding discount threshold value")
    public void theSalesAssistantValidateErrorMessageForExceedingDiscountThresholdValue() throws InterruptedException {
        discountPage.clickOnPercentageButton(); //to hide the keyboard
        discountPage.validateLimitOfPercentageDiscount();
    }

    @And("the sales assistant reenter discount percentage as {int}")
    public void theSalesAssistantReenterDiscountPercentageAs(int percentage) {
        discountPage.reenterDiscountPercentage(String.valueOf(percentage));
    }

    @And("the sales assistant validate manager approval is displayed and discount is blocked")
    public void theSalesAssistantValidateManagerApprovalIsDisplayedAndDiscountIsBlocked() throws InterruptedException {
        discountPage.validateManagerApprovalPopUp();
    }

    @And("the sales assistant checks an error message is displayed and clicks on cancel button from discount page")
    public void theSalesAssistantChecksAnErrorMessageIsDisplayedAndClicksOnCancelButtonFromDiscountPage() {
        discountPage.validatePopUpAndClicksOnCancelButton();
    }

    @And("the sales assistant validates an error message while entering discount percentage above {int}")
    public void theSalesAssistantValidatesAnErrorMessageWhileEnteringDiscountPercentageAbove(int percentage) {
        discountPage.validateErrorMessageInDiscountPageEnteringPerAmountExceeds();
    }

    @And("the sales assistant validates the error message for gift card discount")
    public void theSalesAssistantValidatesTheErrorMessageForGiftCardDiscount() {
        discountPage.validateDiscountNotApplicableToGiftCardPopUp();
        discountPage.closeErrorPopup();

    }
}