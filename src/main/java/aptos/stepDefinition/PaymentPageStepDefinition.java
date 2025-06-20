package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.PaymentPage;
import aptos.pages.ReturnPage;
import aptos.utility.ApiHelper;
import aptos.utility.TestDataHelper;
import io.cucumber.java.en.And;
import org.json.simple.parser.ParseException;
import org.junit.Assert;

import java.io.IOException;
import java.time.Duration;

public class PaymentPageStepDefinition extends TestBase {
    public static String saleTransactionID;
    public static String totalPaymentSale;
    public static String taxAmountSale;
    public static String discountAmountSale;
    public static String originalPaymentMode;

    private boolean paymentInProgress = false;


    PaymentPage paymentPage = new PaymentPage();
    ApiHelper apiHelper = new ApiHelper();
    ReturnPage returnPage = new ReturnPage();

    public PaymentPageStepDefinition() throws IOException {
    }

    @And("the sales assistant clicks on Cash button")
    public void theSalesAssistantClicksOnCashButton() {
        paymentPage.clickOnCashButton();
    }

    @And("the sales assistant enter the Drawer ID")
    public void theSalesAssistantEnterTheDrawerID() {
        paymentPage.enterDrawerID("10");
        paymentPage.keyboardClickOnDone();
    }

    @And("the sales assistant clicks on Print button")
    public void theSalesAssistantClicksOnPrintButton() {
        paymentPage.clickOnPrintButton();
    }

    @And("the sales assistant select the printer")
    public void theSalesAssistantSelectThePrinter() throws InterruptedException {
        paymentPage.selectPrinterByEnteringName();
        Thread.sleep(5000);
    }

    @And("the sales assistant select the printer and save the receipt for return")
    public void theSalesAssistantSelectThePrinterAndSaveTheReceiptForReturn() throws InterruptedException {
        paymentPage.selectPrinterByEnteringNameAndSaveReceipt();
    }

    @And("the sales assistant enters half of the total amount in the payment section")
    public void theSalesAssistantEntersHalfOfTheTotalAmountInThePaymentSection() {
        paymentPage.enterHalfAmount();
    }

    @And("the sales assistant clicks on Card button")
    public void theSalesAssistantClicksOnCardButton() {
        paymentPage.clickOnCardButton();
    }

    @And("the sales assistant validate if partial payment was success")
    public void theSalesAssistantValidateIfPartialPaymentWasSuccess() throws InterruptedException {
        paymentPage.verifyPartialPaymentCompletionStatus();
    }

    @And("the sales assistant do partial refund to {string} at position {int}")
    public void theSalesAssistantDoPartialRefundToAtPosition(String cardName, int index) {
        paymentPage.selectCardForRefund(cardName, index);
    }

    @And("the sales assistant validate if amount is refunded")
    public void theSalesAssistantValidateIfAmountIsRefunded() {
        paymentPage.verifyRefundHeader();
    }

    @And("the sales assistant save the transaction details of the sales transaction")
    public void theSalesAssistantSaveTheTransactionDetailsOfTheSalesTransaction() {
        saleTransactionID = paymentPage.getTransactionID();
        System.out.println("Sale Txn: "+saleTransactionID);
    }

    @And("the sales assistant save the payment details for the sales transaction")
    public void theSalesAssistantSaveThePaymentDetailsForTheSalesTransaction() {
        totalPaymentSale = paymentPage.getTotalPayment();
        taxAmountSale = paymentPage.getTaxLabel();
        System.out.println(taxAmountSale);
        discountAmountSale = paymentPage.getDiscount();
    }

    @And("the sales assistant processes the payment with a {string} card using a {string} action, entering the pin {string}")
    public void theSalesAssistantProcessesThePaymentWithACardUsingAActionEnteringThePin(String cardName, String subAction, String pin) {
        originalPaymentMode = cardName;
        paymentInProgress = true;
        String position = null;

        switch (cardName.toLowerCase()) {
            case "master":
            case "diners":
                position = "1";
                break;
            case "visa":
            case "discover", "visa debit":
                position = "2";
                break;
            case "amex":
                position = "3";
                break;
            default:
                // Optionally handle unknown card types
                position = "0"; // or set it to a suitable default
                break;
        }

        String finalPosition = position;

        new Thread(() -> {
            apiHelper.roboticAction("card", subAction, finalPosition, pin, Integer.valueOf(properties.getProperty("RoboticsStation")));
            paymentInProgress = false;
        }).start();
    }

