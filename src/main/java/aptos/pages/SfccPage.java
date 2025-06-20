package aptos.pages;

import aptos.base.TestBase;
import com.warrenstrange.googleauth.GoogleAuthenticator;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;
import java.util.Set;

import static aptos.stepDefinition.SfccValidationStepDefinition.compaignName;
import static aptos.stepDefinition.SfccValidationStepDefinition.nameAndDescription;

public class SfccPage extends TestBase {


    // Initializing the Page Objects
    public SfccPage() {
        PageFactory.initElements(macDriver, this);
    }

    //Actions
    public void loginToSfcc() {
        macDriver.manage().window().maximize();
        macDriver.findElement(By.xpath("//*[@id='idToken2'][@placeholder='User Name']")).sendKeys(properties.getProperty("SFCC_USERNAME"));
        macDriver.findElement(By.xpath("//*[@id='loginButton_0']")).click();

        macDriver.findElement(By.xpath("//*[@id='idToken2'][@type='password']")).sendKeys(properties.getProperty("SFCC_PASSWORD"));
        macDriver.findElement(By.xpath("//*[@id='loginButton_0']")).click();

        macDriver.findElement(By.xpath("//button[contains(text(), \"receive a notification\")]")).click();
        macDriver.findElement(By.xpath("//button[text()='Choose Another Verification Method']")).click();
        macDriver.findElement(By.xpath("//div[text()='One-Time Password Generator']")).click();

        GoogleAuthenticator gAuth = new GoogleAuthenticator();
        String otpKey = properties.getProperty("SFCC_KEY");  // Your OTP secret key (can be stored securely)
        int otp = gAuth.getTotpPassword(otpKey);

        WebElement otpField = macDriver.findElement(By.xpath("//*[@id='input-27']"));
        otpField.sendKeys(String.valueOf(otp));
        macDriver.findElement(By.xpath("//button[./slot[text() = 'Verify']]")).click();
    }

    public void launchSfcc() {
        launchChromeInMac();
        launchUrlInChromeMac(properties.getProperty("SFCC_URL"));
    }

    public void selectSite(String site) {
        macDriver.findElement(By.xpath("//*[@title='Select a Site']")).click();
        macDriver.findElement(By.xpath("//*[@title='" + site + "']")).click();
    }

    public void clickOnCampaigns() {
        macDriver.findElement(By.xpath("(//*[@title='Open menu item submenu'])[1]")).click();
        macDriver.findElement(By.xpath("//*[@title='Manage campaigns.']")).click();
    }

