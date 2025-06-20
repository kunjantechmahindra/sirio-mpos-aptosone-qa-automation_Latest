package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.LandingPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.io.IOException;

public class LandingPageStepDefinition extends TestBase {
    LandingPage landingPage = new LandingPage();

    public LandingPageStepDefinition() throws IOException {
    }

    @Then("the sales assistant clicks on Start Basket button")
    public void theSalesAssistantClicksOnStartBasketButton() {
        landingPage.clickOnStartBasket();
    }

    @And("the sales assistant click on hamburger menu")
    public void theSalesAssistantClickOnHamburgerMenuFromLandingPage() {
        landingPage.clickOnHamburgerMenu();
    }

    @And("the sales assistant clicks on Sales history for store selling")
    public void theSalesAssistantClicksOnSalesHistoryForStoreSelling() {
        landingPage.clickOnSalesHistory();
    }

    @When("the sales assistant verifies the Start Basket button")
    public void theSalesAssistantVerifiesTheStartBasketButton() {
        landingPage.validateStartBasket();
    }

    @When("the sales assistant verifies the Hamburger Menu button")
    public void theSalesAssistantVerifiesTheHamburgerMenuButton() {
        landingPage.validateHamburgerButton();
    }

    @And("the sales assistant logout from the application from Landing Page")
    public void theSalesAssistantLogoutFromTheApplicationFromLandingPage() {
        landingPage.logoutFromLandingPage();
    }

    @When("the sales assistant validates the Hamburger Menu options")
    public void theSalesAssistantValidatesTheHamburgerMenuOptions() throws InterruptedException {
        landingPage.hamburgerOptionValidation();
    }

    @And("the sales assistant lands on Landing Page")
    public void theSalesAssistantLandsOnLandingPage() {
        landingPage.validateStartBasket();
    }

    @And("the sales assistant validate Personalized Landing page message {string}")
    public void theSalesAssistantValidatePersonalizedLandingPageMessage(String message) {
        landingPage.validateLandingPageMessage(message);
    }

    @And("the sales assistant navigate to Reprint last receipt page")
    public void theSalesAssistantNavigateToReprintLastReceiptPage() {
        landingPage.clickOnHamburgerMenu();
        landingPage.clickOnReprint();
    }

    @And("the sales assistant validates the Close Terminal function")
    public void theSalesAssistantValidatesTheCloseTerminalFunction() throws InterruptedException {
        landingPage.validateCloseTerminal();
        landingPage.clickOnCloseTerminal();
        landingPage.clickOnOpenTerminal();
    }

    @And("the sales assistant validates the Close Terminal function and cancel the operation")
    public void theSalesAssistantValidatesTheCloseTerminalFunctionAndCancelTheOperation() throws InterruptedException {
        landingPage.validateCloseTerminal();
        landingPage.clickOnCloseTerminalButton();
        landingPage.cancelCloseTerminalOperation();
    }
    @And("the sales assistant clicks on back button on store operations page")
    public void theSalesAssistantClicksOnBackButtonOnStoreOperationsPage() throws InterruptedException {
        landingPage.clickOnBackButtonFromStoreOperationPageToBasketPage();
    }
}