    @And("the sales assistant select {string} card for refund")
    public void theSalesAssistantSelectCardForRefund(String card) {
        switch (card.toLowerCase()) {
            case "master":
                paymentPage.clickOnMastCardButton();
                break;
            case "visa":
                // Currently discover and visa are assigned in same card rack for robot
                paymentPage.clickOnVisaCardButton();
                break;
            case "discover":
                paymentPage.clickOnDiscoverCardButton();
                break;
            case "visa debit":
                paymentPage.clickOnVisaDebitCardButton();
                break;
            case "diners":
                paymentPage.clickOnDinersCardButton();
                break;
            default:
                throw new IllegalArgumentException("Unknown card type: " + card);
        }
    }

    @And("the sales assistant validate if partial refund was success")
    public void theSalesAssistantValidateIfPartialRefundWasSuccess() {
        paymentPage.verifyRefundCompletionStatus();
    }

    @And("the sales assistant clicks on card for refund")
    public void theSalesAssistantClicksOnCardForRefund() {
        paymentPage.clickOnCardButtonForRefund();

    }

    @And("the sales assistant clicks on gift card button from payment page")
    public void theSalesAssistantClicksOnGiftCardButtonFromPaymentPage() {
        paymentPage.clickOnGiftCardButton();
    }

    @And("the sales assistant enter the gift card number for payment from index {int}")
    public void theSalesAssistantEnterTheGiftCardNumberForPaymentFromIndex(int index) throws IOException, ParseException {
        paymentPage.enterGiftCardNumber(index);
    }

    @And("the sales assistant clicks on redeem button")
    public void theSalesAssistantClicksOnRedeemButton() throws InterruptedException {
        paymentPage.clickOnRedeemButton();
    }

    @And("the sales assistant enter the the pin from index {int}")
    public void theSalesAssistantEnterTheThePinFromIndex(int index) {
        paymentPage.enterGiftCardPin(index);
    }

    @And("the sales assistant clicks on Email button")
    public void theSalesAssistantClicksOnEmailButton() {
        paymentPage.clickOnEmailButton();
    }

    @And("the sales assistant enter the email")
    public void theSalesAssistantEnterTheEmail() throws InterruptedException {
        paymentPage.enterEmailText();
    }

    @And("the sales assistant enter extra amount")
    public void theSalesAssistantEnterExtraAmount() {
        paymentPage.enterExtraAmount();
    }

    @And("the sales assistant validate change due amount")
    public void theSalesAssistantValidateChangeDueAmount() {
        paymentPage.validateChangeDue();
    }

    @And("the sales assistant validate the partial payment by gift card")
    public void theSalesAssistantValidateThePartialPaymentByGiftCard() {
        paymentPage.isGiftCardPaidLabelDisplayed();
    }

    @And("the sales assistant enter continue without entering mailID")
    public void theSalesAssistantEnterContinueWithoutEnteringMailID() {
        paymentPage.enterContinueButtonWithOutEnteringMailID();
    }

    @And("the sales assistant void the transaction from payment with reason code {string}")
    public void theSalesAssistantVoidTheTransactionFromPaymentWithReasonCode(String reasonCode) throws InterruptedException {
        if (properties.getProperty("BrandRegion").equals("DCK")) {
            paymentPage.voidFromPayment();
        } else {
            paymentPage.voidFromPayment();
            returnPage.selectReasonCode(reasonCode);
        }
        paymentPage.selectPrinterByEnteringName();
    }

    @And("the sales assistant voids the partial payment")
    public void theSalesAssistantVoidsThePartialPayment() throws InterruptedException {
        paymentPage.voidPartialPayment();
    }

    @And("the sales assistant enters {int}% of the total amount in the payment section")
    public void theSalesAssistantEntersOfTheTotalAmountInThePaymentSection(int percentage) {
        paymentPage.enterUpdatedAmount(percentage);
    }

    @And("the sales assistant clicks on Close button from payment page")
    public void theSalesAssistantClicksOnCloseButtonFromPaymentPage() throws InterruptedException {
        Thread.sleep(10000);        //Added delay to accommodate the manual PED decline process
        paymentPage.clickOnCloseButton();
    }

    @And("the sales assistant validate the refund amount is correct")
    public void theSalesAssistantValidateTheRefundAmountIsCorrect() {
        String refundAmount = paymentPage.validateRefundAmount();
        Assert.assertTrue("Refund amount mismatch", (refundAmount.contains(totalPaymentSale)));
    }

