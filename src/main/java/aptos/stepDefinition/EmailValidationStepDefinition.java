package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.*;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;


public class EmailValidationStepDefinition extends TestBase {

    EmailValidation emailValidation = new EmailValidation();

    public EmailValidationStepDefinition() {
    }

    @Given("the sales assistant launch the browser and navigate to YOP mail")
    public void theSalesAssistantLaunchTheBrowserAndNavigateToYOPMail() {
        launchChromeInMac();
        launchUrlInChromeMac("https://yopmail.com/en/");
        emailValidation.enterEmailId(properties.getProperty("E-receiptEmail"));
        emailValidation.clickOnLoginButton();
        emailValidation.getEmailData();
    }

    @And("the sales assistant save the return barcode from the email receipt")
    public void theSalesAssistantSaveTheReturnBarcodeFromTheEmail() {
        emailValidation.getReturnBarcode();
    }


    @And("the sales assistant closes the browser window.")
    public void theSalesAssistantClosesTheBrowserWindow() {
        quitChromeBrowserInMac();
    }

    @And("the sales assistant validate the payment details on e-receipt")
    public void theSalesAssistantValidateThePaymentDetailsOnEReceipt() {
        emailValidation.validatePaymentDetail();
    }

    @And("the sales assistant validate the transaction ID in e-receipt")
    public void theSalesAssistantValidateTheTransactionIDInEReceipt() {
        emailValidation.validateTransactionIdInEreceipt();
    }

    @And("the sales assistant validate details {string} in E-receipt")
    public void theSalesAssistantValidateDetailsInEReceipt(String contents) {
        emailValidation.validateContents(contents);
    }

    @And("the sales assistant validate both same item appear on different line items in e-receipt")
    public void theSalesAssistantValidateBothItemAppearOnDifferentLinesInEReceipt() {
        emailValidation.validatesDifferentLineItemDisplayForSameItem();
    }

    @And("the sales assistant validate e-receipt header and footer")
    public void theSalesAssistantValidateEReceiptHeaderAndFooter() {
        emailValidation.validateEReceiptHeader();
        emailValidation.validateEReceiptFooterLastDayOfReturn();
        emailValidation.validateEReceiptAddress();
    }

    @And("the sales assistant validate item images are not displayed to item lines within the virtual receipt")
    public void theSalesAssistantValidateItemImagesAreNotDisplayedToItemLinesWithinTheVirtualReceipt() {
        emailValidation.getNoOfImagesInItemDescription();
    }

    @And("the sales assistant validate UPCs in the e-receipt")
    public void theSalesAssistantValidateUPCsInTheEReceipt() {
        emailValidation.validateUPCInReceipt();
    }
}