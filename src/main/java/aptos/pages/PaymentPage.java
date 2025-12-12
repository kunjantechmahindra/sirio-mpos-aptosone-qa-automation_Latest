package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.ApiHelper;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.TestDataHelper;
import io.cucumber.java.en.And;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static aptos.pages.BasketPage.extractedDate;
import static aptos.pages.BasketPage.salespersonList;

import static aptos.pages.CustomerPage.availableLoyaltyPoints;
import static aptos.pages.EmailValidation.countOccurrences;
import static aptos.stepDefinition.BasketPageStepDefinition.ProductCode;
import static aptos.stepDefinition.PaymentPageStepDefinition.saleTransactionID;
import static aptos.stepDefinition.ProductInquiryPageStepDefinition.itemUPC;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class PaymentPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();
    ApiHelper apiHelper = new ApiHelper();
    public static double USDToCADValue;
    public static double rewardBalance;
    public static double rewardPrice;

    // Initializing the Page Objects
    public PaymentPage() {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "(//*[@name='Payment-Cash-button'])[last()]")
    WebElement cashButton;

    @FindBy(xpath = "//*[@name='Payment-Card-button']")
    WebElement cardButton;

    @FindBy(xpath = "//*[@value='Drawer ID']")
    WebElement drawerID;

    @FindBy(xpath = "//*[@name='Done']")
    WebElement doneKey;

    @FindBy(xpath = "//*[@label='Print']")
    WebElement printButton;

    // @name == "ReceiptOptionForm-print-button"

    @FindBy(xpath = "(//*[contains(@label, 'Simulated Printer Device')])[last()]")
    WebElement printerIdTbl;

    //@FindBy(xpath = "(//*[contains(@label, 'Printer-1')])[last()]")
    @FindBy(xpath = "(//*[contains(@label, 'Simulated Printer Device')])[last()]")
    WebElement printerIdTnf;

    @FindBy(xpath = "(//*[contains(@label, 'Printer-1')])[last()]")
    WebElement printerIdDck;

    @FindBy(xpath = "(//*[contains(@name, 'Continue')])[last()]")
    WebElement continueButton;

    @FindBy(xpath = "//*[@name='Payment-transactionNumber-text']")
    WebElement transactionIDLabel;

    @FindBy(xpath = "//*[@name='Display-summaryTransactionNumberLabel']")
    WebElement iPhoneTransactionIDLabel;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-totalSavings']")
    WebElement discountLabel;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-tax']")
    WebElement taxLabel;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-total']")
    WebElement totalPaymentLabel;

    @FindBy(xpath = "//*[@name='TenderLine-tenderType-label']")
    WebElement partialPaymentDetail;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Refunded']")
    WebElement refundLabel;

    @FindBy(xpath = "//*[@value='Printer ID']")
    WebElement printerName;

    //@FindBy(xpath = "//*[@name='Payment-total']")
    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Payment-totalDue-text']")
    WebElement totalDueAmount;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Payment-totalDueAmount-text']")
    WebElement iPhoneTotalDueAmount;

    @FindBy(xpath = "//XCUIElementTypeTextField[contains(@value, '$')]")
    WebElement enterPaymentAmount;

    @FindBy(xpath = "(//XCUIElementTypeStaticText[@name='Refunded'])[2]")
    WebElement refundHeader;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='MainScreen-header-title']")
    WebElement pageHeader;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Close'])[2]")
    WebElement closeButton;

    @FindBy(xpath = "//*[@name='Payment-void-actionButton-button']")
    WebElement voidButton;

    @FindBy(xpath = "//*[@name='OK']")
    WebElement okButton;

    @FindBy(xpath = "//*[@name='MainScreen-header-title']")
    WebElement headerTitle;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Basket']")
    WebElement basketButton;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Payment-MasterCard')]")
    WebElement masterCardButton;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Payment-Debit')]")
    WebElement visaCardButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Membership Rewards Returns-button']")
    WebElement memberShipRewardRefund;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Card-button']")
    WebElement cardButtonForRefund;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Gift Card-button']")
    WebElement giftCardButton;

//    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-header-title']")
//    WebElement receiptHeader;

    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name,'Receipt')]")
    WebElement receiptHeader;

    @FindBy(xpath = "//XCUIElementTypeSecureTextField[@value='Gift card number']")
    WebElement giftCardNumberText;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Redeem'])[last()]")
    WebElement redeemButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReceiptOptionForm-email-button']")
    WebElement emailButton;

    @FindBy(xpath = "//XCUIElementTypeTextField[@name='receiptEmail-emailAddress-textInput']")
    WebElement emailText;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name,'GIFT CARD (')]")
    WebElement giftCardPaidLabel;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-amountDue']")
    WebElement changeDueAmount;

    @FindBy(xpath = "//*[contains(@name, 'DEBIT (..')]")
    WebElement completedPartialPaymentVisa;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='AUTHORIZING']")
    WebElement paymentAuthorization;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReceiptOptionForm-emailAndPrintReceipt-button']")
    WebElement emailAndPrintButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Payment-totalDue-text']")
    WebElement refundAmount;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Basket'])[2]")
    WebElement bottomBasketIcon;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Issue']")
    WebElement issueButtonPayment;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='REFUND DUE $60.00 Card Gift Card Horizontal scroll bar, 1 page Vertical scroll bar, 1 page']")
    WebElement noCashButtonEnabled;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Diners (...0046)-button']")
    WebElement dinersCardButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Discover (...0133)-button']")
    WebElement discoverCardButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-Debit (...0135)-button']")
    WebElement visaDebitCardButton;

    @FindBy(xpath = "//*[@name='Payment-Membership Rewards-button']")
    WebElement membershipRewardButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='No membership rewards available.']")
    WebElement noRewardsText;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Membership Rewards'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement backButtonFromRewardsPage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='LoyaltyVoucher-$50_Loyalty_RewardApplyButton']")
    WebElement rewardLoyalty;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Membership Rewards'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement memberShipBack;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Membership Rewards applied']")
    WebElement membershipAppliedPopup;

    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, 'NOT_ENOUGH_BALANCE')]")
    WebElement giftCardRefusalMessage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-otherTenders-button']")
    WebElement moreButtonInTenders;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='RCM Tenders']")
    WebElement RCMTendersButton;

    @FindBy(xpath="//*[@name='Cancel']")
    WebElement CancelfromMore;