    @And("the sales assistant clicks on basket button from payment")
    public void theSalesAssistantClicksOnBasketButtonFromPayment() {
        paymentPage.clickOnBasketIconFromBottomPayment();
    }

    @And("the sales assistant clicks on issue button from payment")
    public void theSalesAssistantClicksOnIssueButtonFromPayment() {
        paymentPage.clickOnIssueButtonFromPayment();
    }

    @And("the sales assistant validates cash option is disabled or not")
    public void theSalesAssistantValidatesCashOptionIsDisabledOrNot() {
        paymentPage.validatesCashButtonDisabledNonReceipt();
    }

    @And("the sales assistant validate the loyalty points in physical receipt")
    public void theSalesAssistantValidateTheLoyaltyPointsInPhysicalReceipt() throws InterruptedException {
        paymentPage.validatesLoyaltyPointsInPhysicalReceipt();
    }

    @And("the sales assistant validate both same item appear on different line item in physical receipt")
    public void theSalesAssistantValidateBothSameItemAppearOnDifferentLineItemInPhysicalReceipt() throws InterruptedException {
        paymentPage.validatesDifferentLineItemDisplayForSameItemInPhysicalReceipt();
    }

    @And("the sales assistant clicks on Email and Print button")
    public void theSalesAssistantClicksOnEmailAndPrintButton() {
        paymentPage.clickOnEmailAndPrintButton();
    }

    @And("the sales assistant validate individual gift receipts are printed for sale and gift")
    public void theSalesAssistantValidateIndividualGiftReceiptsArePrintedForSaleAndGift() throws InterruptedException {
        paymentPage.validatesIndividualGiftReceiptsArePrinted();
    }

    @And("the sales assistant validate salesperson name is not printed in physical receipt")
    public void theSalesAssistantValidateSalespersonNameIsNotPrintedInPhysicalReceipt() {
        paymentPage.validateSalePersonNameIsNotDisplayedInPhysicalReceipt();
    }

    @And("the sales assistant clicks on Membership Reward button")
    public void theSalesAssistantClicksOnMembershipRewardButton() {
        paymentPage.clickOnRewardButton();
    }

    @And("the sale assistant validate no rewards are available")
    public void theSaleAssistantValidateNoRewardsAreAvailable() {
        paymentPage.validateNoRewardsDisplayed();
    }

    @And("the sales assistant validate the physical receipt footer")
    public void theSalesAssistantValidateThePhysicalReceiptFooter() throws InterruptedException {
        paymentPage.validatePhysicalReceiptFooterThankYouMessage();
        paymentPage.validatePhysicalReceiptFooterLastDayOfReturn();
    }

    @And("the sales assistant selects loyalty reward {int}")
    public void theSaleAssistantSelectsLoyaltyReward(int amount) throws InterruptedException {
        String reward = String.valueOf(amount);
        paymentPage.clickOnRewardAny(reward);
    }

    @And("the sales assistant clicks on back button from membership rewards")
    public void theSalesAssistantClicksOnBackButtonFromMembershipRewards() {
        paymentPage.clickOnBackMemberShip();
    }

    @And("the sales assistant validate membership reward applied")
    public void theSalesAssistantValidateMembershipRewardApplied() {
        paymentPage.validateMemberShipApplied();
    }

    @And("the sales assistant validate the customer name of index {int} appears on the printed receipt")
    public void theSalesAssistantValidateTheCustomerNameOfIndexAppearsOnThePrintedReceipt(int number) throws IOException, ParseException, InterruptedException {
        paymentPage.validateCustomerNameInReceipt(number);
    }

    @And("the sales assistant validate available rewards")
    public void theSalesAssistantValidateAvailableRewards() {
        paymentPage.validateAvailableRewards();
    }

    @And("the sales assistant validates the payment decline error message")
    public void theSalesAssistantValidatesThePaymentDeclineErrorMessage() {
        paymentPage.validateGiftCardInsufficientBalanceMessage();
    }

    @And("the sales assistant validate negative exchange order total with bag fee")
    public void theSalesAssistantValidateNegativeExchangeOrderTotalWithBagFee() {
        paymentPage.validateNegativeExchangeTransactionTotalWithBagFee();
    }

    @And("the sales assistant clicks on More button")
    public void theSalesAssistantClicksOnMoreButton() {
        paymentPage.clicksOnMoreButtonInTenders();
    }