    public void passPromotionID(String promotionID) {
        macDriver.findElement(By.xpath("//*[@placeholder='Search by ID or description...']")).sendKeys(promotionID);
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(6));
        WebElement promoID = wait.until(ExpectedConditions.elementToBeClickable(macDriver.findElement(By.xpath("//span[text()='Find']"))));
        promoID.click();
        macDriver.findElement(By.xpath("//*[@title='" + promotionID + "']")).click();
    }

    public void selectStartDate(String startDate) {
        String[] parts = startDate.split("-");
        macDriver.findElement(By.xpath("(//img[contains(@class, 'x-form-trigger') and contains(@class, 'x-form-date-trigger')])[1]\n")).click();
        macDriver.findElement(By.xpath("//td[@class='x-date-middle']\n")).click();
        macDriver.findElement(By.xpath("//div[contains(@class, \"x-date-mp\")]//table//tbody//tr//td//a[text()='" + parts[1] + "']\n")).click();
        macDriver.findElement(By.xpath("//div[contains(@class, \"x-date-mp\")]//table//tbody//tr//td//a[text()='" + parts[2] + "']\n")).click();
        macDriver.findElement(By.xpath("//button[@class='x-date-mp-ok']")).click();
        macDriver.findElement(By.xpath("//table[contains(@class, 'x-date-inner')]//tr//td[contains(@class, 'x-date-active')]//a//span[text()='" + parts[0] + "']\n")).click();
    }

    public void clickOnApplyButtonOnCampaignsPage() {
        macDriver.findElement(By.xpath("//button[text()='Apply']")).click();
    }


    public void clickOnPromotions() {
        macDriver.findElement(By.xpath("(//*[@title='Open menu item submenu'])[1]")).click();
        macDriver.findElement(By.xpath("//*[@title='Manage promotions.']")).click();
    }

    public void passPromotionIDForPromotions(String promotionID) {
        macDriver.findElement(By.xpath("//*[@placeholder='Search by name or ID...']")).sendKeys(promotionID);
        macDriver.findElement(By.xpath("//span[text()='Find']")).click();
        macDriver.findElement(By.xpath("//*[@title='" + promotionID + "']")).click();
    }

    public void clickOnEditQualifyingProducts() {
        // Create a JavascriptExecutor object
        JavascriptExecutor js = (JavascriptExecutor) macDriver;
        // Scroll down by 1000 pixels
        js.executeScript("window.scrollBy(0, document.body.scrollHeight)");
        macDriver.findElement(By.xpath("//input[@id='QualProductsButton']")).click();
        macDriver.findElement(By.xpath("//*[@class='remove']")).click();
        macDriver.findElement(By.xpath("(//button[text()='Add'])[last()]")).click();
    }

    public void selectUPCs(String SKUNumber) throws InterruptedException {
        macDriver.findElement(By.xpath("//*[@class='x-panel-body xedit-grid']//input")).click();
        macDriver.findElement(By.xpath("//*[@class='x-panel-body xedit-grid']//input")).sendKeys("c");
        macDriver.findElement(By.xpath("//*[@class='x-panel-body xedit-grid']//input")).click();
        macDriver.findElement(By.xpath("//*[contains(@class, 'x-grid3-col-value')]")).click();
        macDriver.findElement(By.xpath("//input[contains(@class, 'form-focus')]")).sendKeys(SKUNumber);

        macDriver.findElement(By.xpath("//div[contains(@class, 'x-grid3-hd-catalog')]")).click();
        macDriver.findElement(By.xpath("//button[text()='Save']")).click();
    }

    public void editPromotionRules(String newPercentOff) {
        macDriver.findElement(By.xpath("//*[@id='Row_0_Discount']")).click();
        macDriver.findElement(By.xpath("//*[@id='Row_0_Discount']")).clear();
        macDriver.findElement(By.xpath("//*[@id='Row_0_Discount']")).sendKeys(newPercentOff);
    }

    public void clicksOnApplyButtonOnPromotionPage() {
        macDriver.findElement(By.xpath("//button[@name='Apply']")).click();
    }

    public void clickOnJobsFromAdministrationTab() {
        macDriver.findElement(By.xpath("(//*[@title='Open menu item submenu'])[2]")).click();
        macDriver.findElement(By.xpath("//*[@title='Manage job schedules.']")).click();
    }

    public void clickOnExportJSONPromotions(String brand) {
        macDriver.findElement(By.xpath("//span[text()='Aptos_ExportPromotionsJSON_" + brand + "']")).click();
    }

    public void clickOnScheduleAndHistory() {
        macDriver.findElement(By.xpath("//a[@class='dw-nc-tabs-link' and text()='Schedule and History']")).click();
    }

    public void clickOnRunButton() throws InterruptedException {
        Thread.sleep(5000);
        macDriver.findElement(By.xpath("//button[@class ='dw-button dw-button-primary' and text()='Run Now']")).click();
        //macDriver.findElement(By.xpath("//button[@class='dw-button dw-button-primary' and @ng-show='jobExecPerm.post && !runWithParametersDialogAvailable' and @type='button' and @ng-disabled='!runnable' and @async-button='' and @async-event='click' and @async-fn='runJob()']")).click();
        Thread.sleep(10000);
        macDriver.findElement(By.xpath("//button[@class='dw-button action-element pull-right' and text()='Refresh']")).click();
        Thread.sleep(10000);
        macDriver.findElement(By.xpath("//button[@class='dw-button action-element pull-right' and text()='Refresh']")).click();
    }

    public void selectEndDate(String endDate) {
        String[] parts = endDate.split("-");
        macDriver.findElement(By.xpath("(//img[contains(@class, 'x-form-trigger') and contains(@class, 'x-form-date-trigger')])[2]\n")).click();
        macDriver.findElement(By.xpath("//td[@class='x-date-middle']\n")).click();
        macDriver.findElement(By.xpath("//div[contains(@class, \"x-date-mp\")]//table//tbody//tr//td//a[text()='" + parts[1] + "']\n")).click();
        macDriver.findElement(By.xpath("//div[contains(@class, \"x-date-mp\")]//table//tbody//tr//td//a[text()='" + parts[2] + "']\n")).click();
        macDriver.findElement(By.xpath("//button[@class='x-date-mp-ok']")).click();
        macDriver.findElement(By.xpath("//table[contains(@class, 'x-date-inner')]//tr//td[contains(@class, 'x-date-active')]//a//span[text()='" + parts[0] + "']\n")).click();
    }

    public void clicksOnNewButton() {
        macDriver.findElement(By.xpath("//button[contains(text(), 'New')]")).click();
    }

    public void enterComapignName(String compaignName) {
        WebElement inputField = macDriver.findElement(By.xpath("//input[@id='x-auto-2-input' and @name='ID']"));
        inputField.clear();
        inputField.sendKeys(compaignName);
    }

    public void enterPromoDescription(String description) {
        macDriver.findElement(By.xpath("//*[@id='x-auto-4-input' and @name='description']")).sendKeys(description);
    }

    public void clickOnSourceCodeButton() {
        macDriver.findElement(By.xpath("//div[contains(@class, 'x-component dw-bm-adapterfield dw-bm-widget-objectreferencesfield dw-bm-campaign-editpanel-detailspanel-generalpanel-sourceCodeGroups')]\n" +
                "//table/tbody/tr[1]/td[2]//table/tbody/tr[2]/td[2]//button[text()='Edit']")).click();
    }

    public void clickOnSourceCodePassingField(String sourceCode) throws InterruptedException {
        macDriver.findElement(By.xpath("//*[contains(@class, 'sourcecodegroupsselectionpanel')]//input")).sendKeys(sourceCode);
        macDriver.findElement(By.xpath("//*[contains(@class, 'sourcecodegroupsselectionpanel')]//input")).sendKeys(Keys.ENTER);
        macDriver.findElement(By.xpath("//span[text()='" + sourceCode + "']")).click();
        macDriver.findElement(By.xpath("//*[contains(@class, 'sourcecodegroupsselectionpanel')]//em/button[text()='Apply']")).click();
    }

    public void enterCouponCode(String coupon) {
        macDriver.findElement(By.xpath("//input[@name='__custom.aptosSingleCouponCode']")).sendKeys(coupon);
    }

    public void selectCurrency(String currency) {
        macDriver.findElement(By.xpath("//input[@name='__custom.aptosCountryCurrency']")).click();
        if (currency.equals("US")) {
            macDriver.findElement(By.xpath("//div[contains(text(), 'United States of America (USD)')]")).click();
        } else {
            macDriver.findElement(By.xpath("//div[@class='x-combo-list-item ' and text()='Canada (CAD)']")).click();
        }
    }

    public void clicksOnNewButtonOnPromotionPage() {
        macDriver.findElement(By.xpath("//span[contains(text(), 'New')]")).click();
    }

    public void enterPromotionID() {
        macDriver.findElement(By.xpath("//input[@name='PromotionID']")).sendKeys(compaignName);
    }

    public void enterPromotionName() {
        macDriver.findElement(By.xpath("//input[@name='Metab6b1c657f6c58cf40a14d16f08']")).sendKeys(nameAndDescription);
    }

    public void setExclusivity() {
        WebElement dropDownElement = macDriver.findElement(By.xpath("//select[@name='Meta7b7ec02f9e76fb1f76a5e3349b']"));
        Select select = new Select(dropDownElement);
        select.selectByIndex(1);
    }

    public void clicksOnApplyButton() {
        WebElement applyButton = macDriver.findElement(By.xpath("//*[contains(@class, 'buttonspacing right n')]//button"));
        JavascriptExecutor jsExecutor = (JavascriptExecutor) macDriver;
        jsExecutor.executeScript("arguments[0].scrollIntoView(true);", applyButton);
        applyButton.click();
    }

    public void selectPromotionClass() {
        WebElement dropDown = macDriver.findElement(By.xpath("//select[@id='PromotionClassSelection']"));
        Select select = new Select(dropDown);
        select.selectByIndex(1);
        WebElement dropDownClass = macDriver.findElement(By.xpath("//select[@id='ConditionTypeSelection']"));
        Select selectClass = new Select(dropDownClass);
        selectClass.selectByIndex(1);

    }

    public void selectDiscountRule() {
        macDriver.findElement(By.xpath("//input[@name='Row_0_BuyX']")).sendKeys("1");
        macDriver.findElement(By.xpath("//input[@name='Row_0_Discount']")).sendKeys("10");
        WebElement dropDown = macDriver.findElement(By.xpath("//select[@name='Row_0_Type']"));
        Select select = new Select(dropDown);
        select.selectByVisibleText("Percent Off");
    }

    public void selectCompaignIdForCombining() {
        macDriver.findElement(By.xpath("//*[@placeholder='Search by ID or description...']")).sendKeys(compaignName);
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(6));
        WebElement promoID = wait.until(ExpectedConditions.elementToBeClickable(macDriver.findElement(By.xpath("//span[text()='Find']"))));
        promoID.click();
        macDriver.findElement(By.xpath("//*[@title='" + compaignName + "']")).click();
    }

    public void clickOnAddExperience() {
        macDriver.findElement(By.xpath("//button[text()='Add Experience']")).click();
    }

    public void clicksOnAddPromotionButton() {
        macDriver.findElement(By.xpath("//a[text()='Add Promotion']")).click();
    }

    public void enterPromotionIdForCombine() {
        WebElement addPromoButton = macDriver.findElement(By.xpath("//*[contains(@class, ' x-form-field-wrap  dw-bm-widget-searchpanel-textfield x-component')]//input"));
        addPromoButton.sendKeys(compaignName);
        addPromoButton.sendKeys(Keys.ENTER);
        macDriver.findElement(By.xpath("//span[text()='" + compaignName + "']")).click();
        macDriver.findElement(By.xpath("(//button[contains(text(), 'Apply')])[last()]")).click();
    }

    public void waitForPageToVisible() throws InterruptedException {
        Thread.sleep(20000);
    }

    public void quitBrowser() {
        macDriver.quit();
    }
}