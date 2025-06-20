package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import org.junit.Assert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.*;

public class BagFeePage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();
    public static String bagFeeAmount;

    // Initializing the Page Objects
    public BagFeePage() {
        PageFactory.initElements(driver, this);
    }

    // Page Factory Object Repository.
    @FindBy(xpath = "(//*[@label='Accept'])[last()]")
    WebElement acceptButton;

    @FindBy(xpath = "//*[contains(@name, 'quantity-subtract')]")
    WebElement subtractBagFee;

    @FindBy(xpath = "//*[contains(@name, 'quantity-add')]")
    WebElement addBagFee;

    @FindBy(xpath = "//*[contains(@name, 'Quantity:')]")
    WebElement bagFeeQuantity;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='BagFees-totalCostOfBagsAmount']")
    WebElement costOfBags;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='BagFees-cancelButton']")
    WebElement bagFeeCancelButton;


    //Actions
    public void clickOnAcceptButton() {
        mobileActions.clickOnElement(acceptButton);
    }

    public void clickOnAddBagFee() {
        mobileActions.clickOnElement(addBagFee);
    }

    public void clickOnSubtractBagFee() {
        mobileActions.clickOnElement(subtractBagFee);
    }

    public void verifyBagCount(String count) {
        String BagQuantity = generalUtility.getTextFromElement(bagFeeQuantity);
        assertTrue("Expected bag count not found: " + count, BagQuantity.contains(count));
    }

    public void storeBagFeeAmount() {
        bagFeeAmount = generalUtility.getTextFromElement(costOfBags).replace("$", "").trim();
    }

    public void validateBagFeeAmount() {
        assertTrue("Bag fee amount not added", generalUtility.getTextFromElement(costOfBags).replace("$", "").trim().contains(bagFeeAmount));
        assertEquals(generalUtility.getTextFromElement(costOfBags).replace("$", "").trim(), bagFeeAmount);
    }

    public void validateBagFeePage() {
        assertTrue("Bag fee add button is not available", generalUtility.isElementDisplayed(addBagFee));
        assertTrue("Bag fee accept button not available", generalUtility.isElementDisplayed(acceptButton));
    }

    public void clickOnBagFeeCancelButton() {
        mobileActions.clickOnElement(bagFeeCancelButton);
    }

}