//    @FindBy(xpath = "//XCUIElementTypeOther[@name='TenderLineList-tender']/XCUIElementTypeScrollView/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther")
//    WebElement voidPaymentButton;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Employee number']")
    WebElement empNumberTextFieldRCM;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Apply'])[last()]")
    WebElement applyButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and contains(@label, Cash)]")
    WebElement cashOption;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='DECLINED - Refusal']")
    WebElement cardDeclinedRefusalMessage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='US Dollar']")
    WebElement USDollar;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Payment-US Dollar-button']")
    WebElement USDollarTender;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Payment-totalDue-text']")
    WebElement totalAmountUSDollar;

    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, '1 USD =')]")
    WebElement USDtoCAD;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Membership Rewards']")
    WebElement membershipRewardButtonTNF;

    @FindBy(xpath = "(//XCUIElementTypeStaticText[@name='TenderLine-tenderType-amount'])[last()]")
    WebElement rewardApplied;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Payment-title-text']")
    WebElement paymentPageHeader;

    @FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, 'Receipt')]")
    WebElement receiptPageHeader;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Ok'])[2]")
    WebElement okButtonUnusedCouponPage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='TenderLineList-tender']/XCUIElementTypeOther/XCUIElementTypeOther[3]")
    WebElement paymentVoidButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Payment-refundedTenders-text']")
    WebElement iPhoneRefundHeader;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-total']")
    WebElement iPhoneTotalPaymentLabel;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-tax']")
    WebElement iPhoneTaxLabel;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ReceiptSummary-totalSavings']")
    WebElement iPhoneDiscountLabel;

    //Actions
    public void clickOnCashButton() {
        mobileActions.clickOnElement(cashButton);
    }

    public void clickOnBasketButton() {
        mobileActions.clickOnElement(basketButton);
    }

    public void clickOnCardButton() {
        mobileActions.clickOnElement(cardButton);
    }

    public void enterDrawerID(String drawerIdValue) {
        mobileActions.enterText(drawerID, drawerIdValue);
    }

    public void keyboardClickOnDone() {
        mobileActions.clickOnElement(doneKey);
    }

    public void clickOnPrintButton() {
        generalUtility.isElementDisplayed(printButton);
        mobileActions.clickOnElement(printButton);
    }

    public void enterEmailText() throws InterruptedException {
        mobileActions.enterText(emailText, properties.getProperty("E-receiptEmail"));
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.iPhoneHideKeyboard();
        } else {
            mobileActions.clickOnElement(receiptHeader);
        }
        mobileActions.clickOnElement(continueButton);
    }

    public void enterContinueButtonWithOutEnteringMailID() {
        mobileActions.clickOnElement(receiptHeader);
        mobileActions.clickOnElement(continueButton);
    }

    public void selectPrinter() {
        mobileActions.clickOnElement(printerIdTbl);
        mobileActions.clickOnElement(continueButton);
    }

    public void selectPrinterByEnteringName() throws InterruptedException {
        //mobileActions.enterText(printerName, properties.getProperty("PrinterName"));
        //mobileActions.clickHideKeyboard();
        if (properties.getProperty("Brand").equals("TNF")) {
            mobileActions.clickOnElement(printerIdTnf);
        } else if (properties.getProperty("Brand").equals("DCK")) {
            mobileActions.clickOnElement(printerIdDck);
        } else
            mobileActions.clickOnElement(printerIdTbl);
        mobileActions.clickOnElement(continueButton);
    }

    public void selectPrinterByEnteringNameAndSaveReceipt() throws InterruptedException {
        mobileActions.enterText(printerName, properties.getProperty("PrinterName"));
        mobileActions.clickHideKeyboard();
        if (properties.getProperty("Brand").equals("TNF")) {
            mobileActions.clickOnElement(printerIdTnf);
            mobileActions.clickOnElement(continueButton);
            new Thread(() -> {
                ApiHelper.captureBarcode(saleTransactionID);
            }).start();
        } else if (properties.getProperty("Brand").equals("TBL")) {
            mobileActions.clickOnElement(printerIdTbl);
            mobileActions.clickOnElement(continueButton);
            new Thread(() -> {
                ApiHelper.captureBarcode(saleTransactionID);
            }).start();
        } else {
            mobileActions.clickOnElement(printerIdDck);
            mobileActions.clickOnElement(continueButton);
            new Thread(() -> {
                ApiHelper.captureBarcode(saleTransactionID);
            }).start();
        }
    }

    public String getTransactionID() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            String transactionID = iPhoneTransactionIDLabel.getText();
            return transactionID.replaceAll("[()]", "");
        }
        String transactionID = transactionIDLabel.getText();
        return transactionID.replaceAll("[()]", "");
    }

    public String getTotalPayment() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            String totalPayment = iPhoneTotalPaymentLabel.getText();
            return totalPayment.replaceAll("[\\$()]", "").trim();
        } else {
            String totalPayment = totalPaymentLabel.getText();
            return totalPayment.replaceAll("[\\$()]", "").trim();
        }
    }

    public String getTaxLabel() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            String taxText = iPhoneTaxLabel.getText();
            System.out.println(taxText.replace("$", "").trim());
            return taxText.replaceAll("[\\$()]", "").trim();
        } else {
            String taxText = taxLabel.getText();
            System.out.println(taxText.replace("$", "").trim());
            return taxText.replaceAll("[\\$()]", "").trim();
        }
    }

    public String getDiscount() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            String discount = iPhoneDiscountLabel.getText();
            return discount.replace("(", "").replace(")", "").replace("$", "").trim();
        } else {
            String discount = discountLabel.getText();
            return discount.replace("(", "").replace(")", "").replace("$", "").trim();
        }
    }

    public void enterHalfAmount() {
        String totalAmount;
        String device = properties.getProperty("DeviceName");
        if (device.contains("iPhone")) {
            totalAmount = generalUtility.getTextFromElement(iPhoneTotalDueAmount);
        } else {
            totalAmount = generalUtility.getTextFromElement(totalDueAmount);
        }
        String amountWithoutDollar = totalAmount.replace("$", "");
        double amount = Double.parseDouble(amountWithoutDollar);
        int halfAmount = (int) Math.floor(Double.parseDouble(String.valueOf(amount))) / 2;
        mobileActions.enterText(enterPaymentAmount, String.valueOf(halfAmount * 100));
        if (device.contains("iPhone")) {
            mobileActions.clickOnElement(iPhoneTotalDueAmount);
        } else {
            mobileActions.clickOnElement(totalDueAmount);
        }
    }

    public void verifyPartialPaymentCompletionStatus() {
        generalUtility.isElementDisplayed(partialPaymentDetail);
    }

    public void verifyRefundCompletionStatus() {
        generalUtility.isElementDisplayed(refundLabel);
    }

    public void selectCardForRefund(String cardName, int index) {
        String xpathExpression;
        if (index == 1) {
            xpathExpression = "(//XCUIElementTypeOther[contains(@name, 'Payment-" + cardName + "')])[1]";
        } else {
            xpathExpression = "(//XCUIElementTypeOther[contains(@name, 'Payment-" + cardName + "')])[last()]";
        }
        WebElement element = driver.findElement(By.xpath(xpathExpression));
        mobileActions.clickOnElement(element);
    }

    public void verifyRefundHeader() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            generalUtility.isElementDisplayed(iPhoneRefundHeader);
        } else {
            generalUtility.isElementDisplayed(refundHeader);
        }
    }

    public void voidFromPayment() {
        generalUtility.waitForElementToBeVisible(voidButton, 20);
        mobileActions.clickOnElement(voidButton);
        mobileActions.clickOnElement(okButton);
    }

    public void clickOnGiftCardButton() {
        mobileActions.clickOnElement(giftCardButton);
    }

    public void clickOnEmailButton() {
        mobileActions.clickOnElement(emailButton);
    }

    public void clickOnCloseButton() {
        mobileActions.clickOnElement(closeButton);
    }


    public boolean isCloseButtonDisplayed() {
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2));
            wait.until(ExpectedConditions.visibilityOf(closeButton));
            return true;
        } catch (TimeoutException e) {
            return false;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public boolean isVoidButtonDisplayed() {
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(2));
            wait.until(ExpectedConditions.visibilityOf(voidButton));
            return true;
        } catch (TimeoutException e) {
            return false;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public void clickOnMastCardButton() {
        mobileActions.clickOnElement(masterCardButton);
    }

    public void clickOnDinersCardButton() {
        mobileActions.clickOnElement(dinersCardButton);
    }

    public void clickOnDiscoverCardButton() {
        mobileActions.clickOnElement(discoverCardButton);
    }

    public void clickOnVisaCardButton() {
        mobileActions.clickOnElement(visaCardButton);
    }

    public void clickOnVisaDebitCardButton() {
        mobileActions.clickOnElement(visaDebitCardButton);
    }

    public void clickOnCardButtonForRefund() {
        mobileActions.clickOnElement(cardButtonForRefund);
    }

    public void enterGiftCardNumber(int index) throws IOException, ParseException {
        String giftCardNumber = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "cardNumber");
        mobileActions.enterText(giftCardNumberText, giftCardNumber);
    }

    public void clickOnRedeemButton() throws InterruptedException {
        mobileActions.clickHideKeyboard(); // clicking to hide the Keyboard
        mobileActions.clickOnElement(redeemButton);
    }

    public void enterGiftCardPin(int index) {
        String pin = null;
        try {
            pin = TestDataHelper.getGiftCardDetail(properties.getProperty("BrandRegion"), index, "pin");
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        apiHelper.enterPin(properties.getProperty("RoboticsStation"), pin, "ok");
    }

    public void isGiftCardPaidLabelDisplayed() {
        giftCardPaidLabel.isDisplayed();
    }

//    public void enterExtraAmount() {
//        String totalAmount = generalUtility.getTextFromElement(totalDueAmount);
//        String amountWithoutDollar = totalAmount.replace("$", "");
//        double amount = Double.parseDouble(amountWithoutDollar);
//        double extraAmount = amount + 10;
//        //int extraAmount = (int) Math.floor(Double.parseDouble(String.valueOf(amount))) + 10;
//        mobileActions.enterText(enterPaymentAmount, String.valueOf(extraAmount));
//        System.out.println(extraAmount);
//        mobileActions.clickOnElement(totalDueAmount);
//    }

    public void enterExtraAmount() {
        try {
            String totalAmount;
            if (properties.getProperty("DeviceName").contains("iPhone")) {
                totalAmount = generalUtility.getTextFromElement(iPhoneTotalDueAmount);
            } else {
                totalAmount = generalUtility.getTextFromElement(totalDueAmount);
            }
            String amountWithoutDollar = totalAmount.replaceAll("[$,]","").trim();
            //String amountWithoutDollar = totalAmount.replace("$", "").trim();
            double amount = Double.parseDouble(amountWithoutDollar);
            String formattedAmount = String.format("%.2f", amount);
            double extraAmount = Double.parseDouble(formattedAmount) + 10.00;
            DecimalFormat df = new DecimalFormat("0.00");

//            String extraAmountString = Double.toString(extraAmount);;
//            System.out.println("Extra Amount: " + extraAmountString);

            if (properties.getProperty("BrandRegion").equals("TNF-CA")) {
                BigDecimal bd = new BigDecimal(extraAmount).setScale(2, RoundingMode.HALF_UP);
                double roundedValue = bd.doubleValue();
                double remainder = roundedValue * 100 % 10;  // Get the hundredths place
                if (remainder >= 1 && remainder <= 4) {     // Round up to the next .05
                    roundedValue = Math.floor(roundedValue * 20) / 20.0 + 0.05;
                } else if (remainder >= 6 && remainder <= 9) {      // Round up to the next .10
                    roundedValue = Math.floor(roundedValue * 10) / 10.0 + 0.10;
                }

                BigDecimal finalValue = new BigDecimal(roundedValue).setScale(2, RoundingMode.HALF_UP);
                System.out.println("Final Value: " + finalValue);
                mobileActions.enterText(enterPaymentAmount, finalValue.toString());
                if (properties.getProperty("DeviceName").contains("iPhone")) {
                    mobileActions.clickOnElement(iPhoneTotalDueAmount);
                } else {
                    mobileActions.clickOnElement(totalDueAmount);
                }
            } else if (properties.getProperty("BrandRegion").equals("TBL-CA")) {
                BigDecimal bd = new BigDecimal(extraAmount).setScale(2, RoundingMode.HALF_UP);
                double roundedValue = bd.doubleValue();
                double remainder = roundedValue * 100 % 10;  // Get the hundredths place
                if (remainder >= 1 && remainder <= 4) {     // Round up to the next .05
                    roundedValue = Math.floor(roundedValue * 20) / 20.0 + 0.05;
                } else if (remainder >= 6 && remainder <= 9) {      // Round up to the next .10
                    roundedValue = Math.floor(roundedValue * 10) / 10.0 + 0.10;
                }

                BigDecimal finalValue = new BigDecimal(roundedValue).setScale(2, RoundingMode.HALF_UP);
                System.out.println("Final Value: " + finalValue);
                mobileActions.enterText(enterPaymentAmount, finalValue.toString());
                if (properties.getProperty("DeviceName").contains("iPhone")) {
                    mobileActions.clickOnElement(iPhoneTotalDueAmount);
                } else {
                    mobileActions.clickOnElement(totalDueAmount);
                }
            } else {
//                System.out.println("Original Amount: " + amount + ", Extra Amount: " + extraAmountString);
                mobileActions.enterText(enterPaymentAmount, String.valueOf(df.format(extraAmount)));
                if (properties.getProperty("DeviceName").contains("iPhone")) {
                    mobileActions.clickOnElement(iPhoneTotalDueAmount);
                } else {
                    mobileActions.clickOnElement(totalDueAmount);
                }
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid amount format: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("An error occurred while entering the extra amount: " + e.getMessage());
        }
    }

    public void enterExtraUSDollar() {
        String USDollar = generalUtility.getTextFromElement(totalAmountUSDollar);
        String amountWithoutUSDollar = USDollar.replace("US$", "").trim();
        double amount = Double.parseDouble(amountWithoutUSDollar);
        String formattedAmount = String.format("%.2f", amount);
        double extraAmount = Double.parseDouble(formattedAmount) + 10.00;
        mobileActions.enterText(enterPaymentAmount, String.valueOf(extraAmount));
        mobileActions.clickOnElement(totalAmountUSDollar);
        //Store the 1 USD amount in CAD
        String USDtoCADConversion = USDtoCAD.getText();
        Pattern pattern = Pattern.compile("(?<==\\s)(\\d+\\.\\d+)");
        Matcher matcher = pattern.matcher(USDtoCADConversion);
        if (matcher.find()) {
            USDToCADValue = Double.parseDouble(matcher.group(1));
            System.out.println(USDToCADValue);
        } else {
            System.out.println("No match found");
        }
    }

    public void validateChangeDue() {
        String changeDue = generalUtility.getTextFromElement(changeDueAmount);
        assertTrue("Miss match in change due", changeDue.contains("$10.00"));
    }

    public void validatePartialPaymentStatus(String card) {
        if (card.equalsIgnoreCase("visa")) {
            assertTrue("Partial payment not completed for Visa", generalUtility.isElementDisplayed(completedPartialPaymentVisa));
        }
    }

    public void voidPartialPayment() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(paymentVoidButton);
            mobileActions.clickOnElement(okButton);
        } else {
            if (properties.getProperty("BrandRegion").equals("TNF-CA")) {
//                mobileActions.clickUsingCoordinates(driver, 891, 604);
                mobileActions.clickUsingCoordinates(driver, 891, 631);
                mobileActions.clickOnElement(okButton);
            } else if (properties.getProperty("BrandRegion").equals("DCK")) {
                mobileActions.clickUsingCoordinates(driver, 889, 542);
            } else {
                mobileActions.clickUsingCoordinates(driver, 889, 604);
            }
        }
//        mobileActions.clickOnElement(okButton);
        generalUtility.waitForElementToBeVisible(cashButton, 10);
    }

    public void enterUpdatedAmount(int percentage) {
        String totalAmount = generalUtility.getTextFromElement(totalDueAmount);
        String amountWithoutDollar = totalAmount.replace("$", "");
        double amount = Double.parseDouble(amountWithoutDollar);
        int partialAmount = (int) Math.floor((Double.parseDouble(String.valueOf(amount))) * percentage) / 100;
        mobileActions.enterText(enterPaymentAmount, String.valueOf(partialAmount * 100));
        mobileActions.clickOnElement(totalDueAmount);
    }

    public String validateRefundAmount() {
        String refundAmountWithDollar = refundAmount.getText();
        return refundAmountWithDollar.replace("$", "").trim();
    }

    public void clickOnBasketIconFromBottomPayment() {
        mobileActions.clickOnElement(bottomBasketIcon);
    }

    public void clickOnIssueButtonFromPayment() {
        mobileActions.clickOnElement(issueButtonPayment);
    }

    public void validatesCashButtonDisabledNonReceipt() {
        boolean buttonStatus = generalUtility.isElementExists(By.xpath("(//*[@name='Payment-Cash-button'])[last()]"));
        System.out.println(buttonStatus);
        assertFalse("Cash button is present", buttonStatus);
    }

    public void validatesLoyaltyPointsInPhysicalReceipt() throws InterruptedException {
        Thread.sleep(5000);
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        System.out.println(physicalReceiptContent);
//        String physicalReceiptContentDelete= physicalReceiptContent.replace(",","".trim());
//        assertTrue("loyalty points mismatch", physicalReceiptContentDelete.contains(availableLoyaltyPoints));
    }

    public void validatesDifferentLineItemDisplayForSameItemInPhysicalReceipt() throws InterruptedException {
        Thread.sleep(5000);
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        int count = countOccurrences(physicalReceiptContent, itemUPC);
        assertTrue("UPCs are not displayed in different line items in physical receipt", (count == 2));
    }

    public void clickOnEmailAndPrintButton() {
        mobileActions.clickOnElement(emailAndPrintButton);
    }

    public void validatesIndividualGiftReceiptsArePrinted() throws InterruptedException {
        //wait until all the receipts got printed since 2 receipts are printing
        int receiptCountLabelCount = 0;
        String brand = properties.getProperty("Brand");
        Thread.sleep(8000);
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
//        System.out.println(physicalReceiptContent);
        int giftReceiptCount = countOccurrences(physicalReceiptContent, "Gift Receipt");
        if (brand.equals("TBL")) {
//            receiptCountLabelCount = countOccurrences(physicalReceiptContent, "\\nTimberland\\n");
            receiptCountLabelCount = countOccurrences(physicalReceiptContent, "\\nTimberland\\n");
            System.out.println("Print TBL: " + receiptCountLabelCount);
        } else if (brand.equals("TNF")) {
            receiptCountLabelCount = countOccurrences(physicalReceiptContent, "THE\\nNORTH\\nFACE\\n");
            System.out.println("Print TNF: " + receiptCountLabelCount);
        } else{
            receiptCountLabelCount = countOccurrences(physicalReceiptContent, "Dickies");
            System.out.println("Print DCK: " + receiptCountLabelCount);
        }

        assertTrue("Individual receipt for gift item not printed", (giftReceiptCount == 1));
        assertTrue("Individual receipts not printed", (receiptCountLabelCount == 2));
    }

    public void validateSalePersonNameIsNotDisplayedInPhysicalReceipt() {
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        boolean allFound = false;
        //loop through salesperson names list and check whether that name exists in physical receipt
        for (String salesPersonName : salespersonList) {
            if (physicalReceiptContent.contains(salesPersonName)) {
                Assert.fail("Physical receipt contains sales person name");
            } else allFound = true;
        }
        if (allFound) {
            System.out.println("Sale person name is not in the physical receipt");
        } else {
            System.out.println("Sale person name is in the physical receipt");
        }
    }

    public void clickOnRewardButton() {
        String brand = properties.getProperty("Brand");
        if (brand.equals("TBL")) {
            mobileActions.clickOnElement(membershipRewardButton);
        } else {
            mobileActions.clickOnElement(membershipRewardButtonTNF);
        }
    }

    public void validateNoRewardsDisplayed() {
        assertTrue("Test Failed: Customer is eligible for rewards", generalUtility.isElementDisplayed(noRewardsText));
        mobileActions.clickOnElement(backButtonFromRewardsPage);
    }

    public void validatePhysicalReceiptFooterLastDayOfReturn() {
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        if (properties.getProperty("Brand").equals("DCK")) {
            assertTrue("E-receipt don't have last day of return", physicalReceiptContent.contains("Last day for refund"));
        } else {
            assertTrue("E-receipt don't have last day of return", physicalReceiptContent.contains("Last Day for Return"));
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        // Parse the extracted date string into a LocalDate object
        LocalDate inputDate = LocalDate.parse(extractedDate, formatter);
        // Add 30 days to the input date
        LocalDate dateAfter30Days = inputDate.plusDays(30);
        //Convert to string
        String lastDayOfReturn = dateAfter30Days.format(formatter);
        System.out.println(lastDayOfReturn);
        assertTrue("Last day of return date mismatch", physicalReceiptContent.contains(lastDayOfReturn));
    }

    public void validatePhysicalReceiptFooterThankYouMessage() throws InterruptedException {
        Thread.sleep(5000);
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        assertTrue("Physical receipt doesn't contain Thank you message", physicalReceiptContent.contains("Thank you for shopping at"));
    }

    public void clickOnRewardAny(String reward) {
        if (generalUtility.isElementExists(By.xpath("//*[contains(@label, '$" + reward + ".00') and contains(@name,'ApplyButton')]"))) {
            WebElement rewardButton = driver.findElement(By.xpath("//*[contains(@label, '$" + reward + ".00') and contains(@name,'ApplyButton')]"));
            mobileActions.clickOnElement(rewardButton);
        } else {
            WebElement rewardButtonFirst = driver.findElement(By.xpath("//*[contains(@name,'ApplyButton')]"));
            mobileActions.clickOnElement(rewardButtonFirst);
        }
    }

    public void clickOnBackMemberShip() {
        mobileActions.clickOnElement(memberShipBack);
    }

    public void validateMemberShipApplied() {
        generalUtility.isElementDisplayed(membershipAppliedPopup);
    }

    public void validateCustomerNameInReceipt(int number) throws IOException, ParseException, InterruptedException {
        String name = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), number, "lastName");
        Thread.sleep(5000);
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        assert name != null;
        assertTrue("Test Failed: Customer name is not printed on the receipt", physicalReceiptContent.contains(name));
        System.out.println("Customer name has been printed in the physical receipt");
    }

    public void validateAvailableRewards() {

        int loyaltyPoints = Integer.parseInt(availableLoyaltyPoints.replace(",", ""));

        if (loyaltyPoints >= 0) {
            int rewards = 0;
            if (loyaltyPoints >= 250 && loyaltyPoints < 4000) {
                rewards = (loyaltyPoints / 250) * 25;
            } else if (loyaltyPoints >= 4000) {
                rewards = 400;
            }
            String maxRewards = String.valueOf(rewards); //convert available reward amount into string
            boolean rewardStatus = generalUtility.isElementExists(By.xpath("//XCUIElementTypeOther[@name='LoyaltyVoucher-$" + maxRewards + "_Loyalty_RewardApplyButton']")); //check for the presence of particular reward
            assertTrue("Test Failed: No Matching Rewards Available", rewardStatus);
        } else {
            assertTrue("Test Failed: rewards should not be available", generalUtility.isElementDisplayed(noRewardsText));
        }
        mobileActions.clickOnElement(backButtonFromRewardsPage); //navigate back to payment page
    }

    public void validateGiftCardInsufficientBalanceMessage() {
        assertTrue("Test Failed: Payment refusal message is not displayed", generalUtility.isElementDisplayed(giftCardRefusalMessage));
    }

    public void validateNegativeExchangeTransactionTotalWithBagFee() {
        String totalAmount = generalUtility.getTextFromElement(totalDueAmount);
        String amountWithoutDollar = totalAmount.replace("$", "").trim();
        //amountWithoutDollar=totalAmount.replace("00","").trim() ;
//        double expectedTransactionTotal = BasketPage.transactionTotalSummaryAmount - Double.parseDouble(BagFeePage.bagFeeAmount);
        double expectedTransactionTotal = Double.parseDouble(String.format("%.2f", BasketPage.transactionTotalSummaryAmount - Double.parseDouble(BagFeePage.bagFeeAmount)));
        Assert.assertEquals(expectedTransactionTotal, Double.parseDouble(amountWithoutDollar), 0);
        System.out.println("Calculated Total amount and Actual Total amount are accurate: " + expectedTransactionTotal);
    }

    public void clicksOnMoreButtonInTenders() {
        mobileActions.clickOnElement(moreButtonInTenders);
    }

    public void clicksOnRCMTenders() {
        mobileActions.clickOnElement(RCMTendersButton);
    }

    public void clicksOnRCMReasonCode(String reasonCode) {
        WebElement reasonCodeRCMTenders = driver.findElement(By.xpath("//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select' and @label='" + reasonCode + "']"));
        mobileActions.clickOnElement(reasonCodeRCMTenders);
    }

    public void enterEmployeeNumber(String employeeNumber) {
        mobileActions.enterText(empNumberTextFieldRCM, employeeNumber);
        mobileActions.clickOnElement(applyButton);
    }

    public void selectPrinterWaitAndSaveReceipt() throws InterruptedException {
        mobileActions.enterText(printerName, properties.getProperty("PrinterName"));
        mobileActions.clickHideKeyboard();
        if (properties.getProperty("Brand").equals("TNF")) {
            mobileActions.clickOnElement(printerIdTnf);
        } else if (properties.getProperty("Brand").equals("TBL")) {
            mobileActions.clickOnElement(printerIdTbl);
            mobileActions.clickOnElement(continueButton);
            Thread.sleep(4000);     //Delay for Gift receipt to get printed
            new Thread(() -> {
                ApiHelper.captureBarcode(saleTransactionID);
            }).start();
        } else {
            mobileActions.clickOnElement(printerIdDck);
            mobileActions.clickOnElement(continueButton);
            Thread.sleep(4000);     //Delay for Gift receipt to get printed
            new Thread(() -> {
                ApiHelper.captureBarcode(saleTransactionID);
            }).start();
        }
    }

    public void clicksOnCashOption() {
        if (properties.getProperty("StoreNumber").equals("101261")) {
            mobileActions.clickOnElement(cashOption);
        }
    }

    public void paymentDeclinedErrorMessage() {
        assertTrue("Test Failed: Payment refusal message is not displayed", generalUtility.isElementDisplayed(cardDeclinedRefusalMessage));
    }

    public void clicksOnUSDollar() {
        mobileActions.clickOnElement(USDollar);
    }

    public void clicksOnUSDollarTender() {
        mobileActions.clickOnElement(USDollarTender);
    }

    public void validateChangeDueInUSDollar() {
        String changeDue = generalUtility.getTextFromElement(changeDueAmount);
        double changeDueExpected = USDToCADValue * 10;
        double roundedValueClosest = Math.floor(changeDueExpected * 20.0) / 20.0;
        double roundedValue = Math.ceil(changeDueExpected * 20.0) / 20.0;
        String roundedAmountInString = String.format("%.2f", roundedValue);
        String roundedAmountClosestInString = String.format("%.2f", roundedValueClosest);
        assertTrue("Miss match in change due in US Dollar", changeDue.contains(roundedAmountInString) || changeDue.contains(roundedAmountClosestInString));
    }

    public void amountPaidByGiftCard() {
        String totalAmount = generalUtility.getTextFromElement(totalDueAmount);
        String amountWithoutDollar = totalAmount.replace("$", "");
        double amount = Double.parseDouble(amountWithoutDollar);
        int dueAmount = (int) Math.floor(Double.parseDouble(String.valueOf(amount))) - 2;
        mobileActions.enterText(enterPaymentAmount, String.valueOf(dueAmount * 100));
        mobileActions.clickOnElement(totalDueAmount);
    }

    public void enterAmountForPartialCashTender() {
        try {
            String totalAmount = generalUtility.getTextFromElement(totalDueAmount);
            String amountWithoutDollar = totalAmount.replace("$", "");
            double amount = Double.parseDouble(amountWithoutDollar);
            int amountToSubtract = (int) Math.floor(Double.parseDouble(String.valueOf(amount))) - 2;
            mobileActions.enterText(enterPaymentAmount, String.valueOf(amountToSubtract * 100));
            mobileActions.clickOnElement(totalDueAmount);
            rewardBalance = Math.round((amount - amountToSubtract) * 100.0) / 100.0;
        } catch (NumberFormatException e) {
            System.err.println("Invalid amount format: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("An error occurred while entering the extra amount: " + e.getMessage());
        }
    }

    public void storeRewardPrice() {
        rewardPrice = Double.parseDouble(generalUtility.getTextFromElement(rewardApplied).replaceAll("[\\$]", ""));
        System.out.println("Reward Price: " + rewardPrice);
    }

    public void validateRewardBalance() {
        double availableBalance = rewardPrice - rewardBalance;
        System.out.println("Reward Price: " + rewardPrice);
        System.out.println("Reward Balance: " + rewardBalance);
        System.out.println("Available Balance: " + availableBalance);
        WebElement rewardButton = driver.findElement(By.xpath("//*[contains(@label, '$" + availableBalance + "') and contains(@name,'ApplyButton')]"));
        assertTrue("Balance Validation Failed", generalUtility.isElementDisplayed(rewardButton));
    }

    public void paymentPageHeaderIsDisplayed() {
        assertTrue("Payment Page is not displayed", generalUtility.isElementDisplayed(paymentPageHeader));
    }

    public void verifyAnotherPartialPaymentCompletionStatus() {
        generalUtility.waitForElementToBeVisible(cashButton, 20);
    }

    public void waitRoboticActionToComplete() throws InterruptedException {
        Thread.sleep(15000);
    }

    public void clickOnOkButtonFromUnusedPage() {
        mobileActions.clickOnElement(okButtonUnusedCouponPage);
    }

    public void physicalReceiptPromoDescription() throws InterruptedException {
        Thread.sleep(5000);
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        System.out.println(physicalReceiptContent);
        if(properties.getProperty("Brand").equals("DCK")){
        assertTrue("Description Validation Failed",physicalReceiptContent.contains("20% with coupon"));
        assertTrue("Description Validation Failed",physicalReceiptContent.contains("10% off without coupon"));
        }else if(properties.getProperty("Brand").equals("TBL")){
            assertTrue("Description Validation Failed",physicalReceiptContent.contains("20% off with coupon"));
            assertTrue("Description Validation Failed",physicalReceiptContent.contains("10% off without coupon"));
        }
        else{
            assertTrue("Description Validation Failed",physicalReceiptContent.contains("10% with coupon"));
            assertTrue("Description Validation Failed",physicalReceiptContent.contains("10% OFF Without coupon"));
        }
    }
    public void validatesLoyaltyPointsNewCustomerInPhysicalReceipt() throws InterruptedException {
        Thread.sleep(5000);
        String physicalReceiptContent = ApiHelper.getPhysicalReceiptData(saleTransactionID);
        System.out.println(physicalReceiptContent);
        assertTrue("loyalty points mismatch", physicalReceiptContent.contains("\\nPoint Balance (Available):\\nJoin the Timberland Community\\nto unlock the best of Timberland.\\n0\\n0\\n"));
    }

    public void verifyPaymentoptionsonSTHPage() throws IOException {
        Boolean card_check;
        Boolean gift_card_check;
        Boolean membership_rewards_check;
        Boolean cash_check;
        Boolean rcm_check1;
        Boolean rcm_check2;
        Boolean more_check;

        if (properties.getProperty("Brand").equals("TNF"))
        {
            String scenarioname="TNF_Omni_Payment_Check";
            card_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Card-button']")));
            gift_card_check=generalUtility.isElementExists((By.xpath("//XCUIElementTypeOther[@name='Payment-Gift Card-button']")));
            membership_rewards_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Membership Rewards-button']")));
            cash_check=generalUtility.isElementExists((By.xpath("(//*[@name='Payment-Cash-button'])[last()]")));
            rcm_check1=generalUtility.isElementExists((By.xpath("//XCUIElementTypeOther[@name='RCM Tenders']")));
            rcm_check2=generalUtility.isElementExists(By.xpath("//XCUIElementTypeOther[@name='Payment-RCM Tenders-button']"));
            more_check=generalUtility.isElementExists(By.xpath("//XCUIElementTypeOther[@name='Payment-otherTenders-button']"));
            if(card_check && gift_card_check && membership_rewards_check && !cash_check && !rcm_check1 && !rcm_check2 && !more_check)
                System.out.println("Passed: STH has Card, Gift Card and Rewards Payment options");
            else
                System.out.println("Failed");
            generalUtility.captureScreenshot(scenarioname);
        }
        else
        {
            String scenarioname="TBL_Omni_Payment_Check";
            card_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Card-button']")));
            gift_card_check=generalUtility.isElementExists((By.xpath("//XCUIElementTypeOther[@name='Payment-Gift Card-button']")));
            membership_rewards_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Membership Rewards-button']")));
            cash_check=generalUtility.isElementExists((By.xpath("(//*[@name='Payment-Cash-button'])[last()]")));
            if(card_check && gift_card_check && membership_rewards_check && !cash_check)
                System.out.println("Passed: STH has Card, Gift Card and Rewards Payment options");
            else
                System.out.println("Failed");
            generalUtility.captureScreenshot(scenarioname);
        }
    }

    public void verifyPaymentoptionsoncarryoutPage() throws IOException {
        Boolean card_check;
        Boolean gift_card_check;
        Boolean membership_rewards_check;
        Boolean cash_check;
        Boolean rcm_check;

        if (properties.getProperty("Brand").equals("TNF"))
        {
            String scenarioname="TNF_CarryOut_Payment_Check";
            card_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Card-button']")));
            gift_card_check=generalUtility.isElementExists((By.xpath("//XCUIElementTypeOther[@name='Payment-Gift Card-button']")));
            membership_rewards_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Membership Rewards-button']")));
            cash_check=generalUtility.isElementExists((By.xpath("(//*[@name='Payment-Cash-button'])[last()]")));
            rcm_check=generalUtility.isElementExists((By.xpath("//XCUIElementTypeOther[@name='RCM Tenders']")));
            if(card_check && gift_card_check && cash_check)
            System.out.println("Cash, Card and Gift Card Options are present");
            else
                System.out.println("Failed");
            generalUtility.captureScreenshot(scenarioname);
        }
        else
        {
            String scenarioname="TBL_CarryOut_Payment_Check";
            card_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Card-button']")));
            gift_card_check=generalUtility.isElementExists((By.xpath("//XCUIElementTypeOther[@name='Payment-Gift Card-button']")));
            membership_rewards_check=generalUtility.isElementExists((By.xpath("//*[@name='Payment-Membership Rewards-button']")));
            cash_check=generalUtility.isElementExists((By.xpath("(//*[@name='Payment-Cash-button'])[last()]")));
            if(card_check && gift_card_check && membership_rewards_check && cash_check)
                System.out.println("Passed: STH has Cash, Card, Gift Card and Rewards Payment options");
            else
                System.out.println("Failed");
            generalUtility.captureScreenshot(scenarioname);
        }
    }

    public void verifyPaymentoptiononmorescreen() throws IOException {
        Boolean membership_rewards_check;
        Boolean rcm_check;
        String scenarioname="TNF_more_page_check";
        membership_rewards_check=generalUtility.isElementExists((By.xpath("//*[@name='Membership Rewards']")));
        rcm_check=generalUtility.isElementExists((By.xpath("//XCUIElementTypeOther[@name='RCM Tenders']")));
        if(membership_rewards_check && rcm_check)
            System.out.println("MemberShip Rewards and RCM Tenders options are also present");
        else
            System.out.println("Failed on More Page");
        generalUtility.captureScreenshot(scenarioname);
    }

    public void clickOnCancelButton() {
        mobileActions.waitAndClickOnElement(CancelfromMore,3);
    }
}
