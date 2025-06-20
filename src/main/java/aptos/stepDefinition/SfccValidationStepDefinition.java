package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.SfccPage;
import aptos.utility.TestDataHelper;
import io.cucumber.java.en.And;
import org.json.simple.parser.ParseException;

import java.io.IOException;

public class SfccValidationStepDefinition extends TestBase {

    SfccPage sfccPage = new SfccPage();

    public static String compaignName;
    public static String nameAndDescription;


    public SfccValidationStepDefinition() {
    }

    @And("the sales assistant launches SFCC application")
    public void theSalesAssistantLaunchesSFCC() {
        sfccPage.launchSfcc();
    }

    @And("the sales assistant login to SFCC application")
    public void theSalesAssistantLoginToSFCC() {
        sfccPage.loginToSfcc();
    }

    @And("the sales assistant selects {string} as site")
    public void theSalesAssistantSelectsAsSite(String site) {
        sfccPage.selectSite(site);
    }

    @And("the sales assistant selects campaigns from merchant tools")
    public void theSalesAssistantSelectsCampaignsFromMerchantTools() {
        sfccPage.clickOnCampaigns();
    }

    @And("sales assistant quit the browser")
    public void salesAssistantQuitTheBrowser() {
        sfccPage.quitBrowser();
    }

    @And("the sales assistant enter the promotion ID {string}")
    public void theSalesAssistantEnterThePromotionID(String promotionId) {
        sfccPage.passPromotionID(promotionId);
    }

    @And("the sales assistant select start date {string}")
    public void theSalesAssistantUpdateTheStartDateAndEndDate(String startDate) {
        sfccPage.selectStartDate(startDate);
    }

    @And("sales assistant clicks on apply button in campaign page")
    public void salesAssistantClicksOnApplyButtonInCampaignPage() {
        sfccPage.clickOnApplyButtonOnCampaignsPage();
    }

    @And("sales assistant selects promotions from merchant tools")
    public void salesAssistantSelectsPromotionsFromMerchantTools() {
        sfccPage.clickOnPromotions();
    }

    @And("sales assistant enter the promotion ID {string} for promotions")
    public void salesAssistantEnterThePromotionIDForPromotions(String promotionID) {
        sfccPage.passPromotionIDForPromotions(promotionID);
    }

    @And("sales assistant update the UPC's for the promotion")
    public void salesAssistantUpdateTheUOCSForThePromotion() {
        sfccPage.clickOnEditQualifyingProducts();
    }

    @And("sales assistant edit the promotion rule to {string}")
    public void salesAssistantEditThePromotionRules(String newPercentOff) {
        sfccPage.editPromotionRules(newPercentOff);
    }

    @And("sales assistant clicks on Apply button in promotion page")
    public void salesAssistantClicksOnApplyButtonInPromotionPage() {
        sfccPage.clicksOnApplyButtonOnPromotionPage();
    }

    @And("sales assistant clicks on Jobs from administration tab")
    public void salesAssistantClicksOnJobsFromAdministrationTab() {
        sfccPage.clickOnJobsFromAdministrationTab();
    }

    @And("sales assistant clicks on export promotion JSON for {string}")
    public void salesAssistantClicksOnExportPromotionJSONFor(String brand) {
        sfccPage.clickOnExportJSONPromotions(brand);
    }

    @And("sales assistant clicks on Schedule and History Tab")
    public void salesAssistantClicksOnScheduleAndHistoryTab() {
        sfccPage.clickOnScheduleAndHistory();
    }

    @And("sales assistant clicks on run button")
    public void salesAssistantClicksOnRunButton() throws InterruptedException {
        sfccPage.clickOnRunButton();
    }

    @And("the sales assistant select end date {string}")
    public void salesAssistantSelectDate(String endDate) {
        sfccPage.selectEndDate(endDate);
    }

    @And("sales assistant select the SKU for {string}")
    public void salesAssistantSelectTheSKUFor(String promoSKU) throws IOException, ParseException, InterruptedException {
        String SKU = TestDataHelper.getSFCCPromoSKU(properties.getProperty("BrandRegion"), promoSKU);
        sfccPage.selectUPCs(SKU);
    }

    @And("the sales assistant clicks on new button")
    public void theSalesAssistantClicksOnNewButton() {
        sfccPage.clicksOnNewButton();
    }

    @And("the sales assistant enter the compaign name {string}")
    public void theSalesAssistantEnterTheCompaignName(String compaignNameID) {
        compaignName = compaignNameID;
        sfccPage.enterComapignName(compaignNameID);
    }

    @And("the sales assistant enter the promotion description {string}")
    public void theSalesAssistantEnterThePromotionDescription(String description) {
        nameAndDescription = description;
        sfccPage.enterPromoDescription(description);
    }

    @And("the sales assistant click on source codes button")
    public void theSalesAssistantClickOnSourceCodesButton() {
        sfccPage.clickOnSourceCodeButton();
    }


    @And("the sales assistant select the source codes {string}")
    public void theSalesAssistantSelectTheSourceCodes(String sourceCodes) throws InterruptedException {
        sfccPage.clickOnSourceCodePassingField(sourceCodes);
    }


    @And("the sales assistant enter the coupon code {string}")
    public void theSalesAssistantEnterTheCouponCode(String couponCode) {
        sfccPage.enterCouponCode(couponCode);
    }

    @And("the sales assistant select the compaign currency {string}")
    public void theSalesAssistantSelectTheCompaignCurrency(String currency) {
        sfccPage.selectCurrency(currency);
    }

    @And("the sales assistant clicks on new button in promotion")
    public void theSalesAssistantClicksOnNewButtonInPromotion() {
        sfccPage.clicksOnNewButtonOnPromotionPage();
    }

    @And("the sales assistant enter the Promotion ID")
    public void theSalesAssistantEnterThePromotionID() {
        sfccPage.enterPromotionID();

    }

    @And("the sales assistant enter the promotion name")
    public void theSalesAssistantEnterThePromotionName() {
        sfccPage.enterPromotionName();
    }

    @And("the sales assistant set the exclusivity")
    public void theSalesAssistantSetTheExclusivity() {
        sfccPage.setExclusivity();
    }

    @And("the sales assistant enter apply button")
    public void theSalesAssistantEnterApplyButton() {
        sfccPage.clicksOnApplyButton();
    }

    @And("the sales assistant select the promotion class")
    public void theSalesAssistantSelectThePromotionClass() {
        sfccPage.selectPromotionClass();
    }

    @And("the sales assistant select the discount Rule")
    public void theSalesAssistantSelectTheDiscountRule() {
        sfccPage.selectDiscountRule();
    }

    @And("the sales assistant enter the compaign ID for combining")
    public void theSalesAssistantEnterTheCompaignIDForCombining() {
        sfccPage.selectCompaignIdForCombining();
    }

    @And("the sales assistant clicks in Add Experience Button")
    public void theSalesAssistantClicksInAddExperienceButton() {
        sfccPage.clickOnAddExperience();
    }

    @And("the sales assistant clicks on Add Promotion Button")
    public void theSalesAssistantClicksOnAddPromotionButton() {
        sfccPage.clicksOnAddPromotionButton();
    }

    @And("the sales assistant enter the promotion ID for combining")
    public void theSalesAssistantEnterThePromotionIDForCombining() {
        sfccPage.enterPromotionIdForCombine();
    }

    @And("the sales assistant wait for the page to visible")
    public void theSalesAssistantWaitForThePageToVisible() throws InterruptedException {
        sfccPage.waitForPageToVisible();
    }
}