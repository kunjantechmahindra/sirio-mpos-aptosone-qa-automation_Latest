package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.W3CActions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.assertTrue;

public class ProductInquiryPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();
    W3CActions w3CActions = new W3CActions();
    public static double productOriginalPrice = 0;
    public static double productTempMDPrice = 0;

    public ProductInquiryPage() {
        PageFactory.initElements(driver, this);
    }

    @FindBy(xpath = "//*[@name='MainScreen-header-left-button' or @name='MainScreen-header-none-button']")
    WebElement hamburgerButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='MainScreen-header-none-button']")
    WebElement hamburgerButtoniphone;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Product inquiry']")
    WebElement productInquiryButton;

    @FindBy(xpath = "//*[@name='ProductInquiryScreen-searchValue-textInput']")
    WebElement enterItemTextField;

    @FindBy(xpath = "//*[@name='ProductInquiryScreen-header-right-button']")
    WebElement searchButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name,'ProductInquiryLine-item')])[1]")
    WebElement firstItem;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ProductInquiryDetail-cashAndCarry-button']")
    WebElement addToBasketButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ProductInquiryDetail-basket-button']")
    WebElement basketButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ProductInquiryDetail-header-left-button']")
    WebElement productDetailsBackButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ProductInquiryScreen-header-left-button']")
    WebElement productInquiryBackButton;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ProductInquiryDetail-itemName']")
    WebElement productName;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, '$')]")
    WebElement productPrice;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'Size')]")
    WebElement productSize;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ProductInquiryDetail-descriptionLabel']")
    WebElement productDescription;

    @FindBy(xpath = "//*[@name='ProductInquiryDetail-itemPrice']/XCUIElementTypeOther/XCUIElementTypeStaticText[1]")
    WebElement itemOriginalPrice;

    @FindBy(xpath = "//*[@name='ProductInquiryDetail-itemPrice']/XCUIElementTypeOther/XCUIElementTypeStaticText[2]")
    WebElement itemTempMDPrice;

    @FindBy(xpath = "//*[contains(@name, 'camera')]")
    WebElement cameraButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name,'Product inquiry')])[1]/XCUIElementTypeOther[2]")
    WebElement productInquiryBuffering;

    @FindBy(xpath = "//XCUIElementTypeImage")
    WebElement productImage;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ProductInquiryDetail-styleLabel']")
    WebElement productStyle;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='ProductInquiryDetail-descriptionLabel']")
    WebElement productDescriptions;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='ProductInquiryScreen-header-left-button']")
    WebElement backButtonFromProductSearchPage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='AdderSubtractor-quantity-add']")
    WebElement addProductQuantity;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, '$') and (@name, '$')]")
    WebElement tempPermPrice;

    @FindBy(xpath="//XCUIElementTypeOther[@name='ProductInquiryDetail-shipToCustomer-button']")
    WebElement deliverItButton;

    public void navigateToProductInquiryPage() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(hamburgerButtoniphone);
        } else {
            generalUtility.isElementEnabled(hamburgerButton);
            mobileActions.clickOnElement(hamburgerButton);
        }
        generalUtility.isElementEnabled(productInquiryButton);
        mobileActions.clickOnElement(productInquiryButton);
    }

    public void searchProduct(String style) throws InterruptedException {
        mobileActions.enterText(enterItemTextField, style);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(searchButton);
    }

    public void selectItem() {
        mobileActions.clickOnElement(firstItem);
    }

    public void clickOnAddToBasketButton() {
        while (!generalUtility.isElementDisplayed(addToBasketButton)) {
            w3CActions.scrollDown();
        }
        generalUtility.waitForElementToBeVisible(addToBasketButton, 80);
        mobileActions.clickOnElement(addToBasketButton);
    }

    public void clickOnABasketButton() {
        generalUtility.isElementEnabled(basketButton);
        mobileActions.clickOnElement(basketButton);
    }

    public void clickOnProductDetailBackButton() {
        mobileActions.clickOnElement(productDetailsBackButton);
    }

    public void validateProductName() {
        generalUtility.isElementEnabled(productName);
        assertTrue("Product Name is not available", productName.isEnabled());
    }

    public void validateProductPrice() {
        generalUtility.isElementEnabled(productPrice);
        assertTrue("Product Price is not available", productPrice.isEnabled());
    }

    public void validateProductSize() {
        String brandValue = properties.getProperty("Brand");
        if (brandValue.equals("TBL") || brandValue.equals("TNF")) {
            generalUtility.isElementEnabled(productSize);
            assertTrue("Product Size is not available", productSize.isEnabled());
        }
    }

    public void validateProductDescription() {
        generalUtility.isElementEnabled(productDescription);
        assertTrue("Product Description is not available", productDescription.isEnabled());
    }

    public void validateProductDescriptionPage(String option) throws InterruptedException {
        WebElement LineActionOption = driver.findElement(By.xpath("//*[contains(@label,'" + option + "')]"));
        generalUtility.isElementDisplayed(LineActionOption);
        System.out.println(option + " is available in the description");
    }

    public void searchProductBySKU(String SKU) throws InterruptedException {
        mobileActions.enterText(enterItemTextField, SKU);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(searchButton);
    }

    public void saveOriginalAndTemporaryPrice() {
        String productOriginalPrice = generalUtility.getTextFromElement(itemOriginalPrice).replaceAll("[\\$]", "");
        String productTempMDPrice = generalUtility.getTextFromElement(itemTempMDPrice).replaceAll("[\\$]", "");
        ProductInquiryPage.productOriginalPrice = ProductInquiryPage.productOriginalPrice + Double.parseDouble(productOriginalPrice);
        ProductInquiryPage.productTempMDPrice = ProductInquiryPage.productTempMDPrice + Double.parseDouble(productTempMDPrice);
    }

    public void productInquiryBufferingWait() {
        generalUtility.waitForElementToBeVisible(productImage, 15);
    }

    public void validateProductStyle() {
        generalUtility.isElementEnabled(productStyle);
        assertTrue("Product Style is not available", productStyle.isEnabled());
    }

    public void validateProductDescriptionInquiryPage() {
        generalUtility.isElementEnabled(productDescriptions);
        assertTrue("Product Descriptions are not available", productDescriptions.isEnabled());
    }

    public void validateProductDetails() {
        generalUtility.isElementEnabled(productName);
        assertTrue("Product Name is not available", productName.isEnabled());
        generalUtility.isElementEnabled(productDescription);
        assertTrue("Product Description is not available", productDescription.isEnabled());
        generalUtility.isElementEnabled(productStyle);
        assertTrue("Product Style is not available", productStyle.isEnabled());
        generalUtility.isElementEnabled(productPrice);
        assertTrue("Product Price is not available", productPrice.isEnabled());
        mobileActions.clickOnElement(productDetailsBackButton);
        mobileActions.clickOnElement(productInquiryBackButton);
    }


    public void clicksOnBackButtonFromProductInquiry() {
        mobileActions.clickOnElement(backButtonFromProductSearchPage);
    }

    public void enterPartialDescription(String partialDesc) throws InterruptedException {
        mobileActions.enterText(enterItemTextField, partialDesc);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(searchButton);
    }

    public void enterDescription(String fullDescription) throws InterruptedException {
        mobileActions.enterText(enterItemTextField, fullDescription);
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(searchButton);
    }

    public void addMoreQuantity() {
        mobileActions.clickOnElement(addProductQuantity);
    }

    public void verifyTempMd() {
        generalUtility.isElementEnabled(itemTempMDPrice);
        assertTrue("Temp MD is not displayed", itemTempMDPrice.isEnabled());
    }

    public void clickOnDeliverItButton() {
        while (!generalUtility.isElementDisplayed(deliverItButton)) {
            w3CActions.scrollDown();
        }
        generalUtility.waitForElementToBeVisible(deliverItButton, 80);
        mobileActions.clickOnElement(deliverItButton);
    }
}



