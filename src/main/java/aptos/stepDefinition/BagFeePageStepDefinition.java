package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.BagFeePage;
import aptos.pages.PaymentPage;
import io.cucumber.java.en.And;

public class BagFeePageStepDefinition extends TestBase {

    BagFeePage bagFeePage = new BagFeePage();
    PaymentPage paymentPage = new PaymentPage();

    public BagFeePageStepDefinition() {
    }

    @And("the sales assistant clicks on Accept button")
    public void theSalesAssistantClicksOnAcceptButton() {
        if (properties.getProperty("BagFee").equals("Yes")) {
            bagFeePage.clickOnAcceptButton();
        }
    }

    @And("the sales assistant adds {int} bag to the order")
    public void theSalesAssistantAddsBagToTheOrder(int count) {
        for (int i = 0; i < count; i++) {
            bagFeePage.clickOnAddBagFee();
        }
    }

    @And("the sales assistant subtract {int} bag to the order")
    public void theSalesAssistantSubtractBasToTheOrder(int count) {
        for (int i = 0; i < count; i++) {
            bagFeePage.clickOnSubtractBagFee();
        }
    }

    @And("the sales assistant validate if bag quantity is {string}")
    public void theSalesAssistantValidateIfBagQuantityIs(String count) {
        bagFeePage.verifyBagCount(count);
    }

    @And("the sales assistant stores bag fee amount")
    public void theSalesAssistantStoresBagFeeAmountAdded() {
        bagFeePage.storeBagFeeAmount();
    }

    @And("the sales assistant validate bag fee amount")
    public void theSalesAssistantValidateBagFeeAmount() {
        bagFeePage.validateBagFeeAmount();
    }

    @And("the sales assistant validate if Bag Fee page is displayed")
    public void theSalesAssistantValidateIfBagFeePageIsDisplayed() {
        if (properties.getProperty("BagFee").equals("Yes")) {
            bagFeePage.validateBagFeePage();
        } else {
            System.out.println("The store doesn't have Bag fee");
        }
    }

    @And("the sales assistant clicks on cancel button from bag fee page")
    public void theSalesAssistantClicksOnCancelButtonFromBagFeePage() {
        bagFeePage.clickOnBagFeeCancelButton();
    }

    @And("the sales assistant validate if Payment page is displayed instead of Bag Fee page")
    public void theSalesAssistantValidateIfPaymentPageIsDisplayedInsteadOfBagFeePage() {
        paymentPage.paymentPageHeaderIsDisplayed();
    }
}