    @And("the sales assistant clicks on RCM Tenders")
    public void theSalesAssistantClicksOnRCMTenders() {
        paymentPage.clicksOnRCMTenders();
    }

    @And("the sales assistant clicks on RCM Reason code {string}")
    public void theSalesAssistantClicksOnRCMReasonCode(String reasonCode) {
        paymentPage.clicksOnRCMReasonCode(reasonCode);
    }

    @And("the sales assistant enters the {string} number")
    public void theSalesAssistantEntersTheNumber(String employeeNumber) throws IOException, ParseException {
        String employeeId = TestDataHelper.getEmployeeId(properties.getProperty("BrandRegion"), employeeNumber);
        paymentPage.enterEmployeeNumber(employeeId);
    }

    @And("the sales assistant validates if partial payment is completed with {string}")
    public void theSalesAssistantValidatesIfPartialPaymentIsCompletedWith(String card) {
        paymentPage.validatePartialPaymentStatus(card);
    }

    @And("the sales assistant select the printer wait for gift receipt and save the receipt for return")
    public void theSalesAssistantSelectThePrinterWaitForGiftReceiptAndSaveTheReceiptForReturn() throws InterruptedException {
        paymentPage.selectPrinterWaitAndSaveReceipt();
    }

    @And("the sales assistant clicks on Cash option")
    public void theSalesAssistantClicksOnCashOption() {
        paymentPage.clicksOnCashOption();
    }

    @And("the sales assistant validates the payment decline error message declined")
    public void theSalesAssistantValidatesThePaymentDeclineErrorMessageDeclined() {
        paymentPage.paymentDeclinedErrorMessage();
    }

    @And("the sales assistant clicks on US Dollar")
    public void theSalesAssistantClicksOnUSDollar() {
        paymentPage.clicksOnUSDollar();
    }

    @And("the sales assistant clicks on US Dollar Tender")
    public void theSalesAssistantClicksOnUSDollarTender() {
        paymentPage.clicksOnUSDollarTender();
    }

    @And("the sales assistant enter extra US Dollar")
    public void theSalesAssistantEnterExtraUSDollar() {
        paymentPage.enterExtraUSDollar();
    }

    @And("the sales assistant validate change due amount in US Dollar")
    public void theSalesAssistantValidateChangeDueAmountInUSDollar() {
        paymentPage.validateChangeDueInUSDollar();
    }

    @And("the sales assistant enters the amount to be paid using gift card")
    public void theSalesAssistantEntersTheAmountToBePaidUsingGiftCard() {
        paymentPage.amountPaidByGiftCard();
    }

    @And("the sales assistant enter the amount for cash tender")
    public void theSalesAssistantEnterTheAmountForCashTender() {
        paymentPage.enterAmountForPartialCashTender();
    }

    @And("the sales assistant store the applied reward price")
    public void theSalesAssistantStoreTheAppliedRewardPrice() {
        paymentPage.storeRewardPrice();
    }

    @And("the sales assistant validate reward balance")
    public void theSalesAssistantValidateRewardBalance() {
        paymentPage.validateRewardBalance();
    }

    @And("the sales assistant validate if another payment was success")
    public void theSalesAssistantValidateIfAnotherPaymentWasSuccess() {
        paymentPage.verifyAnotherPartialPaymentCompletionStatus();
    }

    @And("the sales assistant wait for robot to reach the starting position")
    public void theSalesAssistantWaitForRobotToReachTheStartingPosition() throws InterruptedException {
        paymentPage.waitRoboticActionToComplete();
    }

    @And("the sales assistant clicks on {string} button from unused coupon page")
    public void theSalesAssistantClicksOnButtonFromUnusedCouponPage(String unusedCouponOk) {
        if ("ok".equalsIgnoreCase(unusedCouponOk)) {
            paymentPage.clickOnOkButtonFromUnusedPage();
        } else {
            throw new IllegalArgumentException("Invalid button: " + unusedCouponOk);
        }
    }

    @And("the sales assistant validate the promotion details in physical receipt")
    public void theSalesAssistantValidateThePromotionDetailsInPhysicalReceipt() throws InterruptedException {
        paymentPage.physicalReceiptPromoDescription();
    }

    @And("the sales assistant validate the loyalty points of a new loyalty customer in physical receipt")
    public void theSalesAssistantValidateTheLoyaltyPointsOfANewLoyaltyCustomerInPhysicalReceipt() throws InterruptedException {
        paymentPage.validatesLoyaltyPointsNewCustomerInPhysicalReceipt();
    }
}