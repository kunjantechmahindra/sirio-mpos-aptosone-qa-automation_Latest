package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.CEFPage;
import io.cucumber.java.en.And;

import java.io.IOException;
import java.net.MalformedURLException;




public class CEFPageStepDefinition extends TestBase {

    CEFPage cefPage = new CEFPage();

    public CEFPageStepDefinition() throws IOException {
    }

    @And("the sales assistant login to CEF")
    public void theSalesAssistantLoginToCEF() throws MalformedURLException {
        TestBase.initializeAppiumDriverForSafari();
        TestBase.launchUrl(properties.getProperty("CEFPageURL"));
        cefPage.signInToCEF();

    }

    @And("the sales assistant clicks on event search")
    public void theSalesAssistantClicksOnEventSearch() {
        cefPage.clickOnEventSearch();
    }

    @And("the sales assistant enter the business ID")
    public void theSalesAssistantEnterTheBusinessID() {
        cefPage.enterBusinessID();
    }

    @And("the sales assistant validates the AptosOne transactions are flowing to ESB")
    public void theSalesAssistantValidatesTheAptosOneTransactionsAreFlowingToESB() {
        cefPage.validateTransactionFlowToESB();
    }

    @And("the sales assistant logout from CEF")
    public void theSalesAssistantLogoutFromCEF() {
        cefPage.logout();
    }

    @And("the sales assistant enter date {string} and business ID")
    public void theSalesAssistantEnterDateAndBusinessID(String date) {
        cefPage.enterDateAndBusinessIDForDCK(date);
    }
}