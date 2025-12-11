package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.EjViewerPage;
import aptos.utility.TestDataHelper;
import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.net.MalformedURLException;

public class EjViewerPageStepDefinition extends TestBase {

    EjViewerPage ejViewerPage = new EjViewerPage();

    public EjViewerPageStepDefinition() throws IOException {
    }

    @And("the sales assistant login to EJViewer")
    public void theSalesAssistantLoginToEJViewer() throws MalformedURLException, InterruptedException {
        TestBase.initializeAppiumDriverForSafari();
        TestBase.launchUrl(properties.getProperty("EJViewerURL"));
        Thread.sleep(5000);
        ejViewerPage.signInToEjViewer();
    }

    @And("the sales assistant enter the store and transaction detail")
    public void theSalesAssistantEnterTheStoreAndTransactionDetail() throws InterruptedException {
        Thread.sleep(3000);
        ejViewerPage.enterTheStoreNumber();
        Thread.sleep(2000);
        ejViewerPage.enterTransactionId();
    }

    @And("the sales assistant validate the payment details")
    public void theSalesAssistantValidateThePaymentDetails() throws InterruptedException {
        ejViewerPage.validatePaymentDetail();
    }

    @And("the sales assistant logout from EJViewer")
    public void theSalesAssistantLogoutFromEJViewer() {
        ejViewerPage.signOutFromEjViewer();
    }

    @And("the sales assistant validate if reason code {string} is displayed")
    public void theSalesAssistantValidateIfReasonCodeIsDisplayed(String reasonCode) {
        ejViewerPage.validateReasonCode(reasonCode);
    }


    @And("the sales assistant validate details {string} in EJ")
    public void theSalesAssistantValidateDetailsInEJ(String details) {
        ejViewerPage.validateDetails(details);
    }

    @And("the sales assistant validates transaction got voided")
    public void theSalesAssistantValidatesTransactionGotVoided() {
        ejViewerPage.validatesTransactionVoided();
    }

    @And("the sales assistant validate the the reason code ID {int}")
    public void theSalesAssistantValidateTheTheReasonCodeID(int reasonCodeID) {
        ejViewerPage.validateReasonCodeID(reasonCodeID);
    }

    @And("the sales assistant clicks on Payment auth details")
    public void theSalesAssistantClicksOnPaymentAuthDetails() {
        ejViewerPage.clickOnPaymentAuthDetails();
    }

    @And("the sales assistant validates the Gift Card balance in EJ")
    public void theSalesAssistantValidatesTheGiftCardBalanceInEJ() {
        ejViewerPage.validateGiftCardBalanceAmountInEJ();
    }

    @And("the sales assistant validate {string} code in EJ")
    public void theSalesAssistantValidateCodeInEJ(String couponName) throws IOException, ParseException {
        String couponCode = TestDataHelper.getCouponCode(properties.getProperty("BrandRegion"), couponName);
        System.out.println(couponCode);
        ejViewerPage.validateDetails(couponCode);
    }

    @And("the sales assistant save the APTnumber from EJ")
    public void theSalesAssistantSaveTheAPTnumberFromEJ() {
        // Write code here that turns the phrase above into concrete actions
        ejViewerPage.saveAPTnumber();
    }
}