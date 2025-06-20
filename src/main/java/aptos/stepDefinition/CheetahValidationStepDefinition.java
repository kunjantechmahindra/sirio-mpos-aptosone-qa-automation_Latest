package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.CheetahValidation;
import aptos.utility.TestDataHelper;
import io.cucumber.java.en.And;
import org.json.simple.parser.ParseException;

import java.io.IOException;


public class CheetahValidationStepDefinition extends TestBase {

    CheetahValidation cheetahValidation = new CheetahValidation();

    @And("the sales assistant launch the browser and navigate to Cheetah Application")
    public void theSalesAssistantLaunchTheBrowserAndNavigateToCheetahApplication() throws IOException, ParseException {
        String URL = TestDataHelper.getURL(properties.getProperty("BrandRegion"), "URL");
        String userName = TestDataHelper.getURL(properties.getProperty("BrandRegion"), "UserName");
        String passWord = TestDataHelper.getURL(properties.getProperty("BrandRegion"), "PassWord");
        launchChromeInMac();
        launchUrlInChromeMac(URL);
        cheetahValidation.logIntoCheetah(userName,passWord);
    }

    @And("the sales assistant search customer with email")
    public void theSalesAssistantSearchCustomerWithEmail() {
        cheetahValidation.searchCustomer();

    }

    @And("the sales assistant validate customer details")
    public void theSalesAssistantValidateCustomerDetails() throws InterruptedException {
        cheetahValidation.validateCustomerDetails();
        cheetahValidation.validateCustomerLoyaltyPoints();
    }
}
