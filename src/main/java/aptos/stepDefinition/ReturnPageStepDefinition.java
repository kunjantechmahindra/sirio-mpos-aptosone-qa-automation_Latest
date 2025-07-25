package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.*;
import aptos.utility.ApiHelper;
import aptos.utility.MobileActions;
import aptos.utility.TestDataHelper;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.json.simple.parser.ParseException;

import java.io.IOException;

import static aptos.pages.EmailValidation.returnBarcodeNumber;

public class ReturnPageStepDefinition extends TestBase {

    CustomerPage customerPage = new CustomerPage();
    ReturnPage returnPage = new ReturnPage();
    TestDataHelper testDataHelper = new TestDataHelper();
    BasketPage basketPage = new BasketPage();
    PaymentPage paymentPage = new PaymentPage();
    public static String ProductCodeReturn;
    public static String ProductCode;

    public ReturnPageStepDefinition() throws IOException {
    }

    @And("the sales assistant scan the receipt for returning the item")
    public void theSalesAssistantScanTheReceiptForReturningTheItem() {
        returnPage.clickOnCameraButtonInReturnScreen();
        ApiHelper.displayBarcode("receipt", "UPCA", PaymentPageStepDefinition.saleTransactionID, 4, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
    }

    @And("the sales assistant return all items from the transaction")
    public void theSalesAssistantReturnAllItemsFromTheTransaction() {
        returnPage.clickOnReturnAllButton();
        returnPage.clickOnDoneButton();
    }

    @And("the sales assistant selects {string} as reason code")
    public void theSalesAssistantSelectsAsReasonCode(String reasonCode) {
        returnPage.selectReasonCode(reasonCode);
    }

    @And("the sales assistant sign for the transaction")
    public void theSalesAssistantSignForTheTransaction() {
        returnPage.signForTransaction();
        returnPage.clickOnAcceptButton();
    }

    @And("the sales assistant clicks on {string} button to assign customer")
    public void theSalesAssistantClicksOnButtonToAssignCustomer(String button) {
        if ("ok".equalsIgnoreCase(button)) {
            returnPage.clickOnOkButton();
        } else if ("cancel".equalsIgnoreCase(button)) {
            returnPage.clickOnCancelButton();
        } else {
            throw new IllegalArgumentException("Invalid button: " + button);
        }
    }

    @And("the sales assistant select No receipt for blind return")
    public void theSalesAssistantSelectNoReceiptForBlindReturn() {
        returnPage.clickOnNoReceipt();
    }

    @And("the sales assistant navigate to basket page from return mode page")
    public void theSalesAssistantNavigateToBasketPageFromReturnModePage() {
        returnPage.clickOnBackArrowButton();
    }

    @Then("the sales assistant add an items from {string} product for return")
    public void theSalesAssistantAddAnItemsFromProductForReturn(String productType) throws IOException, ParseException {
        ProductCodeReturn = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
        returnPage.isReturnPageHeaderDisplayed();
        basketPage.clickOnCameraButton();
        ApiHelper.displayBarcode("barcode", "UPCA", ProductCodeReturn, 3, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
    }

    @And("the sales assistant selects the return product at index {int}")
    public void theSalesAssistantSelectsTheReturnProductAtIndexInt(int indexPosition) {
        returnPage.clickReturnProductAtPosition(indexPosition);
    }

    @And("the sales assistant clicks on Done button")
    public void theSalesAssistantClicksOnDoneButton() {
        returnPage.clickOnDoneButton();
    }

    @And("the sales assistant assign the original sale customer to the return transaction")
    public void theSalesAssistantAssignTheOriginalSaleCustomerToTheReturnTransaction() {
        returnPage.clickOkButtonForAssignOriginalSaleCusToReturn();
    }

    @And("the sales assistant selects diners card for refund")
    public void theSalesAssistantSelectsDinersCardForRefund() {
        returnPage.clickOnDinerCardFoRefund();
    }

    @And("the sales assistant validates the return all button is enabled")
    public void theSalesAssistantValidatesTheReturnAllButtonIsEnabled() {
        returnPage.isReturnAllButtonEnabled();
    }

    @And("the sales assistant selects amex card for refund")
    public void theSalesAssistantSelectsAmexCardForRefund() {
        returnPage.clickOnAmexCardFoRefund();
    }

    @And("the sales assistant validate original tender of sale transaction")
    public void theSalesAssistantValidateOriginalTenderOfSaleTransaction() {
        returnPage.isOriginalTenderAvailable();
    }

    @And("the sales assistant validate the return product is added to the basket in index {int}")
    public void theSalesAssistantValidateTheReturnProductIsAddedToTheBasketInIndex(int index) {
        returnPage.isReturnProduct(index);
    }

    @And("the sales validates return mode is enabled with options")
    public void theSalesValidatesReturnModeIsEnabledWithOptions() {
        returnPage.isReturnButtonEnabled();
        returnPage.isReturnEnabledWithOptionCustomerSearch();
        returnPage.isReturnEnabledWithOptionReturnSearch();
        returnPage.isReturnEnableWithOptionNoReceipt();
    }

    @And("the sales assistant clicks back button from Return page")
    public void theSalesAssistantClicksBackButtonFromReturnPage() {
        returnPage.clicksOneReturnPageBackButton();
    }

    @And("the sales assistant clicks on customer search button")
    public void theSalesAssistantClicksOnCustomerSearchButton() {
        returnPage.clickOnCustomerSearchButton();
    }


    @And("the sales assistant assign customer on the return customer search")
    public void theSalesAssistantAssignCustomerOnTheReturnCustomerSearch() {
        customerPage.assignCustomerOnTheReturnCustomerSearch();
    }

    @And("the sales assistant select the transaction to be returned")
    public void theSalesAssistantSelectTheTransactionToBeReturned() {
        returnPage.selectFirstTransactionForReturned();
    }


    @And("the sales assistant validates signature prompt displayed")
    public void theSalesAssistantValidatesSignaturePromptDisplayed() {
        returnPage.isSignaturePadDisplayed();
    }

    @And("the sales assistant clicks on return search button")
    public void theSalesAssistantClicksOnReturnSearchButton() {
        returnPage.clicksOnReturnSearch();
    }

    @And("the sales assistant enters store number {string} terminal {string} and transaction number {string}")
    public void theSalesAssistantEntersStoreNumberTerminalAndTransactionNumber(String store, String terminal, String transactionId) {
        returnPage.entersTransactionDetails(store, terminal, transactionId);
    }

    @And("the sales assistant clicks on continue button")
    public void theSalesAssistantClicksOnContinueButton() {
        returnPage.clicksContinueButton();
    }

    @And("the manager approves the action")
    public void theManagerApprovesTheAction() throws InterruptedException {
        String username;
        String password;
        username = properties.getProperty("SecurityLevelAboveUserName");
        password = properties.getProperty("SecurityLevelAbovePassword");
        returnPage.managerApproval(username, password);
    }

    @And("the sales scan the e-receipt barcode for return")
    public void theSalesScanTheEReceiptBarcodeForReturn() {
        returnPage.clickOnCameraButtonInReturnScreen();
        ApiHelper.displayBarcode("barcode", "Code128", EmailValidation.returnBarcodeNumber, 3, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
    }

    @And("the sales assistant selects the first visa debit")
    public void theSalesAssistantSelectsTheVisaDebitAtIndex() {
        returnPage.clickOnFirstVisaDebitCard();
    }

    @And("the sales assistant selects the second visa debit")
    public void theSalesAssistantSelectsTheSecondVisaDebit() {
        returnPage.clickOnSecondVisaDebitCard();
    }

    @And("the sales assistant select amex card for refund first")
    public void theSalesAssistantSelectAmexCardForRefundFirst() {
        returnPage.clickOnFirstAmexCard();
    }

    @And("the sales assistant select amex card for refund second")
    public void theSalesAssistantSelectAmexCardForRefundSecond() {
        returnPage.clickOnSecondAmexCard();
    }

    @And("the sales assistant select membership reward card for refund")
    public void theSalesAssistantSelectMembershipRewardCardForRefund() {
        returnPage.clickOnMemberShipRewardsReturnButtonInRefund();
    }

    @And("the sales assistant verifies the barcode on the receipt is scanned")
    public void theSalesAssistantVerifiesTheBarcodeOnTheReceiptIsScanned() {
        returnPage.verifyReceiptBarcode();
    }

    @And("the sales assistant enter the return barcode")
    public void theSalesAssistantEnterTheReturnBarcode() {
        returnPage.enterReturnBarcode();
    }

    @And("the sales assistant validate return amount")
    public void theSalesAssistantValidateReturnAmount() {
        returnPage.validateReturnAmount();
    }

    @And("the sales assistant enters the previous transaction number")
    public void theSalesAssistantEntersThePreviousTransactionNumber() throws InterruptedException {
//       String transactionID = paymentPage.getTransactionID();
//       System.out.println("Transaction ID: " + transactionID);
//       returnPage.enterTransactionID(paymentPage.getTransactionID());
        returnPage.enterTransactionID(PaymentPageStepDefinition.saleTransactionID);
        returnPage.selectFirstTransactionForReturned();
    }

    @And("the sales assistant add same return items to the basket")
    public void theSalesAssistantAddSameReturnItemsToTheBasket() {
        System.out.println("upc is " + ProductCodeReturn);
        basketPage.clickOnCameraButton();
        ApiHelper.displayBarcode("barcode", "UPCA", ProductCodeReturn, 3, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
    }

    @And("the sales assistant validate the returnable period expired message and clicks continue")
    public void theSalesAssistantValidateTheReturnablePeriodExpiredMessageAndClicksContinue() {
        returnPage.validateReturnablePeriodExpiredMessageAndClicksContinue();

    }

    @And("the sales assistant clicks back button from return product details page")
    public void theSalesAssistantClicksBackButtonFromReturnProductDetailsPage() {
        returnPage.backFromReturnProductDetailsPage();
    }

    @And("sales assistant give manager approval")
    public void salesAssistantGiveManagerApproval() throws InterruptedException {
        returnPage.managerApprovalCred();
    }

    @And("the sales assistant enters {int} {string} item UPC manually in the return")
    public void theSalesAssistantEntersItemUPCManuallyInTheBasket(int itemCount, String productType) throws IOException, ParseException {
        if (properties.getProperty("BrandRegion").equals("DCK")) {
            ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
            returnPage.enterUPCAManually("00" + ProductCode);
        } else {
            if (itemCount > 0) {
                for (int i = 0; i < itemCount; i++) {
                    ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
                    returnPage.enterUPCAManually("00" + ProductCode);
                }
            }
        }
    }
}
