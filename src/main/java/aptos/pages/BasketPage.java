package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.*;
import org.json.simple.parser.ParseException;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static aptos.pages.LineActionPage.currentTaxRate;
import static aptos.pages.LineActionPage.priceOverRideAmount;
import static aptos.pages.ProductInquiryPage.productOriginalPrice;
import static aptos.pages.ProductInquiryPage.productTempMDPrice;
import static aptos.stepDefinition.DiscountPageStepDefinition.discountPercentage;
import static aptos.stepDefinition.GiftCardStepDefinition.saveGiftCardIssueAmount;
import static aptos.stepDefinition.LineActionPageStepDefinition.changeQuantityCount;
import static aptos.stepDefinition.LineActionPageStepDefinition.taxAmount;
import static aptos.stepDefinition.PaymentPageStepDefinition.*;
import static org.junit.Assert.*;

public class BasketPage extends TestBase {

    GeneralUtility generalUtility = new GeneralUtility();
    MobileActions mobileActions = new MobileActions();
    CustomerPage customerPage = new CustomerPage();
    LineActionPage lineActionPage = new LineActionPage();
    DecimalFormat df = new DecimalFormat("#.00");
    W3CActions w3CActions = new W3CActions();
    public static String referenceIdTestData;
    public static String firstItemExtendedPrice;

    public static Double calculatedTaxAmount;
    public static double subTotalAmount;

    public static String TempMDProduct;
    public static int skipCount = 0;
    public static String extractedDate;
    public static String storeAddress;
    public static String giftCardBalanceAmount;
    public static String giftCardBalanceAmountFinal;
    public static Double originalPriceAfterDiscount;


    public static List<String> salespersonList;

    ApiHelper apiHelper = new ApiHelper();
    double subtotal, discount, tax, totalSummary;
    //public static String totalAmountFromReturnedItem;
    static double transactionSubtotalAmount, transactionDiscountAmount, transactionTaxAmount, transactionTotalSummaryAmount;

    // Initializing the Page Objects
    public BasketPage() throws IOException {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "//*[contains(@name, 'camera')]")
    WebElement cameraButton;

    @FindBy(xpath = "//*[@name='TotalTransaction-total-button']")
    WebElement totalTransaction;

    @FindBy(xpath = "//*[@name='TotalTransaction-basket-screen-bottom-grid']")
    WebElement iPhoneTotalTransaction;

    @FindBy(xpath = "//*[@name='MainScreen-header-left-button' or @name='MainScreen-header-none-button']")
    WebElement hamburgerButton;

