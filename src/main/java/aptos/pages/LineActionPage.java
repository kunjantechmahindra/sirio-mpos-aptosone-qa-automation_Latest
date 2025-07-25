package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.TestDataHelper;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.io.IOException;
import java.text.DecimalFormat;

import static aptos.pages.ProductInquiryPage.productTempMDPrice;
import static aptos.stepDefinition.DiscountPageStepDefinition.amountDiscount;
import static org.junit.Assert.*;

public class LineActionPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();
    DecimalFormat df = new DecimalFormat("#.00");
    public static String currentTaxRate;
    public static String taxIdTestData;
    public static String priceOverRideAmount;

    public static double finalPrice;

    // Initializing the Page Objects
    public LineActionPage() throws IOException {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.

    @FindBy(xpath = "//XCUIElementTypeOther/XCUIElementTypeTextField")
    WebElement enterPrice;

    @FindBy(xpath = "//*[@name='MainScreen-header-title']")
    WebElement headerTitle;

    @FindBy(xpath = "//*[@name='Override price']")
    WebElement priceOverrideTitle;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Discount' and @label='Discount'])[last()]")
    WebElement transactionDiscount;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Reason code >'])[2]")
    WebElement reasonCodeButtonTaxExempt;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='Confirm']")
    WebElement confirmButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Apply'])[last()]")
    WebElement applyButton;

    @FindBy(xpath = "//*[@value='New percent']")
    WebElement taxPercentage;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='New amount']")
    WebElement newTaxOverRideAmount;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ReasonCodeListScreen-reasonCode-select']")
    WebElement taxExemptReasonCode;

    @FindBy(xpath = "//XCUIElementTypeTextField[@value='Tax ID']")
    WebElement taxIDText;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Cancel'])[2]")
    WebElement cancelButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Cancel'])[last()]")
    WebElement cancelButtonOnlineItemAction;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Amount']")
    WebElement amountButtonTaxOverride;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Tax exempt']")
    WebElement taxExemptButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Tax override']")
    WebElement taxOverRideButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Override price']")
    WebElement priceOverRideButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-status-tag']")
    WebElement commentTagOnProducts;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Comment']")
    WebElement commentTagOnProductsIphone;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Gift receipt']")
    WebElement giftReceiptOptionAtItemLevel;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Void item']")
    WebElement voidItemItemLevelButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Percent Amount Current effective tax rate New percent Apply Cancel']")
    WebElement taxOverRideRightPanelLineItemLevel;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Required']")
    WebElement requiredErrorPrompt;

    @FindBy(xpath = "//XCUIElementTypeTextField[contains(@value, '%')]")
    WebElement storeTaxRate;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-discount-amount']")
    WebElement itemDiscountAmount;

    @FindBy(xpath = "(//XCUIElementTypeOther[@label='HST'])[last()]")
    WebElement taxExemptionsHST;

    @FindBy(xpath = "(//XCUIElementTypeOther[@label='PST'])[last()]")
    WebElement taxExemptionsPST;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Tax exempt Cancel'])[5]")
    WebElement taxOverRideButtonNotExist;


    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice']")
    WebElement itemOriginalPrice;


    @FindBy(xpath = "(//XCUIElementTypeOther[@name='GST & PST'])[last()]")
    WebElement taxExemptionsGSTPST;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Change quantity']")
    WebElement changeQuantityButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='AdderSubtractor-quantity-add']")
    WebElement increaseQuantity;

    @FindBy(xpath = "//XCUIElementTypeTextField")
    WebElement quantityTextField;

    @FindBy(xpath = " //XCUIElementTypeStaticText[@name='Required']")
    WebElement errorMessage;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-originalUnitPrice']")
    WebElement itemPriceBeforeDiscount;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='Display-selectableItemLine-itemExtendedAmount']")
    WebElement itemPriceInReturn;

    //Actions
    public void clickOnLineActionItem(String option) {
        WebElement LineActionOption;
        if (properties.getProperty("Brand").equals("TNF")) {
            LineActionOption = driver.findElement(By.xpath("(//*[@name='" + option + "'])[last()]"));
        } else if (properties.getProperty("Region").equals("US")) {
            LineActionOption = driver.findElement(By.xpath("//*[@name='" + option + "']"));

        } else {
            LineActionOption = driver.findElement(By.xpath("(//*[@name='" + option + "'])[last()]"));
        }
        generalUtility.isElementDisplayed(LineActionOption);
        mobileActions.clickOnElement(LineActionOption);
    }

    public void enterOverridePrice(String amount) {
        mobileActions.enterText(enterPrice, amount);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(priceOverrideTitle);
        } else {
            mobileActions.clickOnElement(headerTitle);
        }
    }

    public void enterTaxPercentage(int percent) throws InterruptedException {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            mobileActions.enterText(taxPercentage, String.valueOf(percent));
            mobileActions.clickHideKeyboard();
        } else {
            mobileActions.enterText(taxPercentage, String.valueOf(percent));
            mobileActions.clickHideKeyboard();
            String taxOverrideReasonCodeCheck = generalUtility.getTextFromElement(taxOverRideRightPanelLineItemLevel);
            System.out.println(taxOverrideReasonCodeCheck);
            assertFalse("Reason code exists", taxOverrideReasonCodeCheck.contains("Reason"));
        }
    }

    public void clickOnApplyButton() {
        mobileActions.clickOnElement(applyButton);
    }

    public void clickOnTransactionDiscount() {
        mobileActions.clickOnElement(transactionDiscount);
    }

    public void clickOnConfirmButton() {
        mobileActions.clickOnElement(confirmButton);
    }

    public void enterTaxID() {
        taxIdTestData = TestDataHelper.generateReferenceTD();
        mobileActions.enterText(taxIDText, taxIdTestData);
    }

    public void enterTaxExemptReasonCode() {
        mobileActions.clickOnElement(taxExemptReasonCode);
    }

    public void clickOnReasonCodeTaxExempt() {
        mobileActions.clickOnElement(reasonCodeButtonTaxExempt);
    }

    public void clickOnTaxOverrideAmount() {
        mobileActions.clickOnElement(amountButtonTaxOverride);
    }

    public void enterNewTaxAmount(String taxOverRideAmount) {
        mobileActions.enterText(newTaxOverRideAmount, taxOverRideAmount);
    }

    public void isTaxExemptButtonEnabled() {
        boolean taxExemptButtonEnabled = generalUtility.isElementEnabled(taxExemptButton);
        Assert.assertTrue("Tax Exempt button not enabled", taxExemptButtonEnabled);
        mobileActions.clickOnElement(cancelButtonOnlineItemAction);
    }

    public void isTaxOverrideButtonEnabled() {
        boolean taxOverRideButtonExist = generalUtility.isElementEnabled(taxOverRideButton);
        Assert.assertTrue("Tax override button not enabled", taxOverRideButtonExist);
        mobileActions.clickOnElement(cancelButtonOnlineItemAction);
    }

    public void isPriceOverRideButtonEnabled() {
        boolean priceOverrideButton = generalUtility.isElementEnabled(priceOverRideButton);
        Assert.assertTrue("price override button not enabled", priceOverrideButton);
        mobileActions.clickOnElement(cancelButtonOnlineItemAction);
    }


    public void itemComments(String comment) {
        WebElement comments = driver.findElement(By.xpath("//*[@name='" + comment + "']"));
        mobileActions.clickOnElement(comments);

    }

    public void validateItemComment() throws InterruptedException {
        String comments;
        // Check if the device is an iPhone
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            comments = commentTagOnProductsIphone.getText();
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            comments = commentTagOnProducts.getText();
            mobileActions.clickOnElement(cancelButtonOnlineItemAction);
        }
        // Validate if the comment tag is added
        Assert.assertTrue("Comment tag is not added to the product", comments.contains("Comment"));
    }

    public void isGiftReceiptAtItemLevelEnable() {
        boolean giftReceiptButtonEnabled = generalUtility.isElementEnabled(giftReceiptOptionAtItemLevel);
        Assert.assertTrue("Gift Receipt button not enabled", giftReceiptButtonEnabled);
        mobileActions.clickOnElement(giftReceiptOptionAtItemLevel);
    }

    public void isVoidItemButtonEnabled() {
        generalUtility.isElementEnabled(voidItemItemLevelButton);
        mobileActions.clickOnElement(voidItemItemLevelButton);
    }

    public void isReasonCodeExists() {
        boolean reasonCodeExists = generalUtility.isElementDisplayed(reasonCodeButtonTaxExempt);
        Assert.assertTrue("Reason code button not displayed", reasonCodeExists);
    }

    public void isErrorPromptDisplayed() {
        boolean errorMessage = generalUtility.isElementDisplayed(requiredErrorPrompt);
        assertTrue("No Error Message Displayed", errorMessage);
    }

    public void changeQuantityButton() throws InterruptedException {
        boolean status = generalUtility.isElementExists(By.xpath("//*[@name='" + "Change quantity" + "']"));
        String brand = properties.getProperty("Brand");
        if (brand.equals("TBL") || brand.equals("TNF")) {
            assertFalse("Test Failed: Change quantity button exists", status);
        } else if (brand.equals("DCK")) {
            assertFalse("Test Failed: Change quantity button exists", status);
        } else {
            assertTrue("Test Failed: Change quantity button does not exists", status);
        }
    }

    public void storeCurrentTaxRate() {
        currentTaxRate = generalUtility.getTextFromElement(storeTaxRate).replace("%", "").trim();
        System.out.println(currentTaxRate);
    }

    public void validateAmountOffApplied(String amountOff) {
        // firstItemExtendedPrice
        String discountAmount = generalUtility.getTextFromElement(itemDiscountAmount).replaceAll("[\\$()]", "").trim();
        System.out.println(amountOff);
        System.out.println(discountAmount);
        assertEquals(amountOff, discountAmount);
    }

    public void selectHSTExemptions() {
        mobileActions.clickOnElement(taxExemptionsHST);
    }

    public void selectPSTExemptions() {
        mobileActions.clickOnElement(taxExemptionsPST);
    }

    public void isTaxOverRideButtonUnAvailable() {
        String content = taxOverRideButtonNotExist.getText();
        Assert.assertFalse("Tax override button available", content.contains("Tax override"));
        mobileActions.clickOnElement(cancelButtonOnlineItemAction);
    }

    public void itemPriceOverrideMaximumPrice() {
        String itemActualPrice = generalUtility.getTextFromElement(itemOriginalPrice).replaceAll("[\\$()]", "");
        double maximumOverridePrice = Double.parseDouble(itemActualPrice) * 2;
        String maximumPrice = String.format("%.2f", maximumOverridePrice);
        enterOverridePrice(maximumPrice);
        priceOverRideAmount = maximumPrice;
    }

    public void itemPriceOverrideLessPrice() {
        String itemActualPrice = generalUtility.getTextFromElement(itemOriginalPrice).replaceAll("[\\$()]", "");
        double OverridePrice = Double.parseDouble(itemActualPrice) / 2;
        String lesserPrice = String.format("%.2f", OverridePrice);
        enterOverridePrice(lesserPrice);
        priceOverRideAmount = lesserPrice;
    }

    public void changeQuantityButtonValidation() throws InterruptedException {
        boolean status = generalUtility.isElementExists(By.xpath("//*[@name='" + "Change quantity" + "']"));
        assertTrue("Test Failed: Change quantity button does not exists", status);
    }

    public void selectGSTPSTExemptions() {
        mobileActions.clickOnElement(taxExemptionsGSTPST);
    }

    public void clicksOnChangeQuantityButton() {
        mobileActions.clickOnElement(changeQuantityButton);
    }

    public void increaseQuantity(int increaseCount) {
        for (int i = 0; i < increaseCount; i++) {
            mobileActions.clickOnElement(increaseQuantity);
        }
    }

    public void enterItemQuantity(String quantity) throws InterruptedException {
        mobileActions.enterText(quantityTextField, quantity);
        mobileActions.clickHideKeyboard();
    }

    public void selectChangeQuantityButton() {
        mobileActions.clickOnElement(changeQuantityButton);
    }


    public void validateErrorMessage() throws InterruptedException {
        mobileActions.iPhoneHideKeyboard();
        Assert.assertTrue("No error message came while giving price below thr threshold", generalUtility.isElementDisplayed(errorMessage));
    }

    public void enterThresholdLowerPriceForOverride(String amount) {
        mobileActions.enterText(enterPrice, amount);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(priceOverrideTitle);
        }
    }

    public void savesItemPrice(){
        String price = generalUtility.getTextFromElement(itemPriceBeforeDiscount);
        String finalPriceAmount = price.replaceAll("[\\$()]", "").trim();
        finalPrice = Double.parseDouble(finalPriceAmount) - amountDiscount;
    }

    public void verifyReturnPriceForDiscountItem(){
        String price = generalUtility.getTextFromElement(itemPriceInReturn);
        String finalPriceAmount = price.replaceAll("[\\$()]", "").trim();
        Assert.assertTrue("Mismatch in return price of the Item with Discount",Double.parseDouble(finalPriceAmount)==(finalPrice));
    }

    public void verifyReturnPriceOfTempMD(){
        String price = generalUtility.getTextFromElement(itemPriceInReturn);
        String finalPriceAmount = price.replaceAll("[\\$()]", "").trim();
        Assert.assertTrue("Mismatch in return price of the TEMP MD item",Double.parseDouble(finalPriceAmount)==(productTempMDPrice));
    }
}