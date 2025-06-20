package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.*;
import aptos.utility.ApiHelper;
import aptos.utility.TestDataHelper;
import aptos.utility.W3CActions;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.json.simple.parser.ParseException;
import org.junit.Assert;

import java.io.IOException;
import java.time.Duration;

import static aptos.stepDefinition.ProductInquiryPageStepDefinition.itemUPC;

public class BasketPageStepDefinition extends TestBase {
    public static String ProductCode;
    public static String UPC;


    BasketPage basketPage = new BasketPage();
    CustomerPage customerPage = new CustomerPage();
    TestDataHelper testDataHelper = new TestDataHelper();
    ReturnPage returnPage = new ReturnPage();
    PaymentPage paymentPage = new PaymentPage();
    W3CActions w3CActions = new W3CActions();
    ProductInquiryPage productInquiryPage = new ProductInquiryPage();


    public BasketPageStepDefinition() throws IOException {
    }

    @And("the sales assistant add a single {string} item to the basket")
    public void theSalesAddASingleItemToTheBasket(String productType) throws IOException, ParseException {
        basketPage.clickOnCameraButton();
        String ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
        ApiHelper.displayBarcode("barcode", "UPCA", ProductCode, 4, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
    }

    @And("the sales assistant clicks on Skip button")
    public void theSalesAssistantClicksOnSkipButton() {
        customerPage.clickOnSkipButton();
    }

    @And("the sales assistant clicks on Pay button")
    public void theSalesAssistantClicksOnPayButton() {
        basketPage.clickOnTotalTransaction();
    }

    @And("the sales assistant logout from the application")
    public void theSalesAssistantLogoutFromTheApplication() {
        basketPage.logoutFromApplication();
    }

    @Then("the sales assistant add {int} items from {string} product to the basket")
    public void theSalesAssistantAddItemsFromProductToTheBasket(int itemCount, String productType) throws IOException, ParseException {
        if (itemCount > 0) {
            for (int i = 0; i < itemCount; i++) {
                String productCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
                itemUPC = productCode;
                basketPage.clickOnCameraButton();
                ApiHelper.displayBarcode("barcode", "UPCA", productCode, 3, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
            }
        }
    }

    @Then("the sales assistant add {int} items from {string} product to the basket without customer")
    public void theSalesAssistantAddIntItemsFromStringProductToTheBasketWithCustomer(int itemCount, String productType) throws IOException, ParseException {
        int SkipCount = 0;
        if (itemCount > 0) {
            for (int i = 0; i < itemCount; i++) {
                itemUPC = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
                basketPage.clickOnCameraButton();
                System.out.println(itemUPC);
                ApiHelper.displayBarcode("barcode", "UPCA", itemUPC, 3, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
                if (SkipCount == 0) {
                    customerPage.clickOnSkipButton();
                    SkipCount++;
                }
                //products = new String[itemCount]; //store upcs in this array to validate in e-receipt
                //products[i] = ProductCode;
            }
        }
    }

    @And("then sales assistant clicks on Assign Customer button")
    public void thenSalesAssistantClicksOnAssignCustomerButton() {
        basketPage.clickOnAssignCustomerButton();
    }

    @And("the sales assistant clicks on return button")
    public void theSalesAssistantClicksOnReturnButton() {
        basketPage.clickOnReturnButton();
    }

    @And("the sales assistant clicks on Discount button from basket page")
    public void theSalesAssistantClicksOnDiscountButtonFromBasketPage() {
        basketPage.clickOnDiscountButton();
    }

    @And("the sales assistant selects the product at index {int}")
    public void theSalesAssistantSelectsTheProductAtIndex(int indexPosition) {
        basketPage.clickProductAtPosition(indexPosition);
    }

    @And("the sales assistant void the transaction from basket with reason code {string}")
    public void theSalesAssistantVoidTheTransactionFromBasketWithReasonCode(String reasonCode) throws InterruptedException {
        if (properties.getProperty("BrandRegion").equals("DCK")) {
            basketPage.voidFromBasket();
        } else {
            basketPage.voidFromBasket();
            returnPage.selectReasonCode(reasonCode);
        }
        paymentPage.selectPrinterByEnteringName();
    }

    @And("then sales assistant clicks on Suspend button")
    public void thenSalesAssistantClicksOnSuspendButton() {
        basketPage.suspendFomBasket();
    }

    @And("the sales assistant enter the reference ID")
    public void theSalesAssistantEnterTheReferenceID() {
        basketPage.enterReferenceID();
        basketPage.suspendFomBasket();
    }

    @And("the sales assistant clicks on Resume button")
    public void theSalesAssistantClicksOnResumeButton() {
        basketPage.resumeFomBasket();
    }

    @And("the sales assistant select the transaction to be resumed")
    public void theSalesAssistantSelectTheTransactionToBeResumed() {
        basketPage.selectTransactionForResume();
    }

    @And("the sales assistant wait for the suspend to complete")
    public void theSalesAssistantWaitForTheSuspendToComplete() throws InterruptedException {
        basketPage.isBasketEmpty();
        Thread.sleep(5000);
    }

    @And("the sales assistant navigate to information page")
    public void theSalesAssistantNavigateToInformationPage() throws InterruptedException {
        basketPage.navigateToInformation();
    }

    @And("the sales assistant save the transaction number from information page")
    public void theSalesAssistantSaveTheTransactionNumberFromInformationPage() {
        basketPage.getTransactionNumber();
    }

    @And("the sales assistant navigate to store operations page")
    public void theSalesAssistantNavigateToStoreOperationsPage() throws InterruptedException {
        basketPage.navigateToStoreOperations();
    }

    @And("the sales assistant validate if resume button is enabled")
    public void theSalesAssistantValidateIfResumeButtonIsEnabled() {
        basketPage.isResumeButtonEnabled();
    }

    @And("the sales assistant validate if suspend button is enabled")
    public void theSalesAssistantValidateIfSuspendButtonIsEnabled() {
        basketPage.isSuspendButtonEnabled();
    }

    @And("the sales assistant enter coupons code for {string}")
    public void theSalesAssistantEnterCouponsCodeFor(String couponName) throws IOException, ParseException, InterruptedException {
        String couponCode = TestDataHelper.getCouponCode(properties.getProperty("BrandRegion"), couponName);
        basketPage.enterCoupon(couponCode);
    }

    @And("the sales assistant clicks on {string} button from basket")
    public void theSalesAssistantClicksOnButtonFromBasket(String buttonName) {
        basketPage.clickOnBasketPageButtons(buttonName);
    }

    @And("the sales assistant validate {string} is applied to item")
    public void theSalesAssistantValidateIsAppliedToItemAtIndex(String discount) throws InterruptedException {
        basketPage.itemDiscountValidation(discount);
        Thread.sleep(5000);//time to override the price if amount is large
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            basketPage.clickOnLineActionBackButton();
        } else {
            basketPage.clickOnCancelButton();
        }
    }

    @And("the sales assistant lands on Basket Page")
    public void theSalesAssistantLandsOnBasketPage() throws InterruptedException {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            basketPage.scrollUp();
        }
        if (properties.getProperty("Brand").equals("DCK")) {
            basketPage.isDckLogoDisplayed();
        } else {
            basketPage.isAssignCustomerDisplayed();
        }
    }

    @And("the sales assistant clicks on Employee Sale button from basket page")
    public void theSalesAssistantClicksOnEmployeeSaleButtonFromBasketPage() {
        basketPage.clickOnEmployeeSaleButton();

    }

    @And("the sales assistant enter {string} Employee ID")
    public void theSalesAssistantEnterEmployeeID(String empId) throws IOException, ParseException {
        String employeeIdId = TestDataHelper.getEmployeeId(properties.getProperty("BrandRegion"), empId);
        basketPage.enterEmployeeId(employeeIdId);

    }

    @And("the sales assistant selects Tax button from Basket page")
    public void theSalesAssistantSelectsTaxButtonFromBasketPage() {
        basketPage.clickOnTaxButtonBasketPage();
    }

    @And("the sales assistant clicks on Non-Merch button")
    public void theSalesAssistantClicksOnNonMerchButton() {
        basketPage.clickOnNonMerchButton();
    }

    @And("the sales assistant select shipping")
    public void theSalesAssistantSelectShipping() {
        basketPage.clickOnShipping();
    }

    @And("the sales assistant enter the shipping amount as {int}")
    public void theSalesAssistantEnterTheShippingAmountAs(int amount) throws InterruptedException {
        basketPage.enterShippingAmount(amount);
    }

    @And("the sales assistant validate if {string} is added to the basket at index {int}")
    public void theSalesAssistantValidateIfIsAddedToTheBasketAtIndex(String name, int index) {
        basketPage.validateNameOfProduct(index, name);
    }

    @And("the sales assistant validates transactional level tax is exempted")
    public void theSalesAssistantValidatesTaxIsExempted() {
        basketPage.validatesTaxIsZero();
    }

    @And("the sales assistant add salesperson {string} to the transaction item")
    public void theSalesAssistantAddSalespersonToTheTransactionItem(String salesPersonId) throws InterruptedException {
        basketPage.assignSalesPerson(salesPersonId);
    }

    @And("the sales assistant validates {string} is not getting applied")
    public void theSalesAssistantValidatesIsNotGettingApplied(String details) {
        basketPage.validateDetailNotGettingApplied(details);
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant enter transactional level new tax rate as {int}")
    public void theSalesAssistantEnterTransactionalLevelNewTaxRateAsIn(int taxRate) throws InterruptedException {
        basketPage.enterNewTaxRate(taxRate);
    }

    @And("the sales assistant void the product from basket")
    public void theSalesAssistantVoidTheProductFromBasket() {
        basketPage.voidLineItem();
    }

    @And("the sales assistant add same items to the basket")
    public void theSalesAssistantAddSameItemsToTheBasket() throws InterruptedException {
        System.out.println("upc is " + itemUPC);
        basketPage.clickOnCameraButton();
        ApiHelper.displayBarcode("barcode", "UPCA", itemUPC, 3, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));
    }

    @And("the sales assistant validate gift card balance option is enabled and logout")
    public void theSalesAssistantValidateGiftCardBalanceOptionIsEnabledAndLogout() {
        basketPage.validatesGiftCardBalanceEnquiryEnabled();
    }

    @And("the sales assistant click done button without entering Reference ID")
    public void theSalesAssistantClickDoneButtonWithoutEnteringReferenceID() {
        basketPage.clickOnDoneKeyKeyBoard();
    }

    @And("the sales assistant validates proper Error message is shown that Reference Id is required")
    public void theSalesAssistantValidatesProperErrorMessageIsShownThatReferenceIdIsRequired() {
        basketPage.isErrorMessageDisplayed();
    }

    @And("the sales assistant clicks on cancel button")
    public void theSalesAssistantClicksOnCancelButton() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            basketPage.clickOnLineActionBackButton();
        } else {
            basketPage.clickOnCancelButton();
        }
    }

    @And("the sales assistant saves the UPC before suspending at index {int}")
    public void theSalesAssistantSavesTheUPCBeforeSuspendingAtIndex(int index) {
        UPC = basketPage.saveUPCDetails(index);
    }

    @And("the sales assistant validates correct products are added to the basket at index {int}")
    public void theSalesAssistantValidatesCorrectProductsAreAddedToTheBasketAtIndex(int index) {
        basketPage.validatesUPCDetails(index, UPC);
    }

    @Then("the sales assistant enters {int} {string} item UPC manually in the basket without customer")
    public void theSalesAssistantEntersTheItemUPCManuallyInTheBasketWithoutCustomer(int itemCount, String productType) throws IOException, ParseException, InterruptedException {
        if (properties.getProperty("BrandRegion").equals("DCK")) {
            ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
            basketPage.enterManualUPC("00" + ProductCode);
        } else {
            int SkipCount = 0;
            if (itemCount > 0) {
                for (int i = 0; i < itemCount; i++) {
                    ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
                    basketPage.enterManualUPC("00" + ProductCode);
                    if (SkipCount == 0) {
                        customerPage.clickOnSkipButton();
                        SkipCount++;
                    }
                }
            }
        }
    }

    @Then("the sales assistant verifies that {int} product added to the basket")
    public void theSalesAssistantVerifiesThatProductAddedToTheBasket(int index) throws InterruptedException {
        basketPage.verifyProductInBasket(index);
    }

    @And("the sales assistant validate the customer prompt window")
    public void theSalesAssistantValidateTheCustomerPromptWindow() {
        basketPage.isCustomerPromptDisplayed();
    }

    @And("the sales assistant enter transactional level tax rate as {int}")
    public void theSalesAssistantEnterTransactionalLevelTaxRateAs(int taxRate) throws InterruptedException {
        basketPage.enterNewTaxRate(taxRate);
    }

    @And("the sales assistant validate logo in login page")
    public void theSalesAssistantValidateLogoInLoginPage() {
        basketPage.validateTimberlandLogo();
    }

    @And("the sales assistant validate logo in basket page")
    public void theSalesAssistantValidateLogoInBasketPage() {
        basketPage.validateTimberlandLogo();
    }

    @And("the sales assistant clicks {string} from Sales history")
    public void theSalesAssistantClicksFromSalesHistory(String todaySale) {
        basketPage.clickOnTodaySaleHistory(todaySale);
    }

    @And("the sales assistant clicks on {string} from Sales history")
    public void theSalesAssistantClicksOnFromSalesHistory(String lastSale) {
        basketPage.clickOnLastSale(lastSale);
    }

    @And("the sales assistant click on basket back button")
    public void theSalesAssistantClickOnBasketBackButton() {
        basketPage.clickOnBackBasketButtonSalesHistory();
    }

    @And("the sales assistant confirms the UPC added to the basket")
    public void theSalesAssistantConfirmsTheUPCAddedToTheBasket() {
        String itemDescription = basketPage.getItemDescription();
        if (itemDescription.contains(itemUPC)) {
            System.out.println("Successfully added product to the basket");
        } else {
            Assert.fail("Failed to add product to the basket");
        }
    }

    @And("the sales assistant clicks on Gift receipt button from basket page")
    public void theSalesAssistantClicksOnGiftReceiptButtonFromBasketPage() {
        basketPage.clickOnGiftReceiptButton();
    }

    @And("the sales assistant select Grouped receipt")
    public void theSalesAssistantSelectGroupedReceipt() {
        basketPage.clickOnGroupedReceipt();
    }

    @And("the sales assistant validate gift logo is added to the product at index {int}")
    public void theSalesAssistantValidateGiftLogoIsAddedToTheProductAtIndex(int index) {
        basketPage.validateGiftReceiptLogoInProduct(index);
    }

    @And("the sales assistant search a transaction from Sales history page")
    public void theSalesAssistantSearchATransactionFromSalesHistoryPage() {
        basketPage.searchTransactionFromSalesHistory();
    }

    @And("the sales assistant navigate to Sales history page")
    public void theSalesAssistantNavigateToSalesHistoryPage() {
        basketPage.navigateToSalesHistoryPage();
    }

    @And("the sales assistant clicks on Reprint button")
    public void theSalesAssistantClicksOnReprintButton() {
        basketPage.clickOnReprintButton();
    }

    @And("the sales assistant validate the reprint option is only available once")
    public void theSalesAssistantValidateTheReprintOptionIsOnlyAvailableOnce() {
        basketPage.receiptReprintOptionIsOnlyAvailableOnce();
    }

    @And("the sales assistant navigate to basket page from Sales details page")
    public void theSalesAssistantNavigateToBasketPageFromSalesDetailsPage() {
        basketPage.navigateToBasketPageFromSalesDetailsPage();
    }

    @And("the sales assistant navigate to Reprint page")
    public void theSalesAssistantNavigateToReprintPage() {
        basketPage.navigateToReprintPage();
    }

    @And("the sales assistant stores price of first product")
    public void theSalesAssistantStoresPriceOfFirstProduct() {
        basketPage.storeFirstProductPrice();
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant validate {string} % coupon applied correctly for the item")
    public void theSalesAssistantValidateCouponAppliedCorrectly(String percentage) {
        basketPage.validatePercentageCouponAppliedCorrectly(percentage);
        basketPage.clickOnCancelButton();
    }

    @Then("the sales assistant validates the Gift Card balance from basket page for index {int}")
    public void theSalesAssistantValidatesTheGiftCardBalanceFromBasketPageForIndex(int index) throws IOException, ParseException, InterruptedException {
        basketPage.giftCardBalance(index);
    }

    @Then("the sales assistant validates the Gift Card balance from basket page for index {int} by swipe")
    public void theSalesAssistantValidatesTheGiftCardBalanceFromBasketPageForIndexBySwipe(int index) throws IOException, ParseException, InterruptedException {
        basketPage.giftCardBalanceSwipe(index);
    }

    @Then("the sales assistant saves the Gift Card balance amount")
    public void theSalesAssistantSavesTheGiftCardBalanceAmount() {
        basketPage.giftCardBalanceAmount();
    }

    @And("the sales assistant closes the Balance Inquiry screen")
    public void theSalesAssistantClosesTheBalanceInquiryScreen() {
        basketPage.balanceInquiryClose();
    }

    @Then("the sales assistant validates the Gift Card balance amount after void")
    public void theSalesAssistantValidatesTheGiftCardBalanceAmountAfterVoid() {
        basketPage.checkGiftCardAfterVoid();
    }

    @And("the sales assistant validate price of the item at index {int} after {string} discount is applied")
    public void theSalesAssistantValidatePriceOfTheItemAtIndexAfterDiscountIsApplied(int index, String discount) {
        basketPage.validateItemDiscount(index, discount);
    }

    @And("the sales assistant validate total transaction amount")
    public void theSalesAssistantValidateTotalTransactionAmount() {
        basketPage.calculateTotalSummary();
    }

    @And("the sales assistant save sale amount details")
    public void theSalesAssistantSaveSaleAmountDetails() {
        basketPage.saveSaleAmountDetails();
    }

    @And("the sales assistant validate the sales amount after {string} of {string} is applied to the item at index {int}")
    public void theSalesAssistantValidateTheSalesAmountAfterOfIsAppliedToTheItemAtIndex(String taxRate, String taxAction, int index) {
        basketPage.validateSaleAmountAfterTaxOverride(index, taxRate);
    }

    @And("the sales assistant clicks Today's sales from Sales history")
    public void theSalesAssistantClicksTodaySSalesFromSalesHistory() {
        basketPage.clickOnTodaySaleButton();
    }

    @And("the sales assistant validates amount is less than limit")
    public void theSalesAssistantValidatesAmountIsLessThanLimit() {
        basketPage.priceOverrideMaxLimit();
    }

    @And("the sales assistant validate same item is added in a new line to the basket")
    public void theSalesAssistantValidateSameItemIsAddedInANewLineToTheBasket() {
        basketPage.newLineItem();
    }

    @And("the sales assistant clicks on Last sale from Sales history")
    public void theSalesAssistantClicksOnLastSaleFromSalesHistory() {
        basketPage.clickOnLastHistoryButton();
    }

    @And("the sales assistant clicks on sales history back button")
    public void theSalesAssistantClicksOnSalesHistoryBackButton() {
        basketPage.clickOnSalesHistoryButtonBack();
    }

    @And("sales assistant validate item entering text field and camera icon is displayed in basket page")
    public void salesAssistantValidateItemEnteringTextFieldAndCameraIconIsDisplayedInBasketPage() {
        basketPage.validatesCamIconAndItemField();
    }

    @And("the sales assistant validate the color of basket page")
    public void theSalesAssistantValidateTheColorOfBasketPage() throws IOException {
        basketPage.validateColorOfBasketPage();
    }

    @Then("the sales assistant add an items from {string} product")
    public void theSalesAssistantAddAnItemsFromProduct(String productType) throws IOException, ParseException {
        String ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
        basketPage.clickOnCameraButton();
        ApiHelper.displayBarcode("barcode", "UPCA", ProductCode, 3, Integer.valueOf(properties.getProperty("BarcodeScreenStation")));

    }

    @And("the sale assistant click on cancel button from not on file item")
    public void theSaleAssistantClickOnCancelButtonFromNotOnFileItem() {
        basketPage.clickOnCancelButtonFromNotOnFileItem();
    }

    @And("the sales assistant add salesperson {string} to the transaction")
    public void theSalesAssistantAddSalespersonToTheTransaction(String salesPersonId) throws InterruptedException {
        basketPage.assignSalesPersonToTransaction(salesPersonId);
    }

    @And("the sales assistant validates suspend button is disabled")
    public void theSalesAssistantValidatesSuspendButtonIsDisabled() {
        basketPage.validatesSuspendButtonDisabled();
    }

    @And("the sales assistant void the transaction with gift card item with reason {string}")
    public void theSalesAssistantVoidTheTransactionWithGiftCardItemWithReason(String reasonCode) {
        basketPage.voidFromBasket();
        returnPage.selectReasonCode(reasonCode);
    }

    @And("the sales save the transaction date and address")
    public void theSalesSaveTheTransactionDateAndAddress() {
        basketPage.getTransactionDate();
        basketPage.getStoreAddress();
    }

    @And("the sales assistant selects gift card item at index {int}")
    public void theSalesAssistantSelectsGiftCardItemAtIndex(int index) {
        basketPage.clickGiftCardItem(index);
    }

    @And("the sales assistant validates maximum limit of reduction for price override is {double}")
    public void theSalesAssistantValidatesMaximumLimitOfReductionForPriceOverrideIs(double price) {
        basketPage.priceOverrideMinimumLimit(price);
    }

    @And("the sales assistant validate {string} promotion is not applied")
    public void theSalesAssistantValidatePromotionIsNotApplied(String discount) {
        basketPage.promotionNotAppliedValidation(discount);
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant add terminated salesperson {string} to the transaction")
    public void theSalesAssistantAddTerminatedSalespersonToTheTransaction(String salespersonId) throws InterruptedException {
        basketPage.assignTerminatedSalesPerson(salespersonId);
    }

    @And("the sales assistant validate invalid error message and navigate to basket")
    public void theSalesAssistantValidateInvalidErrorMessageAndNavigateToBasket() throws InterruptedException {
        basketPage.validateInvalidSalespersonError();
    }

    @And("the sales assistant validate the price after price override")
    public void theSalesAssistantValidateThePriceAfterPriceOverride() {
        basketPage.validatePriceOverrideAmount();
    }

    @And("the sales assistant select individual receipts")
    public void theSalesAssistantSelectIndividualReceipts() {
        basketPage.clickOnIndividualReceiptGiftCardButton();
    }

    @And("sales assistant saves the salesperson name")
    public void salesAssistantSavesTheSalespersonName() {
        basketPage.getSalesPersonNames();
    }

    @And("the sales assistant validate {int} discounted from the product")
    public void theSalesAssistantValidateDiscountedFromTheProduct(int amount) {
        basketPage.validateDiscountedAmount(amount);
        basketPage.clickOnCancelButton();
    }

    @And("sales assistant validates transactional level discount {int} applied")
    public void salesAssistantValidatesTransactionalLevelDiscountApplied(int discount) {
        basketPage.getDiscountApplied(discount);
    }

    @And("sales assistant coupon discount is not applied to gift card")
    public void salesAssistantCouponDiscountIsNotAppliedToGiftCard() {
        basketPage.validateDiscountNotGettingAppliedToGiftCard();
        basketPage.clickOnCancelButton();
    }


    @And("the sales assistant save the store details from information page")
    public void theSalesAssistantSaveTheStoreDetailsFromInformationPage() {
        basketPage.getStoreAddress();
    }

    @And("the sales assistant validate store details are in physical receipt")
    public void theSalesAssistantValidateStoreDetailsAreSameInPhysicalReceipt() throws InterruptedException {
        basketPage.validateStoreDetailsInReceipt();
    }

    @And("the sales assistant navigate to basket page from Reprint last receipt page")
    public void theSalesAssistantNavigateToBasketPageFromReprintLastReceiptPage() {
        basketPage.clickOnBackButtonReprintLastReceipt();
    }

    @And("the sales assistant validate two for thirty promo applied")
    public void theSalesAssistantValidateTwoForThirtyPromoApplied() {
        basketPage.validateTwoFrThirtyPromoApplied();
    }

    @And("the sales assistant select return reason code button")
    public void theSalesAssistantSelectReturnReasonCodeButton() {
        basketPage.clickOnReturnReasonButton();
    }

    @And("the sales assistant validate transactional level percentage off {int} applied for {int} items")
    public void theSalesAssistantValidateTransactionalLevelPercentageOffAppliedForItems(int percentage, int noOfItems) {
        basketPage.validateTransactionalLevelPercentageOffApplied(percentage, noOfItems);
    }

    @And("the sales assistant validate default tax rate applied correctly")
    public void theSalesAssistantValidateDefaultTaxRateAppliedCorrectly() {
        basketPage.validateDefaultTaxRate();
    }

    @And("the sales assistant validate the combined discounts")
    public void theSalesAssistantValidateTheCombinedDiscounts() {
        basketPage.validateCombinedDiscounts();
    }

    @And("the sales assistant validate all the discounts applied")
    public void theSalesAssistantValidateAllTheDiscountsApplied() {
        basketPage.validateAllDiscountsAppliedAfterTwoForThirty();
    }

    @Then("the sales assistant validates the Gift Card balance is {string}")
    public void theSalesAssistantValidatesTheGiftCardBalanceIs(String amount) {
        basketPage.validateGiftCardBalance(amount);
    }

    @Then("the sales assistant saves the Gift Card balance amount for EJ")
    public void theSalesAssistantSavesTheGiftCardBalanceAmountForEJ() {
        basketPage.giftCardBalanceAmountForEJ();
    }

    @And("the sales assistant validate the price of the product is {int} at index {int}")
    public void theSalesAssistantValidateThePriceOfTheProductIsAtIndex(double price, int index) {
        basketPage.validateOverridePrice(price, index);
    }

    @And("the sales assistant stores the transaction amount details")
    public void theSalesAssistantStoresTheTransactionAmountDetails() {
        basketPage.storeTransactionAmountDetails();
    }

    @And("the sales assistant clicks on cancel button on suspend page")
    public void theSalesAssistantClicksOnCancelButtonOnSuspendPage() {
        basketPage.clicksOnCancelButtonOnSuspendPopUp();
    }

    @And("the sales assistant selects Tax exempt Option from Transactional action")
    public void theSalesAssistantSelectsTaxExemptOptionFromTransactionalAction() {
        basketPage.clickTaxExemptButtonTransactionalLevel();
    }

    @And("the sales assistant validate Non-Merch item list")
    public void theSalesAssistantValidateNonMerchItemList() {
        basketPage.validateNonMerchItemList();
    }

    @And("the sales assistant validate the promotions {string} and {string} aren't combined")
    public void theSalesAssistantValidateThePromotionsAndArenTCombined(String promo1, String promo2) {
        basketPage.validateDoNotCombinedPromotions(promo1, promo2);
    }

    @And("the sales assistant verifies an error message item not found is displayed")
    public void theSalesAssistantVerifiesAnErrorMessageItemNotFoundIsDisplayed() {
        basketPage.validatesAnErrorMessageItemNotFound();
    }

    @And("the sales assistant validates the store copy receipt is printed")
    public void theSalesAssistantValidatesTheStoreCopyReceiptIsPrinted() throws InterruptedException {
        basketPage.validateStoreCopyOfReturnedItem();
    }

    @And("the sales assistant validate {string} is not applied to item")
    public void theSalesAssistantValidateIsNotAppliedToItem(String discount) {
        basketPage.itemTaxExemptValidation(discount);
        basketPage.clickOnCancelButton();

    }

    @And("the sales assistant validate temporary markdown discount")
    public void theSalesAssistantValidateTemporaryMarkdownDiscount() {
        basketPage.validateTempMDDiscount();
    }

    @And("the sales assistant validate {string} discount is applied to the transaction")
    public void theSalesAssistantValidateDiscountIsAppliedToTheTransaction(String discount) {
        basketPage.validateTransactionLevelDiscount(discount);
    }

    @And("the sales assistant scrolls the basket screen to top")
    public void theSalesAssistantScrollsTheBasketScreenToTop() throws InterruptedException {
        basketPage.scrollBasketScreen();
    }

    @And("the sales assistant validate second promotion got applied to the product")
    public void theSalesAssistantValidateSecondPromotionGotAppliedToTheProduct() {
        basketPage.stackedPromotionValidation();
    }

    @And("the sales assistant store the Temp_MD UPC in index {int}")
    public void theSalesAssistantStoreTheTemp_MDUPCInIndex(int index) {
        basketPage.storeTempMDUPC(index);
    }


    @And("the sales assistant validate tax exempt applied in the transaction")
    public void theSalesAssistantValidateTaxExemptAppliedInTheTransaction() {
        basketPage.validateTaxExempt();
    }

    @And("the sales assistant calculate the tax amount of a product at index {int}")
    public void theSalesAssistantCalculateTheTaxAmountOfAProductAtIndex(int index) {
        basketPage.calculateTaxAmount(index);
    }

    @And("the sales assistant validate the tax amount is correct for multiple item after applying tax override to one item")
    public void theSalesAssistantValidateTheTaxAmountIsCorrectForMultipleItemAfterApplyingTaxOverrideToOneItem() {
        basketPage.validateTaxOverRideForMultipleItems();

    }

    @And("the sales assistant validate {string} tax override to the item at index {int}")
    public void theSalesAssistantValidateTaxOverrideToTheItemAtIndex(String percentage, int index) {
        basketPage.validateTaxOverrideAmount(percentage, index);
    }

    @And("the sales assistant validate the refund amount in exchange")
    public void theSalesAssistantValidateRefundAmountInExchange() {
        basketPage.calculateTotalAmountAfterApplyingCoupon();
    }

    @And("the sales assistant stores the price after coupon applied")
    public void theSalesAssistantStoresThePriceAfterCouponApplied() {
        basketPage.storePromoPrice();
    }

    @And("the sales assistant validate the reprint option is only available twice")
    public void theSalesAssistantValidateTheReprintOptionIsOnlyAvailableTwice() {
        basketPage.receiptReprintAvailableTwice();
    }

    @And("the sales assistant void the transaction from basket")
    public void theSalesAssistantVoidTheTransactionFromBasket() {
        basketPage.voidFromBasket();
    }

    @And("the sales assistant scrolls down the screen")
    public void theSalesAssistantScrollsDownTheScreen() {
        w3CActions.scrollDown();
    }

    @Then("the sales assistant enters the {string} item UPC manually in the basket without customer")
    public void theSalesAssistantEntersTheItemUPCManuallyInTheBasketWithoutCustomer(String productType) throws IOException, ParseException, InterruptedException {
        ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
        basketPage.enterManualUPC("00" + ProductCode);
        customerPage.clickOnSkipButton();
    }

    @Then("the sales assistant selects {string} from the salesperson popup box")
    public void theSalesAssistantSelectsFromTheSalespersonPopupBox(String yesOrNo) {
        basketPage.selectYesForAssignSalesPerson(yesOrNo);
    }

    @And("the sales assistant validates a popup message is displayed in zero price product page")
    public void theSalesAssistantValidatesAPopupMessageIsDisplayedInZeroPriceProductPage() {
        basketPage.validatesAnErrorPopupFromZeroPrice();
    }

    @And("the sales assistant validates price overriden price is correct for the given quantity")
    public void theSalesAssistantValidatesPriceOverridenPriceIsCorrectForTheGivenQuantity() {
        basketPage.validatesPriceOverridePriceAfterQuantityChange();
    }

    @Then("the sales assistant validates the user {string} is tagged to item")
    public void theSalesAssistantValidatesTheUserIsTaggedToItem(String userName) {
        basketPage.validateUserIsAdded(userName);
    }

    @And("the sales assistant selects back button from Resume sale page")
    public void theSalesAssistantSelectsBackButtonFromResumeSalePage() {
        customerPage.clickOnBackButtoniPhone();
    }

    @And("the sales assistant clicks on menu button for iPhone basket")
    public void theSalesAssistantClicksOnMenuButtonForIPhoneBasket() {
        basketPage.clickOniPhoneMenuButton();
    }

    @And("the sales assistant navigate to basket from resume page")
    public void theSalesAssistantNavigateToBasketFromResumePage() {
        basketPage.clickOnResumePageBackButton();
    }

    @And("the sales assistant validates the invalid employee error message")
    public void theSalesAssistantValidatesTheInvalidEmployeeErrorMessage() {
        basketPage.validateInvalidEmployeeErrorPopUpMessage();
    }

    @And("sales assistant clicks on Ok button")
    public void salesAssistantClicksOnOkButton() {
        basketPage.clickOnDiscardOkButton();
    }

    @And("the sales assistant validate invalid employee error message and navigate to basket")
    public void theSalesAssistantValidateInvalidEmployeeErrorMessageAndNavigateToBasket() throws InterruptedException {
        basketPage.validateInvalidEmployeeError();
    }

    @And("the sales assistant validate employee discount applied {int} percentage")
    public void theSalesAssistantValidateEmployeeDiscountAppliedPercentage(int employeeDiscountPercentage) {
        basketPage.validateEmployeeDiscount(employeeDiscountPercentage);
    }

    @And("the sales assistant scrolls up the screen")
    public void theSalesAssistantScrollsUpTheScreen() throws InterruptedException {
        basketPage.scrollUp();
    }

    @And("the sales assistant validates the same employee error message")
    public void theSalesAssistantValidatesTheSameEmployeeErrorMessage() {
        basketPage.validateSameEmployeeErrorPopUpMessage();
    }

    @Then("the sales assistant enters the {string} item UPC manually in the basket")
    public void theSalesAssistantEntersTheItemUPCManuallyInTheBasket(String productType) throws IOException, ParseException, InterruptedException {
        ProductCode = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
        basketPage.enterManualUPC("00" + ProductCode);
    }

    @And("the sales assistant validate employee discount is not applied in blind return")
    public void theSalesAssistantValidateEmployeeDiscountIsNotAppliedInBlindReturn() {
        basketPage.validateEmployeeDiscountNotApplyInBlindReturn();
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            basketPage.clickOnLineActionBackButton();
        } else {
            basketPage.clickOnCancelButton();
        }
    }

    @And("the sales assistant saves the promotion description")
    public void theSalesAssistantSavesThePromotionDescription() {
    }

    @And("the validates coupon promo don't get applied")
    public void theValidatesCouponPromoDonTGetApplied() {
        basketPage.validatesPromoNotApplied();
    }

    @And("the sales assistant validates Employee Discount not applied to Shipping")
    public void theSalesAssistantValidatesEmployeeDiscountNotAppliedToShipping() {
        basketPage.validateEmpDiscountNotAppliedToShipping();
        basketPage.clickOnCancelButton();
    }

    @And("the sales assistant selects the shipping item")
    public void theSalesAssistantSelectsTheShippingItem() {
        basketPage.selectShippingItem();
    }

    @And("the sales assistant validate perm to temp savings are not shown in the discount section in discount summary")
    public void theSalesAssistantValidatePermToTempSavingsAreNotShownInTheDiscountSectionInDiscountSummary() {
        basketPage.validatesPromoNotApplied();
    }

    @And("the sales assistant validate if void button is enabled")
    public void theSalesAssistantValidateIfVoidButtonIsDisplayed() {
        basketPage.isVoidButtonEnabled();
    }

    @And("the sales assistant validate the promotions {string} and {string} aren't combined validation")
    public void theSalesAssistantValidateThePromotionsAndArenTCombinedValidation(String promo1, String promo2) {
        basketPage.validateDoNotCombinedPromotionsNew(promo1,promo2);
    }
}