    @FindBy(xpath = "//*[@label='Sign out']")
    WebElement signOutButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Information (Terminal')])[last()]")
    WebElement informationButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Store operations']")
    WebElement storeOperations;

    @FindBy(xpath = "(//*[contains(@name, 'Transaction number:')])")
    WebElement transactionNumber;

    @FindBy(xpath = "//*[contains(@name, 'assignCustomer')]")
    WebElement assignCustomerButton;

    @FindBy(xpath = "//*[contains(@name, 'discounts-actionButton')]")
    WebElement discountButton;

    @FindBy(xpath = "(//*[@name='Return'])[last()]")
    WebElement returnButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement closeButton;

    @FindBy(xpath = "(//*[@name='Void' and @label='Void'])[last()]")
    WebElement voidButton;

    @FindBy(xpath = "(//*[@name='Suspend' and @label='Suspend'])[last()]")
    WebElement suspendButton;

    @FindBy(xpath = "(//*[@name='Resume' and @label='Resume'])[last()]")
    WebElement resumeButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Suspend sale']")
    WebElement suspendHeader;

    @FindBy(xpath = "//*[@name='Your basket is empty']")
    WebElement emptyBasketMessage;

    @FindBy(xpath = "//*[@name='OK']")
    WebElement okButton;

    @FindBy(xpath = "//*[@name='Display-selectableItemLine-itemIdKeyType']")
    private List<WebElement> ListOfProducts;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Reference ID']")
    WebElement referenceID;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'UPC:')]")
    WebElement itemDescription;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Cancel'])[last()]")
    WebElement cancelButton;


    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Proceed'])[2]")
    WebElement proceedButtonCoupon;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Cancel ']")
    WebElement cancelButtonSuspendPage;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='couponForm-couponCode-textInput']")
    WebElement enterCoupon;

    @FindBy(xpath = "//*[@name='Search']")
    WebElement searchButton;

    @FindBy(xpath = "//*[@name='Employee Sale']")
    WebElement EmployeeSaleButton;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Employee ID']")
    WebElement enterEmployeeId;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Tax'])[last()]")
    WebElement taxButtonBasketPage;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-summaryTax']")
    WebElement validateTaxIsZero;

    @FindBy(xpath = "//*[@name='Non-merch']")
    WebElement nonMerch;

    @FindBy(xpath = "(//*[@name='Shipping'])[last()]")
    WebElement shipping;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='$0.00']")
    WebElement shippingAmountField;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='assignSalesperson-salesperson-textInput']")
    WebElement salesPersonTextField;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name,'Assign')])[last()]")
    WebElement assignButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='SalesPersonAssignScreen-salesperson-select']")
    WebElement assignSalesPerson;

    @FindBy(xpath = " //XCUIElementTypeStaticText[@name='Salesperson']")
    WebElement salesPersonHeader;


    @FindBy(xpath = "//XCUIElementTypeButton[@name='Yes']")
    WebElement yesButton;

    @FindBy(xpath = "//*[@name='New tax rate']")
    WebElement newTaxRateField;

    @FindBy(xpath = "//*[@value='New tax rate']")
    WebElement newTaxRateFieldTransactionLevel;

    @FindBy(xpath = "(//*[@name='Apply'])[last()]")
    WebElement applyButton;

    @FindBy(xpath = "//*[@name='Void item']")
    WebElement voidItemButton;

    @FindBy(xpath = "//*[@name='Confirm']")
    WebElement confirmButton;

    @FindBy(xpath = "//*[@name='Resume sale']")
    WebElement resumeSaleHeader;

    @FindBy(xpath = "//*[@name='Gift card balance']")
    WebElement giftCardBalance;

    @FindBy(xpath = "//*[@name='Done']")
    WebElement doneKey;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Required']")
    WebElement errorMessageRequiredReferenceID;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='ActionPanel-textInput']")
    WebElement inputTextField;

    @FindBy(xpath = "//*[@name='Search']")
    WebElement searchKey;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Email Phone number Horizontal scroll bar, 1 page Search Skip'])[1]")
    WebElement customerPromptWindow;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='New tax rate Apply Cancel Vertical scroll bar, 1 page Horizontal scroll bar, 1 page'])[3]")
    WebElement taxOverRideRightPanel;

    @FindBy(xpath = "//XCUIElementTypeImage")
    WebElement logoImage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Today's sales']")
    WebElement todaySales;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Last sale']")
    WebElement lastSales;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='SalesHistory-header-left-button']")
    WebElement basketBackButton;

    @FindBy(xpath = "//*[@name='Gift receipt']")
    WebElement giftReceiptButton;

    @FindBy(xpath = "//*[@name='Grouped receipt']")
    WebElement groupedReceipt;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Transaction ID']")
    WebElement transactionIdField;

    @FindBy(xpath = "//*[@label='Sales history']")
    WebElement salesHistoryButton;

    @FindBy(xpath = "(//*[@name='Reprint'])[3]")
    WebElement reprintButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-itemIdKeyType']")
    WebElement firstProductUPC;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice']")
    WebElement itemExtendedAmount;
    //XCUIElementTypeStaticText[@name='Display-selectableItemLine-itemExtendedAmount']

    @FindBy(xpath = "//XCUIElementTypeSecureTextField[@value='Gift card number']")
    WebElement giftCardEnterText;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Balance'])[2]")
    WebElement giftCardBalanceButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement giftCardBalanceClose;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, \"Balance $\")]")
    WebElement getGiftCardBalanceAmount;

    @FindBy(xpath = "//*[@name='Display-summarySubTotal']")
    WebElement subtotalLabel;

    @FindBy(xpath = "//*[@name='Display-summaryDiscount']")
    WebElement discountLabel;

    @FindBy(xpath = "//*[@name='Display-summaryTax']")
    WebElement taxLabel;

    @FindBy(xpath = "//*[@name='Display-summaryTotal']")
    WebElement totalSummaryLabel;

    @FindBy(xpath = "//*[@name=\"Today's sales\"]")
    WebElement todaySaleHistories;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Last sale']")
    WebElement lastSaleHistories;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='TransactionHistory-header-left-button']")
    WebElement saleHistoryBackButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Enter item'])[1]")
    WebElement itemAssignField;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ActionPanel-camera']")
    WebElement camButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Scan'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement scanBackArrow;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Cancel']")
    WebElement notOnFileCancelButton;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Current Business Day Date:')][last()]")
    WebElement transactionDate;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Invalid salesperson']")
    WebElement invalidSalespersonError;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Invalid employee']")
    WebElement invalidEmployee;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name=\"Display-selectableItemLine-originalUnitPrice\"]")
    WebElement originalPriceProduct;

    @FindBy(xpath = "//XCUIElementTypeButton[@name=\"Individual receipts\"]")
    WebElement individualReceiptButton;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Salesperson:')]")
    WebElement salesPersonName;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-summaryDiscount']")
    WebElement getDiscount;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-discount-amount']")
    WebElement itemDiscountAmount;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Basket'])[last()]")
    WebElement backButtonLastReceipt;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, ' ')][1]")
    WebElement allItemDescription;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-discount-label']")
    WebElement itemPercentageDiscount;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Return Reason']")
    WebElement returnReasonButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Return Reason']")
    WebElement firstDiscountLine;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Return Reason']")
    WebElement secondDiscountLine;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name=\"Tax exempt\"])[2]")
    WebElement taxExemptButtonTransactionalLevel;

    @FindBy(xpath = "//XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView")
    WebElement nonMerchItemList;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Item not found']")
    WebElement itemNotFoundPopUpInvalidItem;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Ok'])[2]")
    WebElement itemNotFoundOKButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice']")
    WebElement productOriginalPriceReturn;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Tax']")
    WebElement taxButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-itemExtendedAmount']")
    WebElement returnItemsPrice;

    @FindBy(xpath = "(//XCUIElementTypeStaticText[@name='$44.00'])[2]")
    WebElement couponAppliedItem;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Resume']")
    WebElement resumeHeader;

    @FindBy(xpath = "//XCUIElementTypeImage")
    WebElement dckLogoBasket;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Price cannot be zero']")
    WebElement PriceCannotBeZeroPopUp;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='OK'])[2]")
    WebElement ZeroPricePopUpOkButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Salesperson:')])[3]")
    WebElement associateNameTag;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='TotalTransaction-basket-screen-bottom']")
    WebElement voidButtoniPhone;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='TotalTransaction-basket-screen-bottom']")
    WebElement iPhoneMenuButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Line actions'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement iPhoneLineActionsBackButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Resume sale'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement iPhoneResumePageBackButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Invalid employee']")
    WebElement invalidEmployeeError;

    @FindBy(xpath = "(//*[@label='Basket'])[last()]")
    WebElement basketButtonInHeader;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='OK']")
    WebElement selectOkButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Invalid employee']")
    WebElement invalidEmployeeErrorMessage;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Employee discount can only be applied by another employee.']")
    WebElement sameEmployeeErrorMessage;

    @FindBy(xpath = "//*[@name='Display-selectableItemLine-discount-label']")
    WebElement promotionDescription;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Swipe'])[2]")
    WebElement swipeButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Shipping']")
    WebElement shippingItem;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Shipping')]")
    WebElement shippingDescription;


    //Actions
    public void clickOnCameraButton() {
        generalUtility.isElementEnabled(cameraButton);
        mobileActions.clickOnElement(cameraButton);
    }

    public void clickOnTotalTransaction() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            generalUtility.waitForElementToBeVisible(iPhoneTotalTransaction, 12);
            mobileActions.clickOnElement(iPhoneTotalTransaction);
        } else {
            generalUtility.waitForElementToBeVisible(totalTransaction, 20);
            mobileActions.clickOnElement(totalTransaction);
        }
    }

    public void logoutFromApplication() {
        mobileActions.clickOnElement(hamburgerButton);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            w3CActions.scrollDownWithPercentage(30);
        }
        w3CActions.scrollHamburgerMenu();
        mobileActions.waitAndClickOnElement(signOutButton, 7);
 }

    public void navigateToInformation() {
        mobileActions.clickOnElement(hamburgerButton);
        mobileActions.waitAndClickOnElement(informationButton, 5);
    }

    public void navigateToStoreOperations() {
        mobileActions.clickOnElement(hamburgerButton);
        mobileActions.waitAndClickOnElement(storeOperations, 5);
    }

    public void getTransactionNumber() {
        String transactionInfo = generalUtility.getTextFromElement(transactionNumber);
        saleTransactionID = transactionInfo.replaceAll(".*Transaction number: (\\d+).*", "$1");
        System.out.println(saleTransactionID);
    }

    public void getStoreAddress() {
        String transactionInfo = generalUtility.getTextFromElement(transactionNumber);
        String storeAddressDetails = transactionInfo.replaceAll(".*Store:\\s*(\\d+\\s*-\\s*[^\\d]+)(?=\\s*Terminal).*", "$1");
        storeAddress = storeAddressDetails.replaceAll("^\\d+\\s-\\s", "").trim();
        System.out.println(storeAddress);
    }

    public void clickOnAssignCustomerButton() {
        mobileActions.clickOnElement(assignCustomerButton);
    }

    public void isAssignCustomerDisplayed() {
        generalUtility.isElementDisplayed(assignCustomerButton);
    }

    public void clickOnReturnButton() {
        mobileActions.clickOnElement(returnButton);
    }

    public void clickOnDiscountButton() {
        mobileActions.clickOnElement(discountButton);
    }

    public void clickProductAtPosition(int index) {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            int scrollIndex = index + 1;
            if (generalUtility.isElementExists(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[" + scrollIndex + "]"))) {
                w3CActions.scrollUpWithPercentage(30);
            }

        }
        WebElement product = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[" + index + "]"));
        generalUtility.waitForElementToBeVisible(product, 20);
        mobileActions.clickOnElement(product);
    }

    public void validateNameOfProduct(int index, String name) {
        WebElement product = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemDescription'])[" + index + "]"));
        String productName = generalUtility.getTextFromElement(product);
        assertTrue("Product not found", productName.contains(name));
    }

    public void itemDiscountValidation(String discount) {
        String productDescription = generalUtility.getTextFromElement(itemDescription);
        assertTrue("Expected discount is not applied:" + discount, productDescription.contains(discount));
    }

    public void voidFromBasket() {
        mobileActions.clickOnElement(voidButton);
        mobileActions.clickOnElement(okButton);
    }

    public boolean isVoidButtonDisplayed() {
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
            wait.until(ExpectedConditions.visibilityOf(voidButton));
            return true;
        } catch (TimeoutException e) {
            return false;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }


    public void isVoidButtonEnabled() {generalUtility.isElementEnabled(voidButton);}

    public void suspendFomBasket() {
        mobileActions.clickOnElement(suspendButton);
    }

    public void enterReferenceID() {
        referenceIdTestData = TestDataHelper.generateReferenceTD();
        mobileActions.enterText(referenceID, referenceIdTestData);
        mobileActions.clickOnElement(suspendHeader);
    }

    public void resumeFomBasket() {
        mobileActions.clickOnElement(resumeButton);
    }

    public void isResumeButtonEnabled() {
        generalUtility.isElementEnabled(resumeButton);
    }

    public void isSuspendButtonEnabled() {
        generalUtility.isElementEnabled(suspendButton);
    }

    public void selectTransactionForResume() {
        if (properties.getProperty("BrandRegion").equals("DCK")) {
            generalUtility.isElementDisplayed(resumeHeader);
        } else {
            generalUtility.isElementDisplayed(resumeSaleHeader);
        }
        WebElement transactionToResume = (driver.findElement(By.xpath("(//XCUIElementTypeOther[contains(@name, 'Reference ID: " + referenceIdTestData + "')])[last()]")));
        mobileActions.clickOnElement(transactionToResume);
        mobileActions.clickOnElement(resumeButton);
    }

    public void isBasketEmpty() {
        boolean isDisplayed = generalUtility.isElementDisplayed(emptyBasketMessage);
        assertTrue("Empty basket message should be displayed.", isDisplayed);
    }

    public void enterCoupon(String couponCode) throws InterruptedException {
        mobileActions.enterText(enterCoupon, couponCode);
        mobileActions.clickOnElement(searchButton);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            mobileActions.clickOnElement(proceedButtonCoupon);
        }
    }

    public void clickOnBasketPageButtons(String buttonName) {
        WebElement BasketPageOption = driver.findElement(By.xpath("//*[@name='" + buttonName + "']"));
        mobileActions.clickOnElement(BasketPageOption);
    }

    public void clickOnCancelButton() {
        mobileActions.clickOnElement(cancelButton);
    }

    public void clickOnEmployeeSaleButton() {
        mobileActions.clickOnElement(EmployeeSaleButton);
    }


    public void enterEmployeeId(String employeeId) {
        mobileActions.enterText(enterEmployeeId, employeeId);
    }

    public void clickOnTaxButtonBasketPage() {
        mobileActions.clickOnElement(taxButtonBasketPage);
    }

    public void clickOnNonMerchButton() {
        mobileActions.clickOnElement(nonMerch);
    }

    public void clickOnShipping() {
        mobileActions.clickOnElement(shipping);
    }

    public void enterShippingAmount(int amount) throws InterruptedException {
        amount = amount * 100;
        mobileActions.enterText(shippingAmountField, String.valueOf(amount));
        mobileActions.clickHideKeyboard();
    }

    public void clickOnTaxButtonOnBasketPage() {
        mobileActions.clickOnElement(taxButtonBasketPage);
    }

    public void validatesTaxIsZero() {
        String taxAmount = validateTaxIsZero.getText();
        String taxWithoutDollar = taxAmount.replace("$", "").trim();
        Assert.assertTrue("Tax is not exempted", taxWithoutDollar.contains("0.00"));
    }

    public void assignSalesPerson(String salesPersonId) throws InterruptedException {
        mobileActions.enterText(salesPersonTextField, salesPersonId);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(assignSalesPerson);
        boolean isDisplayedHeaderSalesPerson = generalUtility.isElementDisplayed(salesPersonHeader);
        if (isDisplayedHeaderSalesPerson){
        mobileActions.clickOnElement(assignSalesPerson);}
    }

    public void selectYesForAssignSalesPerson(String yesOrNo) {
//        mobileActions.clickOnElement(yesButton);
//        WebElement messageBox = driver.findElement(By.xpath("//XCUIElementTypeButton[@name='" + yesOrNo + "'"));
//        mobileActions.clickOnElement(messageBox);
        System.out.println("before yes");
        mobileActions.clickOnElement(driver.findElement(By.xpath(String.format("//XCUIElementTypeButton[@name='%s']", yesOrNo))));
        System.out.println("After YEs");
        String brand = properties.getProperty("Brand");
        String device = properties.getProperty("DeviceName");
        if (device.contains("iPad") && (brand.equals("TBL") || brand.equals("TNF"))) {
            if (skipCount == 0) {
                System.out.println("clickskip");
                customerPage.clickOnSkipButton();
                mobileActions.clickOnElement(cancelButton);
                skipCount++;
            }
        }
    }

    public void validateDetailNotGettingApplied(String details) {
        String productDescription = generalUtility.getTextFromElement(itemDescription);
        System.out.println(productDescription);
        assertFalse(details + "getting applied", productDescription.contains(details));
    }

    public void enterNewTaxRate(int taxRate) throws InterruptedException {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            mobileActions.enterText(newTaxRateField, String.valueOf(taxRate));
            mobileActions.clickHideKeyboard();
            mobileActions.clickOnElement(applyButton);
        } else {
            mobileActions.enterText(newTaxRateField, String.valueOf(taxRate));
            mobileActions.clickHideKeyboard();
            String contentFromRightPanelTaxOverRidePage = taxOverRideRightPanel.getText();
            Assert.assertFalse("Reason code exists", contentFromRightPanelTaxOverRidePage.contains("reason"));
            mobileActions.clickOnElement(applyButton);
        }
    }

    public void voidLineItem() {
        mobileActions.clickOnElement(voidItemButton);
        mobileActions.clickOnElement(confirmButton);
    }

    public void validatesGiftCardBalanceEnquiryEnabled() {
        mobileActions.clickOnElement(hamburgerButton);
        generalUtility.isElementEnabled(giftCardBalance);
        assertTrue("GC balance", giftCardBalance.isEnabled());
        mobileActions.clickOnElement(signOutButton);
    }

    public void clickOnDoneKeyKeyBoard() {
        mobileActions.clickOnElement(doneKey);
    }

    public void isErrorMessageDisplayed() {
        generalUtility.isElementDisplayed(errorMessageRequiredReferenceID);
    }

    public void clicksOnCancelButtonOnSuspendPopUp() {
        mobileActions.clickOnElement(cancelButtonSuspendPage);
    }

    public String saveUPCDetails(int index) {
        WebElement UPC = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[" + index + "]"));
        String UPCs = UPC.getText();
        return UPCs.replace("UPC: ", "").trim();
    }

    public void validatesUPCDetails(int index, String UPC) {
        WebElement UPCs = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[" + index + "]"));
        Assert.assertTrue("Not the correct suspended product", UPCs.getText().contains(UPC));
    }

    public void enterManualUPC(String ProductCode) {
        mobileActions.enterText(inputTextField, String.valueOf(ProductCode));
        mobileActions.clickOnElement(searchKey);
    }

    public void verifyProductInBasket(int index) {
        WebElement product = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[" + index + "]"));
        generalUtility.isElementEnabled(product);
    }

    public void isCustomerPromptDisplayed() {
        generalUtility.isElementDisplayed(customerPromptWindow);
    }

    public void validateTimberlandLogo() {
        mobileActions.clickOnElement(logoImage);
        generalUtility.isElementDisplayed(logoImage);
        assertTrue("Logo not present ", logoImage.isDisplayed());
    }

    public void clickOnTodaySaleHistory(String todaySale) {
        mobileActions.clickOnElement(todaySales);
    }

    public void clickOnLastSale(String lastSale) {
        mobileActions.clickOnElement(lastSales);
    }

    public void clickOnBackBasketButtonSalesHistory() {
        mobileActions.clickOnElement(basketBackButton);
    }

    public void clickOnGiftReceiptButton() {
        mobileActions.clickOnElement(giftReceiptButton);
    }

    public void clickOnGroupedReceipt() {
        mobileActions.clickOnElement(groupedReceipt);
    }

    public void validateGiftReceiptLogoInProduct(int index) {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            if (index == 1) {
                w3CActions.scrollUp();
            }
        }
        WebElement giftReceipt = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-status-tag'])[" + index + "]"));
        String tagDescription = generalUtility.getTextFromElement(giftReceipt);
        System.out.println(tagDescription);
        assertTrue("Gift log is not added", tagDescription.contains("gift"));
        assertTrue("Gift receipt log is not visible", giftReceipt.isDisplayed());
    }

    public void searchTransactionFromSalesHistory() {
        mobileActions.enterText(transactionIdField, saleTransactionID);
        System.out.println(saleTransactionID);
        mobileActions.clickOnElement(searchButton);
    }

    public void navigateToSalesHistoryPage() {
        mobileActions.clickOnElement(hamburgerButton);
        generalUtility.isElementEnabled(salesHistoryButton);
        mobileActions.clickOnElement(salesHistoryButton);
    }

    public void clickOnReprintButton() {
        generalUtility.isElementEnabled(reprintButton);
        mobileActions.clickOnElement(reprintButton);
    }

    public void receiptReprintOptionIsOnlyAvailableOnce() {
        By elementLocator = By.xpath("//*[@label='Print']");
        boolean result = generalUtility.isElementExists(elementLocator);
        assertFalse("Receipt reprint option available for 2nd time", result);
    }

    public void navigateToBasketPageFromSalesDetailsPage() {
        mobileActions.clickOnElement(cancelButton);
        mobileActions.clickOnElement(basketBackButton);
    }

    public String getItemDescription() {
        return (generalUtility.getTextFromElement(allItemDescription));
    }

    public void navigateToReprintPage() {
        mobileActions.clickOnElement(hamburgerButton);
        generalUtility.isElementEnabled(reprintButton);
        mobileActions.clickOnElement(reprintButton);
    }

    public void storeFirstProductPrice() {
        firstItemExtendedPrice = generalUtility.getTextFromElement(itemExtendedAmount);
        firstItemExtendedPrice = firstItemExtendedPrice.replace("$", "").trim();
    }

    public void validatePercentageCouponAppliedCorrectly(String percentage) {
        double couponAmount = Double.parseDouble(firstItemExtendedPrice) * Double.parseDouble(percentage) / 100;
        if (properties.getProperty("BrandRegion").equals("DCK")) {
            BigDecimal roundedNumber = new BigDecimal(couponAmount).setScale(2, RoundingMode.HALF_UP);
            assertTrue(percentage + "% coupon applied incorrectly", generalUtility.getTextFromElement(itemDiscountAmount).contains(String.valueOf(roundedNumber)));
        } else {
            BigDecimal roundedNum = new BigDecimal(couponAmount).setScale(2, RoundingMode.HALF_UP);
            assertTrue(percentage + "% coupon applied incorrectly", generalUtility.getTextFromElement(itemDiscountAmount).contains(String.valueOf(roundedNum)));
        }
    }

    public void giftCardBalance(int index) throws IOException, ParseException, InterruptedException {
        String giftCardNumber = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "cardNumber");
        mobileActions.clickOnElement(hamburgerButton);
        Thread.sleep(500); //Delay is to open up the list and select Gift Card Balance
        mobileActions.clickOnElement((giftCardBalance));
        mobileActions.enterText(giftCardEnterText, giftCardNumber);
        mobileActions.clickOnElement(giftCardBalanceButton);

        new Thread(() -> {
            String pin = null;
            try {
                pin = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "pin");
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            apiHelper.enterPin(properties.getProperty("RoboticsStation"), pin, "ok");
        }).start();
    }


    public void giftCardBalanceSwipe(int index) throws IOException, ParseException, InterruptedException {
        mobileActions.clickOnElement(hamburgerButton);
        Thread.sleep(500); //Delay is to open up the list and select Gift Card Balance
        mobileActions.clickOnElement((giftCardBalance));
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(swipeButton);

        new Thread(() -> {
            String pin = null;
            try {
                pin = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "pin");
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            apiHelper.enterPin(properties.getProperty("RoboticsStation"), pin, "ok");
        }).start();
    }

    public void giftCardBalanceAmount() {
        String giftCardInitialBalance = getGiftCardBalanceAmount.getText();
        String regex = "(\\d+\\.\\d{2})";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(giftCardInitialBalance);
        if (matcher.find()) {
            giftCardBalanceAmount = matcher.group(1).trim();
        }
    }

    public void balanceInquiryClose() {
        mobileActions.clickOnElement(giftCardBalanceClose);
    }

    public void checkGiftCardAfterVoid() {
        String giftCardFinalBalance = getGiftCardBalanceAmount.getText();
        String regex = "(\\d+\\.\\d{2})";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(giftCardFinalBalance);
        if (matcher.find()) {
            giftCardBalanceAmountFinal = matcher.group(1).trim();
        }
        if (Double.parseDouble(giftCardBalanceAmountFinal) == Double.parseDouble(giftCardBalanceAmount)) {
            System.out.println("Gift Card amount has been refunded successfully");
        } else {
            Assert.fail("Gift Card amount has not been refunded successfully");
        }
    }

    public void validateItemDiscount(Integer index, String discount) {
        WebElement originalPrice = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-originalUnitPrice'])[" + index + "]"));
        WebElement discountPrice = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine'])[" + index + "]/XCUIElementTypeOther[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeStaticText"));
        double itemPrice = Double.parseDouble(generalUtility.getTextFromElement(originalPrice).replaceAll("[\\$()]", "").trim());
        double itemDiscount = Double.parseDouble(generalUtility.getTextFromElement(discountPrice).replaceAll("[\\$()ME]", "").trim());

        //ConvertDiscount
        int discountValue = Integer.parseInt(discount.replaceAll("[\\$%off]", "").trim());

        //Calculation
        if (discount.contains("%")) {
            double calculatedAmount = (itemPrice - (itemPrice * discountValue) / 100);
            double roundedAmount = Math.round(calculatedAmount * 100.0) / 100.0;
            //Validation
            Assert.assertEquals(roundedAmount, itemDiscount, 0);
        } else if (discount.contains("$")) {
            double calculatedAmount = (itemPrice - discountValue);
            Assert.assertEquals(calculatedAmount, itemDiscount, 0);
        }
    }

    public void calculateTotalSummary() {
        //GetValues
        double subtotal = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$(),]", "").trim());
        double discount = Double.parseDouble(generalUtility.getTextFromElement(discountLabel).replaceAll("[\\$(),]", "").trim());
        double tax = Double.parseDouble(generalUtility.getTextFromElement(taxLabel).replaceAll("[\\$(),]", "").trim());
        double totalSummary = Double.parseDouble(generalUtility.getTextFromElement(totalSummaryLabel).replaceAll("[\\$(),]", "").trim());

        //Calculation
        double calculatedAmount = subtotal + tax;
        double roundedCalculatedAmount = Math.round(calculatedAmount * 100.0) / 100.0;
        assertEquals(roundedCalculatedAmount, totalSummary, 0);
    }

    public void validateSaleAmountAfterTaxOverride(Integer index, String taxRate) {
        WebElement originalPrice = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice'])[" + index + "]"));
        double itemPrice = Double.parseDouble(generalUtility.getTextFromElement(originalPrice).replaceAll("[\\$()]", "").trim());
        double totalSummary = Double.parseDouble(generalUtility.getTextFromElement(totalSummaryLabel).replaceAll("[\\$()]", "").trim());

        int taxValue = Integer.parseInt(taxRate.replaceAll("[\\$%]", "").trim());

        double newTaxAmount = ((itemPrice * taxValue) / 100);
        double roundedNewTaxAmount = Math.round(newTaxAmount * 100.0) / 100.0;
        //Calculation

        double calculatedTotal = subtotal + roundedNewTaxAmount; //need to add bagFee
        System.out.println("Calculated: " + calculatedTotal + " Total Sum : " + totalSummary);
        Assert.assertEquals(calculatedTotal, totalSummary, 0);
    }

    public void saveSaleAmountDetails() {
        double subtotal = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());
        subTotalAmount = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());
        double discount = Double.parseDouble(generalUtility.getTextFromElement(discountLabel).replaceAll("[\\$()]", "").trim());
        System.out.println(discount);
        double tax = Double.parseDouble(generalUtility.getTextFromElement(taxLabel).replaceAll("[\\$()]", "").trim());
        double totalSummary = Double.parseDouble(generalUtility.getTextFromElement(totalSummaryLabel).replaceAll("[\\$()]", "").trim());

        //driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
        // WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2)); / /need to add bagFee amount element
        // wait.until(ExpectedConditions.visibilityOf(bagFee));

        this.subtotal = subtotal;
        this.discount = discount;
        this.tax = tax;
        this.totalSummary = totalSummary;
    }

    public void priceOverrideMaxLimit() {
        WebElement overridePrice = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice'])[1]"));
        double itemPrice = Double.parseDouble(generalUtility.getTextFromElement(overridePrice).replaceAll("[\\$()]", "").trim());
        if (properties.getProperty("Brand").equals("DCK")) {
            if (itemPrice <= 999.99) {
                System.out.println("Maximum limit is less than 1000");

            } else {
                System.out.println("Maximum limit exceeded");
            }

        } else {
            if (itemPrice <= 9999.99) {
                System.out.println("Maximum limit is less than 10000");

            } else {
                System.out.println("Maximum limit exceeded");
            }
        }
    }

    public void newLineItem() {
        String firstLineItem = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[1]")).getText();
        String secondLineItem = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[2]")).getText();
        assertEquals(firstLineItem, secondLineItem);
    }

    public void validatesSuspendButtonDisabled() {
        mobileActions.clickOnElement(suspendButton);
        boolean assignCustomerButtonVisible = generalUtility.isElementDisplayed(assignCustomerButton);
        if (assignCustomerButtonVisible) {
            System.out.println("Suspend Button disabled");
        } else {
            Assert.fail("Suspend button enabled");
        }
    }

    public void assignSalesPersonToTransaction(String salesPersonId) throws InterruptedException {
        mobileActions.enterText(salesPersonTextField, salesPersonId);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(assignSalesPerson);
        boolean isDisplayedHeaderSalesPerson = generalUtility.isElementDisplayed(salesPersonHeader);
        if (isDisplayedHeaderSalesPerson){
            mobileActions.clickOnElement(assignSalesPerson);}
        if (properties.getProperty("Brand").equals("TBL") || properties.getProperty("Brand").equals("TNF") && properties.getProperty("DeviceName").contains("iPad")) {
            Thread.sleep(5000);        //This is to make sure that the Skip button in the next page is getting clicked
            customerPage.clickOnSkipButton();
        }
    }

    public void clickOnTodaySaleButton() {
        generalUtility.isElementDisplayed(todaySaleHistories);
        mobileActions.clickOnElement(todaySaleHistories);
    }

    public void clickOnLastHistoryButton() {
        mobileActions.clickOnElement(lastSaleHistories);
    }

    public void clickOnSalesHistoryButtonBack() {
        mobileActions.clickOnElement(saleHistoryBackButton);
    }

    public void validatesCamIconAndItemField() {
        generalUtility.isElementDisplayed(itemAssignField);
        mobileActions.clickOnElement(itemAssignField);
        mobileActions.clickOnElement(camButton);
        mobileActions.clickOnElement(scanBackArrow);
    }

    public void clickOnCancelButtonFromNotOnFileItem() {
        mobileActions.clickOnElement(notOnFileCancelButton);
    }


    public void getTransactionDate() {
        String date = transactionDate.getText();
        // Define a regular expression pattern to match the date in MM/DD/YYYY format
        Pattern pattern = Pattern.compile("\\d{2}/\\d{2}/\\d{4}");
        Matcher matcher = pattern.matcher(date);
        if (matcher.find()) {
            extractedDate = matcher.group();
            System.out.println("Extracted date: " + extractedDate);
        } else {
            System.out.println("No date found in the text.");
        }
    }

    public void validateColorOfBasketPage() throws IOException {
        String colour = generalUtility.getElementColorName(logoImage);
        System.out.println("Colour is " + colour);
        if (properties.getProperty("Brand").equals("TNF") && properties.getProperty("StoreNumber").equals("400528")) {
            assertTrue("Color is not black, but" + colour, colour.equalsIgnoreCase("Black"));
        } else if (properties.getProperty("Brand").equals("TNF") && (properties.getProperty("StoreNumber").equals("400318") || properties.getProperty("StoreNumber").equals("101261"))) {
            assertTrue("Color is not Red, but" + colour, colour.equalsIgnoreCase("Red"));
        } else if (properties.getProperty("Brand").equals("TBL")) {
            assertTrue("Color is not orange, but" + colour, colour.equalsIgnoreCase("Orange"));
        } else if (properties.getProperty("Brand").equals("DCK")) {
            assertTrue("Color is not blue, but" + colour, colour.equalsIgnoreCase("Blue"));
        }
    }

    public void clickGiftCardItem(int index) {
        WebElement giftCard = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemDescription'])[" + index + "]"));
        mobileActions.clickOnElement(giftCard);
    }

    public void priceOverrideMinimumLimit(Double price) {
        WebElement overridePrice = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice'])[1]"));
        double itemPrice = Double.parseDouble(generalUtility.getTextFromElement(overridePrice).replaceAll("[\\$()]", "").trim());
        if (itemPrice >= price) {
            System.out.println("Minimum Limit limit is greater than 0");

        } else {
            System.out.println("Minimum limit exceeded");
        }
    }


    public void promotionNotAppliedValidation(String discount) {
        String productDescription = generalUtility.getTextFromElement(itemDescription);
        System.out.println(productDescription);
//        assertTrue("Expected discount is not applied:" + discount, productDescription.contains(discount));
        boolean status = productDescription.contains(discount);
        assertFalse("Test Failed: Promotion applied to return item", status);
    }

    public void assignTerminatedSalesPerson(String salesPersonId) throws InterruptedException {
        mobileActions.enterText(salesPersonTextField, salesPersonId);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(assignButton);
    }

    public void validateInvalidSalespersonError() throws InterruptedException {
        generalUtility.isElementDisplayed(invalidSalespersonError);
        mobileActions.clickOnElement(closeButton);
        customerPage.clickOnSkipButton();    //skip from salesperson page
        Thread.sleep(2000);            //This is to wait for the customer prompt window
        customerPage.clickOnSkipButton();   //skip the customer prompt
    }

    public void validateInvalidEmployeeErrorPopUpMessage() {
        generalUtility.isElementDisplayed(invalidEmployeeErrorMessage);
        mobileActions.clickOnElement(closeButton);

    }

    public void validatePriceOverrideAmount() {
        String priceOverrideAmountWithDollar = originalPriceProduct.getText();
        String priceOverrideAmountWithOutDollar = priceOverrideAmountWithDollar.replace("$", "").trim();
        Assert.assertTrue("Mismatch in price override amount", priceOverrideAmountWithOutDollar.contains(priceOverRideAmount));
        mobileActions.clickOnElement(cancelButton);
    }

    public void clickOnIndividualReceiptGiftCardButton() {
        mobileActions.clickOnElement(individualReceiptButton);
    }


    //To get the salesperson name from basket name
    public void getSalesPersonNames() {
        String salesPersonNames = salesPersonName.getText();
        String regex = "Salesperson:\\s+([A-Za-z]+)\\s+([A-Za-z]+)";

        // Compile the pattern
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(salesPersonNames);
        salespersonList = new ArrayList<>();
        // Find and print the matched text
        while (matcher.find()) {
            String result = matcher.group(1);  // Get the matched group (immediate follower of 'Salesperson:')
            salespersonList.add(result);
            System.out.println("Extracted text: " + result);
        }
        System.out.println(salesPersonNames);
    }

    public void validateDiscountedAmount(int amount) {
        String originalPriceWithDollar = originalPriceProduct.getText();
        String productDescription = generalUtility.getTextFromElement(itemDescription);
        String originalPriceWithOutDollar = originalPriceWithDollar.replace("$", "").trim();
        Double discountedPrice = Double.parseDouble(originalPriceWithOutDollar) - amount;
        Assert.assertTrue("Amount not discounted", productDescription.contains(String.valueOf(String.format("%.2f", discountedPrice))));
    }

    public void getDiscountApplied(int amount) {
        double discount = Double.parseDouble(generalUtility.getTextFromElement(discountLabel).replaceAll("[\\$()]", "").trim());
//        assertEquals("Discount amount mismatch", String.valueOf(discount), String.valueOf(amount));
        assertEquals("Discount amount mismatch", discount, (double) amount, 0.0);
    }

    public void validateDiscountNotGettingAppliedToGiftCard() {
        String originalGiftCardPrice = originalPriceProduct.getText();
        String originalGiftCardPriceWithOutDollar = originalGiftCardPrice.replace("$", "").trim();
        Assert.assertTrue("New gift card got discounted", saveGiftCardIssueAmount.contains(originalGiftCardPriceWithOutDollar));
    }

    public void validateTwoFrThirtyPromoApplied() {
        double subtotal = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());
        double promo = 30.00;
        Assert.assertEquals(subtotal, promo, 0);
    }

    public void validateStoreDetailsInReceipt() throws InterruptedException {
        Thread.sleep(5000);
        String physicalReceiptContent = apiHelper.getPhysicalReceiptData(saleTransactionID);
        System.out.println(physicalReceiptContent);
        Assert.assertTrue("Store details are missing", physicalReceiptContent.contains(storeAddress));
    }

    public void clickOnBackButtonReprintLastReceipt() {
        mobileActions.clickOnElement(backButtonLastReceipt);
    }

    public void clickOnReturnReasonButton() {
        mobileActions.clickOnElement(returnReasonButton);
    }


    //Validate transactional level percentage off reflected in the discount
    public void validateTransactionalLevelPercentageOffApplied(int percentage, int noOfItems) {
        double sum = 0;
        //List to store the original price of all products in the basket
        List<Double> results = new ArrayList<>();
        //Loop through all the products in the basket and store the original price to the created array
        for (int i = 1; i <= noOfItems; i++) {
            WebElement originalPrice = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice'])[" + i + "]"));
            double itemPrice = Double.parseDouble(generalUtility.getTextFromElement(originalPrice).replaceAll("[\\$()]", "").trim());
            results.add(itemPrice);
        }
        for (double value : results) {
            sum += value;
        }
        // calculate the amount got deducted from the transaction
        double discountedAmount = ((double) percentage / 100) * sum;
        // format discounts to two decimal points and round
        DecimalFormat df = new DecimalFormat("#.##");
        String formattedDiscountedAmount = df.format(discountedAmount);
        System.out.println(Double.parseDouble(formattedDiscountedAmount));
        //check the discounts stored and the calculated discount are same
        Assert.assertTrue("Transactional level percentage mismatch", (Double.parseDouble(formattedDiscountedAmount) == discount));
    }

    public void validateDefaultTaxRate() {
        String appliedTax = generalUtility.getTextFromElement(taxLabel).replaceAll("[\\$()]", "").trim();
        double taxRate = (Double.parseDouble(firstItemExtendedPrice) * Double.parseDouble(currentTaxRate)) / 100;
        String formattedTaxRate = df.format(taxRate);
        assertEquals(formattedTaxRate, appliedTax);
    }

    public void validateCombinedDiscounts() {
        Double originalPrice = Double.valueOf(firstItemExtendedPrice);
        Double combinedDiscounts = Double.parseDouble(generalUtility.getTextFromElement(firstDiscountLine).replaceAll("[\\$()]", "").trim()) +
                Double.parseDouble(generalUtility.getTextFromElement(secondDiscountLine).replaceAll("[\\$()]", "").trim());
    }

    public void validateAllDiscountsAppliedAfterTwoForThirty() {
        Double discountAfter10PercentApplied = (double) ((10 / 100) * 30);
        Double discountAfter30PercentageManualDiscount = (discountPercentage / 100) * discountAfter10PercentApplied;
        Assert.assertTrue("Discount mismatch", discount == discountAfter30PercentageManualDiscount);
    }

    public void validateGiftCardBalance(String amount) {
        System.out.println("Balance: " + giftCardBalanceAmount);
        assertEquals("Test Failed: Gift Card balance is not " + amount, giftCardBalanceAmount, amount);
    }

    public String giftCardBalanceAmountForEJ() {
        String giftCardInitialBalance = getGiftCardBalanceAmount.getText();
        String regex = "(\\d+\\.\\d{2})";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(giftCardInitialBalance);
        if (matcher.find()) {
            giftCardBalanceAmount = matcher.group(1).trim();
        }
        return giftCardBalanceAmount;
    }

    public void validateOverridePrice(Double price, Integer index) {
        WebElement originalPrice = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice'])[" + index + "]"));
        double itemPrice = Double.parseDouble(generalUtility.getTextFromElement(originalPrice).replaceAll("[\\$()]", "").trim());
        Assert.assertEquals(price, itemPrice, 0);
    }

    public void storeTransactionAmountDetails() {
        transactionSubtotalAmount = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());
        transactionDiscountAmount = Double.parseDouble(generalUtility.getTextFromElement(discountLabel).replaceAll("[\\$()]", "").trim());
        transactionTaxAmount = Double.parseDouble(generalUtility.getTextFromElement(taxLabel).replaceAll("[\\$()]", "").trim());
        transactionTotalSummaryAmount = Double.parseDouble(generalUtility.getTextFromElement(totalSummaryLabel).replaceAll("[\\$()]", "").trim());
    }

    public void clickTaxExemptButtonTransactionalLevel() {
        mobileActions.clickOnElement(taxExemptButtonTransactionalLevel);
    }

    public void validateNonMerchItemList() {
        String itemList = generalUtility.getTextFromElement(nonMerchItemList);
        System.out.println(itemList);
        assert !itemList.matches("Shipping") || itemList.equals("Shipping");
    }

    public void validateDoNotCombinedPromotions(String promo1, String promo2) {

        //Validation of first item
        WebElement item1 = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[1]"));
        mobileActions.clickOnElement(item1);
        String item1Description = generalUtility.getTextFromElement(itemDescription);
        assertTrue("Expected discount is not applied:" + promo1, item1Description.contains(promo1));
        assertFalse("Unexpected discount is applied" + promo2, item1Description.contains(promo2));

        clickOnCancelButton();    //navigate back to basket

        //Validation of second item
        WebElement item2 = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[2]"));
        mobileActions.clickOnElement(item2);
        String item2Description = generalUtility.getTextFromElement(itemDescription);
        assertTrue("Expected discount is not applied:" + promo2, item2Description.contains(promo2));
        assertFalse("Unexpected discount is applied" + promo1, item2Description.contains(promo1));

        clickOnCancelButton();    //navigate back to basket
    }
    public void validateDoNotCombinedPromotionsNew(String promo1, String promo2) {

        //Validation of first item
        WebElement item1 = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[1]"));
        mobileActions.clickOnElement(item1);
        String item1Description = generalUtility.getTextFromElement(itemDescription);
        assertTrue("Expected discount is applied:" + promo2, item1Description.contains(promo2));
        assertFalse("Unexpected discount is not applied" + promo1, item1Description.contains(promo1));

        clickOnCancelButton();    //navigate back to basket

    }


    public void validatesAnErrorMessageItemNotFound() {
        generalUtility.isElementDisplayed(itemNotFoundPopUpInvalidItem);
        mobileActions.clickOnElement(itemNotFoundOKButton);
    }

    public void validateStoreCopyOfReturnedItem() throws InterruptedException {
        Thread.sleep(10000);
        String physicalStoreCopyReceiptContent = apiHelper.getPhysicalReceiptData(saleTransactionID);
        System.out.println(physicalStoreCopyReceiptContent);
        Assert.assertTrue("Store copy receipt is not printed", physicalStoreCopyReceiptContent.contains(storeAddress));
    }

    public void itemTaxExemptValidation(String discount) {
        String productDescription = generalUtility.getTextFromElement(itemDescription);
        assertFalse("Tax Exempt is applied:" + discount, productDescription.contains(discount));
    }

    public void validateTempMDDiscount() {
        double discount = Double.parseDouble(generalUtility.getTextFromElement(discountLabel).replaceAll("[\\$()]", "").trim());
        double discountDisplayed = Double.parseDouble(String.valueOf(discount));
        double calculatedDiscount = productOriginalPrice - productTempMDPrice;
        System.out.println(discountDisplayed);
        System.out.println(calculatedDiscount);
        double roundedAmount = Math.round(calculatedDiscount * 100.0) / 100.0;
        //assertEquals(discount, roundedAmount, 0);
        assertEquals(discount, roundedAmount, 0.01);
    }

    public void scrollBasketScreen() throws InterruptedException {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            Thread.sleep(2000);
            w3CActions.scrollUp();
        } else {
            w3CActions.scrollUp();
        }
    }

    public void validateTransactionLevelDiscount(String discountValue) {
        double subtotal = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());
        double discount = Double.parseDouble(generalUtility.getTextFromElement(discountLabel).replaceAll("[\\$()]", "").trim());
        double totalSummary = Double.parseDouble(generalUtility.getTextFromElement(totalSummaryLabel).replaceAll("[\\$()]", "").trim());

        int discountApplied = Integer.parseInt(discountValue.replaceAll("[\\$%]", "").trim());

        if (discountValue.contains("%")) {
            //DecimalFormat df = new DecimalFormat("#.##");
            double discountAmount = (this.subtotal * discountApplied) / 100;
            double roundedDiscount = Math.round(discountAmount * 100.0) / 100.0;
            //discountAmount = Double.parseDouble(df.format(discountAmount));
            assertEquals((roundedDiscount + this.discount), discount, 0);
        } else if (discountValue.contains("$")) {
            double discountAmount = ((this.subtotal - subtotal) + this.discount);
            assertEquals(discountAmount, discount, 0);
        }
    }

    public void stackedPromotionValidation() {
        if (properties.getProperty("BrandRegion").equals("DCK")) {
            double discountAfterFirstPromotionGotApplied = Double.parseDouble(firstItemExtendedPrice) * 0.10;
            String formattedNumber = String.format("%.2f", discountAfterFirstPromotionGotApplied);
            double priceAfterFirstPromoGotApplied = Double.parseDouble(firstItemExtendedPrice) - Double.parseDouble(formattedNumber);
            double discountAfterSecondPromotionApplied = priceAfterFirstPromoGotApplied * 0.10;
            String formattedNumber2 = String.format("%.2f", discountAfterSecondPromotionApplied);
            double priceAfterSecondPromoGotApplied = priceAfterFirstPromoGotApplied - Double.parseDouble(formattedNumber2);
            DecimalFormat df = new DecimalFormat("#.##");
            String discountPrice = df.format(priceAfterSecondPromoGotApplied);
            double subtotal = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());
            Assert.assertTrue("Stacked Promotion calculation mismatch", Double.parseDouble(discountPrice) == subtotal);
        } else {
//            double discountAfterFirstPromotionGotApplied = Double.parseDouble(firstItemExtendedPrice) * 0.10;
//            double priceAfterFirstPromoGotApplied = Double.parseDouble(firstItemExtendedPrice) - discountAfterFirstPromotionGotApplied;
//            double discountAfterSecondPromotionApplied = priceAfterFirstPromoGotApplied * 0.10;
//            double priceAfterSecondPromoGotApplied = priceAfterFirstPromoGotApplied - discountAfterSecondPromotionApplied;
//            double subtotal = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());

            BigDecimal originalPrice = new BigDecimal(firstItemExtendedPrice);
            BigDecimal discountAfterFirstPromotionGotApplied = originalPrice.multiply(BigDecimal.valueOf(0.10));
            BigDecimal priceAfterFirstPromoGotApplied = originalPrice.subtract(discountAfterFirstPromotionGotApplied);
            BigDecimal secondDiscount = priceAfterFirstPromoGotApplied.multiply(BigDecimal.valueOf(0.10));
            BigDecimal priceAfterSecondPromo = priceAfterFirstPromoGotApplied.subtract(secondDiscount);
            priceAfterSecondPromo = priceAfterSecondPromo.setScale(2, RoundingMode.HALF_UP);
            String subtotalText = generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim();
            BigDecimal subtotal = new BigDecimal(subtotalText);
            //Assert.assertTrue("Stacked Promotion calculation mismatch", priceAfterSecondPromoGotApplied == subtotal);
            System.out.println(subtotal);
            Assert.assertTrue("Stacked Promotion calculation mismatch", priceAfterSecondPromo.equals(subtotal));
        }
    }

    public void storeTempMDUPC(int index) {
        WebElement product = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[" + index + "]"));
        String TempMDUPC = product.getText();
        TempMDProduct = TempMDUPC.replace("UPC: ", "");
    }

    public void validateTaxExempt() {
        double tax = Double.parseDouble(generalUtility.getTextFromElement(taxLabel).replaceAll("[\\$()]", "").trim());
        assert tax < this.tax : "Tax exempt is not applied";
    }

    public void calculateTaxAmount(int index) {
        WebElement product = driver.findElement(By.xpath("(//*[@name='Display-selectableItemLine-itemIdKeyType'])[" + index + "]"));
        mobileActions.clickOnElement(product);
        mobileActions.clickOnElement(productOriginalPriceReturn);
        double originalPrice = Double.parseDouble(generalUtility.getTextFromElement(productOriginalPriceReturn).replaceAll("[\\$()]", "").trim());
        //calculate the discount amount
        double priceDiscount = (originalPrice / 100) * discountPercentage;
        //calculate the price after discount
        double originalPriceAfterDiscount = originalPrice - priceDiscount;
        mobileActions.clickOnElement(taxButton);
        mobileActions.clickOnElement(lineActionPage.taxOverRideButton);
        List<WebElement> textFields = driver.findElements(By.xpath("//XCUIElementTypeTextField"));
        if (!textFields.isEmpty()) {
            // Get the first XCUIElementTypeTextField element
            WebElement firstTextField = textFields.get(0);
            // Get the value attribute of the first text field
            String taxRate = firstTextField.getAttribute("value");
            // Use regular expression to extract the number (remove the percentage symbol)
            String taxWithoutPercent = taxRate.replaceAll("[^0-9.]", "");
            // Convert the extracted string to a double
            double taxRateCurrent = Double.parseDouble(taxWithoutPercent);
            calculatedTaxAmount = (taxRateCurrent / 100) * originalPriceAfterDiscount;
            mobileActions.clickOnElement(cancelButton);
        }
    }

    public void validateTaxOverRideForMultipleItems() {
        double tax = Double.parseDouble(generalUtility.getTextFromElement(taxLabel).replaceAll("[\\$()]", "").trim());
        double totalTaxWithoutRounding = calculatedTaxAmount + taxAmount;
        DecimalFormat df = new DecimalFormat("#.00");
        String roundedTotalTax = df.format(totalTaxWithoutRounding);
        double totalTax = Double.parseDouble(roundedTotalTax);
        Assert.assertTrue("Tax calculation mismatch", tax == totalTax);
    }

    public void validateTaxOverrideAmount(String percent, int index) {
        WebElement taxOverrideAmount = driver.findElement(By.xpath("(//*[contains(@name,'Tax override')])[" + index + index + "]"));
        String overrideTax = generalUtility.getTextFromElement(taxOverrideAmount);
        System.out.println(overrideTax);

        int overrideValue = Integer.parseInt(percent.replaceAll("[\\$%]", "").trim());

        //find the position of the character
        int startPosition = overrideTax.indexOf(percent);
        int endPosition = overrideTax.indexOf("Qty", startPosition + percent.length());
        //get text after the position of the char
        double taxAmount = Double.parseDouble(overrideTax.substring(startPosition + percent.length(), endPosition).replace("$", "").trim());
        WebElement originalPrice = driver.findElement(By.xpath("(//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice'])[" + index + "]"));
        double itemPrice = Double.parseDouble(generalUtility.getTextFromElement(originalPrice).replaceAll("[//$]", "").trim());

        if (percent.contains("%")) {
            double calculateTax = (itemPrice * overrideValue) / 100;
            assert calculateTax == taxAmount;
            assertEquals(calculateTax, taxAmount, 0.00);
        }
    }

    public void calculateTotalAmountAfterApplyingCoupon() {
        double tax = Double.parseDouble(generalUtility.getTextFromElement(taxLabel).replaceAll("[\\$()]", "").trim());
        double taxInExchange = Double.parseDouble(taxAmountSale) - tax;
        //rounded to two decimal points
        DecimalFormat totalTaxInExchange = new DecimalFormat("#.00");
        double roundedTaxExchange = Double.parseDouble(totalTaxInExchange.format(taxInExchange));
        System.out.println(roundedTaxExchange);
        double totalSummary = taxInExchange + originalPriceAfterDiscount;
        double exchangePrice = Double.parseDouble(totalPaymentSale) - totalSummary;
        double totalRefundAmount = Double.parseDouble(generalUtility.getTextFromElement(totalTransaction).replaceAll("[\\$()]", "").trim());
        assertEquals("Refund amount mismatch in exchange", exchangePrice, totalRefundAmount, 0.0);
    }

    public void storePromoPrice() {
        double originalPrice = Double.parseDouble(generalUtility.getTextFromElement(productOriginalPriceReturn).replaceAll("[\\$()]", "").trim());
        //calculate the discount amount
        double priceDiscount = (originalPrice / 100) * 20;
        //calculate the price after discount
        originalPriceAfterDiscount = originalPrice - priceDiscount;
        System.out.println(originalPriceAfterDiscount);
        mobileActions.clickOnElement(cancelButton);
    }

    public void isDckLogoDisplayed() {
        generalUtility.isElementDisplayed(dckLogoBasket);
    }

    public void receiptReprintAvailableTwice() {
        By elementLocator = By.xpath("//*[@label='Print']");
        boolean result = generalUtility.isElementExists(elementLocator);
        assertFalse("Receipt reprint option available for third time", result);
    }

    public void validatesAnErrorPopupFromZeroPrice() {
        generalUtility.isElementDisplayed(PriceCannotBeZeroPopUp);
        mobileActions.clickOnElement(ZeroPricePopUpOkButton);
    }

    public void validatesPriceOverridePriceAfterQuantityChange() {
        int totalAmountAfterQuantityChangeFollowedByPriceOverride = Integer.parseInt(priceOverRideAmount) * changeQuantityCount;
        System.out.println(totalAmountAfterQuantityChangeFollowedByPriceOverride);
        System.out.println(subtotal);
        Assert.assertTrue("Price overriden amount is not correct after quantity change", (double) totalAmountAfterQuantityChangeFollowedByPriceOverride == subtotal);
    }

    public void validateUserIsAdded(String userName) {
        String associateName = generalUtility.getTextFromElement(associateNameTag);
        assertTrue("Test failed: Associate not added for item ", associateName.contains(userName));
    }

    public void clickOniPhoneMenuButton() {
        mobileActions.clickOnElement(iPhoneMenuButton);
    }

    public void clickOnLineActionBackButton() {
        mobileActions.clickOnElement(iPhoneLineActionsBackButton);
    }

    public void clickOnResumePageBackButton() {
        mobileActions.clickOnElement(iPhoneResumePageBackButton);
    }

    public void validateInvalidEmployeeError() throws InterruptedException {
        generalUtility.isElementDisplayed(invalidEmployeeError);
        mobileActions.clickOnElement(closeButton);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            mobileActions.clickOnElement(basketButtonInHeader);
        }
        mobileActions.clickOnElement(selectOkButton);
    }

    public void clickOnDiscardOkButton() {
        mobileActions.clickOnElement(okButton);
    }

    public void validateEmployeeDiscount(double employeeDiscountPercentage) {
        double subtotal = Double.parseDouble(generalUtility.getTextFromElement(subtotalLabel).replaceAll("[\\$()]", "").trim());
        System.out.println(subtotal);
        double amountEmployeeDiscountApplied = (subTotalAmount * employeeDiscountPercentage) / 100;
        double priceAfterEmployeeDiscountApplied = subTotalAmount - amountEmployeeDiscountApplied;
        double finalPrice = Double.parseDouble(String.format("%.2f", priceAfterEmployeeDiscountApplied));
        assertEquals("Employee discount amount mismatch", subtotal, finalPrice, 0.0);
    }

    public void scrollUp() throws InterruptedException {
        if (!properties.getProperty("DeviceName").equals("iPhone")) {
            w3CActions.scrollUp();
        } else {
            Thread.sleep(2500);
            w3CActions.scrollUp();
        }
    }

    public void validateSameEmployeeErrorPopUpMessage() {
        generalUtility.isElementDisplayed(sameEmployeeErrorMessage);
        mobileActions.clickOnElement(closeButton);
    }

    public void validateEmployeeDiscountNotApplyInBlindReturn() {
        String productDescription = generalUtility.getTextFromElement(itemDescription);
        assertFalse("Employee discount got applied", productDescription.contains("Employee Sale"));
    }

    public void validatesPromoNotApplied() {
        String discountLabel = generalUtility.getTextFromElement(getDiscount);
        assertTrue("Promo got applied", discountLabel.contains("$0.00"));
    }

    public void validateEmpDiscountNotAppliedToShipping() {
        String productDescription = generalUtility.getTextFromElement(shippingDescription);
        System.out.println(productDescription);
        assertFalse("Employee discount got applied", productDescription.contains("Employee Sale"));
    }

    public void selectShippingItem() {
        mobileActions.clickOnElement(shippingItem);
    }

}

