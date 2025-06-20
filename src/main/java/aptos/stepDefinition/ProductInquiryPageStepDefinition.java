package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.BasketPage;
import aptos.pages.CustomerPage;
import aptos.pages.ProductInquiryPage;
import aptos.utility.TestDataHelper;
import io.cucumber.java.en.And;
import org.json.simple.parser.ParseException;

import java.io.IOException;

import static aptos.pages.BasketPage.*;

public class ProductInquiryPageStepDefinition extends TestBase {

    ProductInquiryPage productInquiryPage = new ProductInquiryPage();
    TestDataHelper testDataHelper = new TestDataHelper();
    BasketPage basketPage = new BasketPage();
    CustomerPage customerPage = new CustomerPage();
    public static String itemUPC;

    public ProductInquiryPageStepDefinition() throws IOException {
    }

    @And("the sales assistant navigate to product inquiry page")
    public void theSalesAssistantNavigateToProductInquiryPage() {
        productInquiryPage.navigateToProductInquiryPage();
    }

    @And("the sales assistant search product by style number {string}")
    public void theSalesAssistantSearchProductBySKUValue(String style) throws InterruptedException {
        productInquiryPage.searchProduct(style);
    }

    @And("the sales assistant select an item from the list")
    public void theSalesAssistantSelectAnItemFromTheList() {
        productInquiryPage.selectItem();
    }

    @And("the sales assistant add item to the basket")
    public void theSalesAssistantAddItemToTheBasket() throws InterruptedException {
        productInquiryPage.clickOnAddToBasketButton();
    }

    @And("the sales assistant clicks on back button from product inquiry details page")
    public void theSalesAssistantClicksOnBackButtonFromProductInquiryDetailsPage() {
        productInquiryPage.clickOnProductDetailBackButton();
    }

    @And("the sales assistant clicks on basket button")
    public void theSalesAssistantClicksOnBasketButton() {
        productInquiryPage.clickOnABasketButton();
    }

    @And("the sales assistant search product by UPC number from {string}")
    public void theSalesAssistantSearchProductByUPCNumberFrom(String productType) throws IOException, ParseException, InterruptedException {
        itemUPC = testDataHelper.readRandomGenericUPSC(properties.getProperty("BrandRegion"), productType);
        productInquiryPage.searchProduct("00" + itemUPC);
    }

    @And("the sales assistant validates the Product description page")
    public void theSalesAssistantValidatesTheProductDescriptionPage() {
        productInquiryPage.validateProductName();
        productInquiryPage.validateProductPrice();
        productInquiryPage.validateProductSize();
    }

    @And("the sales assistant verifies {string} in Product description page")
    public void theSalesAssistantVerifiesInProductDescriptionPage(String title) throws InterruptedException {
        productInquiryPage.validateProductDescriptionPage(title);
    }

    @And("the sales assistant search product by SKU for {string}")
    public void theSalesAssistantSearchProductBySKUFor(String promoSKU) throws IOException, ParseException, InterruptedException {
        String SKU = TestDataHelper.getSFCCPromoSKU(properties.getProperty("BrandRegion"), promoSKU);
        productInquiryPage.searchProductBySKU(SKU);
    }

    @And("the sales assistant save the original and temporary price")
    public void theSalesAssistantSaveTheOriginalAndTemporaryPrice() {
        productInquiryPage.saveOriginalAndTemporaryPrice();
    }

    @And("the sales assistant search the saved TempMD item")
    public void theSalesAssistantSearchFirstTempMDItem() throws InterruptedException {
        productInquiryPage.searchProduct(TempMDProduct);
    }

    @And("the sales assistant wait for the product inquiry page to load")
    public void theSalesAssistantWaitForTheProductInquiryPageToLoad() {
        productInquiryPage.productInquiryBufferingWait();
    }

    @And("the sales assistant validate the Product details in the Product Inquiry Page")
    public void theSalesAssistantValidateTheProductDetailsInTheProductInquiryPage() {
        productInquiryPage.validateProductDetails();
    }

    @And("the sales assistant validates the product details in product inquiry page")
    public void theSalesAssistantValidatesTheProductDetailsInProductInquiryPage() {
        productInquiryPage.validateProductName();
        productInquiryPage.validateProductPrice();
        productInquiryPage.validateProductStyle();
        productInquiryPage.validateProductDescriptionInquiryPage();
    }

    @And("the sales assistant clicks on back button from product inquiry search page")
    public void theSalesAssistantClicksOnBackButtonFromProductInquirySearchPage() {
        productInquiryPage.clicksOnBackButtonFromProductInquiry();
    }

    @And("the sales assistant search product by partial description {string}")
    public void theSalesAssistantSearchProductByPartialDescription(String partialDesc) throws InterruptedException {
        productInquiryPage.enterPartialDescription(partialDesc);
    }

    @And("the sales assistant search product by entering full description {string}")
    public void theSalesAssistantSearchProductByEnteringFullDescription(String fullDescription) throws InterruptedException {
        productInquiryPage.enterDescription(fullDescription);
    }

    @And("the sales assistant add {int} quantity to the order")
    public void theSalesAssistantAddQuantityToTheOrder(int quantity) {
        for (int i = 0; i < quantity; i++) {
            productInquiryPage.addMoreQuantity();
        }
    }

    @And("the sales assistant verify tempMd is displayed")
    public void theSalesAssistantVerifyTempMdIsDisplayed() {
        productInquiryPage.verifyTempMd();
    }
}
