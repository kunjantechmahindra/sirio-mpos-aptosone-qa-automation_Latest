package aptos.stepDefinition;

import aptos.base.TestBase;
import aptos.pages.BasketPage;
import aptos.pages.CustomerPage;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import io.cucumber.java.en.And;
import org.json.simple.parser.ParseException;

import java.io.IOException;

public class CustomerPageStepDefinition extends TestBase {

    CustomerPage customerPage = new CustomerPage();
    BasketPage basketPage = new BasketPage();
    MobileActions mobileActions = new MobileActions();
    GeneralUtility generalUtility = new GeneralUtility();

    public CustomerPageStepDefinition() throws IOException, ParseException {
    }

    @And("the sales assistant clicks on New Customer")
    public void theSalesAssistantClicksOnNewCustomer() throws InterruptedException {
        mobileActions.clickHideKeyboard();
        customerPage.clickOnNewCustomerButton();
    }

    @And("the sales assistant enter New customer detail")
    public void theSalesAssistantEnterNewCustomerDetail() {
        customerPage.enterCustomerLastName("valid");
        customerPage.enterCustomerFirstName("valid");
        customerPage.enterCustomerEmail("valid");
        customerPage.enterCustomerPhoneNumber("valid");
        customerPage.enterZipCode("valid");
    }


    @And("the sales assistant enter mandatory customer details")
    public void theSalesAssistantEnterMandatoryCustomerDetails() {
        customerPage.enterCustomerEmail("valid");
        customerPage.enterZipCode("valid");
    }

    @And("the sales assistant clicks on Privacy Policy")
    public void theSalesAssistantClicksOnPrivacyPolicy() {
        customerPage.clickOnPrivacyPolicy();
    }

    @And("the sales assistant clicks on Newsletter")
    public void theSalesAssistantClicksOnNewsletter() {
        customerPage.clickOnNewsLetterSwitch();
    }

    @And("the sales assistant clicks on Save button")
    public void theSalesAssistantClicksOnSaveButton() {
        customerPage.clickOnSaveButton();
    }

    @And("the sales assistant clicks on Update button")
    public void theSalesAssistantClicksOnUpdateButton() throws InterruptedException {
        customerPage.clickOnUpdateButton();
    }

    @And("the sales assistant clicks on {string} to loyalty program")
    public void theSalesAssistantClicksOnToLoyaltyProgram(String option) {
        switch (option) {
            case "Enroll":
                customerPage.clickOnEnrollButtonInPopUp();
                break;
            case "No":
                customerPage.clickOnNoButtonInPopUp();
                break;
            default:
                throw new IllegalArgumentException("Invalid option: " + option);
        }
    }

    @And("the sales assistant assign customer details with index {int}")
    public void theSalesAssistantSearchCustomerDetailsWithIndex(int index) throws IOException, ParseException {
        customerPage.searchAndAssignCustomerUsingEmail(index);
    }

    @And("the sales assistant search a customer using email at index {int}")
    public void theSalesAssistantSearchACustomerDetailsAtIndex(int index) throws IOException, ParseException {
        customerPage.searchCustomerUsingEmail(index);
    }

    @And("the sales assistant validate the customer details at index {int}")
    public void theSalesAssistantValidateTheCustomerDetailsAtIndex(int index) throws IOException, ParseException, InterruptedException {
        customerPage.validateCustomerDetails(index);
    }

    @And("the sales assistant clicks on edit customer option from Search customer page")
    public void theSalesAssistantClicksOnEditCustomerOptionFromSearchCustomerPage() throws InterruptedException {
        customerPage.navigateToSearchCustomer(); // this is not applicable for new version in iPad. Need to check for iPhone
        customerPage.clickOnEditCustomer();
    }

    @And("the sales assistant navigate to basket page")
    public void theSalesAssistantNavigateToBasketPage() throws InterruptedException {
        customerPage.clickOnBasketButtonFromHeader();
    }

    @And("the sales assistant will update {string} in customer details")
    public void theSalesAssistantWillUpdateInCustomerDetails(String field) {
        switch (field.toLowerCase()) {
            case "all":
                customerPage.updateCustomerLastName();
                customerPage.updateCustomerFirstName();
                customerPage.updateCustomerPhoneNumber();
                customerPage.updateCustomerZipcode();
                break;
            case "first name":
                customerPage.updateCustomerFirstName();
                break;
            case "last name":
                customerPage.updateCustomerLastName();
                break;
            case "phone number":
                customerPage.updateCustomerPhoneNumber();
                break;
            case "zipcode":
                customerPage.updateCustomerZipcode();
                break;
            default:
                throw new IllegalArgumentException("Invalid field: " + field);
        }
    }

    @And("the sales assistant validate {string} updated customer details")
    public void theSalesAssistantValidateUpdatedCustomerDetails(String fields) throws IOException, ParseException {
        customerPage.validateUpdatedCustomerDetails(fields);
    }

    @And("the test data is updated with {string} updated details at index {int}")
    public void theTestDataIsUpdatedWithUpdatedDetailsAtIndex(String field, int index) throws IOException, ParseException {
        customerPage.updateCustomerDetailInTestData(index, field);
    }

    @And("the sales assistant validate all details for the newly created customer")
    public void theSalesAssistantValidateAllDetailsForTheNewlyCreatedCustomer() throws IOException, ParseException {
        customerPage.validateNewCustomerDetails();
    }

    @And("the sales assistant validate if email is not editable")
    public void theSalesAssistantValidateIfEmailIsNotEditable() {
        customerPage.validateIfEmailIsEnabled();
    }

    @And("the sales assistant discard the changes from edit customer screen")
    public void theSalesAssistantDiscardTheChangesFromEditCustomerScreen() {
        customerPage.clickOnBackButtonFromEditCustomer();
    }

    @And("the sales assistant navigate to basket page from Search customer page")
    public void theSalesAssistantNavigateToBasketPageFromSearchCustomerPage() throws InterruptedException {
        customerPage.clickOnBackButtonFromSearchCustomer();
    }

    @And("the sales assistant proceed without selecting the customer")
    public void theSalesAssistantProceedWithoutSelectingTheCustomer() {
        customerPage.clickOnSkipButton();
    }

    @And("the sales assistant search a customer with email and Phone Number at index {int}")
    public void theSalesAssistantSearchACustomerWithEmailAndPhoneNumberAtIndex(int index) throws IOException, ParseException {
        customerPage.enterEmailInSearch(index);
        customerPage.enterPhoneNumberInSearch(index);
        customerPage.clickOnCustomerSearchButton();
    }

    @And("the sales assistant search a customer with {string} email and {string} Phone Number at index {int}")
    public void theSalesAssistantSearchACustomerWithEmailAndPhoneNumberAtIndex(String emailValidity, String phoneValidity, int index) throws IOException, ParseException {
        int invalidData = index - 1;
        if (emailValidity.equals("valid") && phoneValidity.equals("valid")) {
            customerPage.enterEmailInSearch(index);
            customerPage.enterPhoneNumberInSearch(index);
            customerPage.clickOnCustomerSearchButton();
        } else if (emailValidity.equals("invalid") && phoneValidity.equals("valid")) {
            customerPage.enterEmailInSearch(invalidData);
            customerPage.enterPhoneNumberInSearch(index);
            customerPage.clickOnCustomerSearchButton();
        } else if (emailValidity.equals("valid") && phoneValidity.equals("invalid")) {
            customerPage.enterEmailInSearch(index);
            customerPage.enterPhoneNumberInSearch(invalidData);
            customerPage.clickOnCustomerSearchButton();
        } else {
            throw new IllegalArgumentException("Invalid email and phone validity parameters.");
        }
    }

    @And("the sales assistant navigate to basket page from customer profile")
    public void theSalesAssistantNavigateToBasketPageFromCustomerProfile() throws InterruptedException {
        customerPage.navigateToSearchCustomer();
        customerPage.clickOnBackButtonFromSearchCustomer();
    }

    @And("the sales assistant search a customer with Phone Number at index {int}")
    public void theSalesAssistantSearchACustomerWithPhoneNumberAtIndex(int index) throws IOException, ParseException {
        customerPage.enterPhoneNumberInSearch(index);
        customerPage.clickOnCustomerSearchButton();
    }

    @And("the sales assistant search a customer with Phone Number and email at index {int}")
    public void theSalesAssistantSearchACustomerWithPhoneNumberAndEmailAtIndex(int index) throws IOException, ParseException {
        customerPage.searchCustomerUsingEmailAndPhoneNumber(index);
        customerPage.clickOnCustomerSearchButton();
    }

    @And("the sales assistant enter customer detail with {string} as {string}")
    public void theSalesAssistantEnterCustomerDetailWithAs(String field, String validity) {
        String invalidValue = "invalid";
        String fieldLower = field.toLowerCase();
        String validityLower = validity.toLowerCase();
        if (!fieldLower.equals("last name")) {
            customerPage.enterCustomerLastName("valid");
        }
        if (!fieldLower.equals("first name")) {
            customerPage.enterCustomerFirstName("valid");
        }
        if (!field.equals("email")) {
            customerPage.enterCustomerEmail("valid");
        }
        if (!field.equals("phone number")) {
            customerPage.enterCustomerPhoneNumber("valid");
        }
        if (!field.equals("zip code")) {
            customerPage.enterZipCode("valid");
        }

        switch (fieldLower) {
            case "phone number":
                if (validityLower.equals("invalid")) {
                    customerPage.enterCustomerPhoneNumber("invalid");
                } else if (validityLower.equals("null")) {
                    customerPage.enterCustomerPhoneNumber(null);
                }
                break;
            case "last name":
                if (validityLower.equals("invalid")) {
                    customerPage.enterCustomerLastName(invalidValue);
                } else if (validityLower.equals("null")) {
                    customerPage.enterCustomerLastName(null);
                }
                break;
            case "first name":
                if (validityLower.equals("invalid")) {
                    customerPage.enterCustomerFirstName(invalidValue);
                } else if (validityLower.equals("null")) {
                    customerPage.enterCustomerFirstName(null);
                }
                break;
            case "email":
                if (validityLower.equals("invalid")) {
                    customerPage.enterCustomerEmail(invalidValue);
                } else if (validityLower.equals("null")) {
                    customerPage.enterCustomerEmail(null);
                }
                break;
            case "zip code":
                if (validityLower.equals("invalid")) {
                    customerPage.enterZipCode(invalidValue);
                } else if (validityLower.equals("null")) {
                    customerPage.enterZipCode(null);
                }
                break;
            default:
                throw new IllegalArgumentException("Invalid field: " + field);
        }

    }

    @And("the sales assistant validate if message is displayed as {string} is {string}")
    public void theSalesAssistantValidateIfIs(String field, String errorType) {
        String fieldLower = field.toLowerCase();
        String errorTypeLower = errorType.toLowerCase();

        switch (fieldLower) {
            case "first name":
                if (errorTypeLower.equals("required")) {
                    customerPage.validateFirstNameCodeError("Required");
                }
                break;
            case "last name":
                if (errorTypeLower.equals("required")) {
                    customerPage.validateLastNameCodeError("Required");
                }
                break;
            case "email":
                if (errorTypeLower.equals("required")) {
                    customerPage.validateEmailError("Required");
                } else {
                    customerPage.validateEmailError("Invalid email address");
                }
                break;
            case "phone number":
                if (errorTypeLower.equals("required")) {
                    customerPage.validatePhoneNumberError("Required");
                } else {
                    customerPage.validatePhoneNumberError("Expected digits : 10-10");
                }
                break;
            case "zip code":
                if (errorTypeLower.equals("required")) {
                    customerPage.validateZipCodeError("Required");
                } else {
                    if (properties.getProperty("Region").equals("CA")) {
                        customerPage.validateZipCodeError("Expected character count: 6 - 6");
                    } else {
                        customerPage.validateZipCodeError("Expected character count: 5 - 10");
                    }
                }
                break;
            default:
                throw new IllegalArgumentException("Invalid field: " + field);
        }
    }

    @And("the sales assistant validate {string} and {string} for the newly created customer")
    public void theSalesAssistantValidateForTheNewlyCreatedCustomer(String field1, String field2) {
        customerPage.validateCustomerDetail(field1);
        customerPage.validateCustomerDetail(field2);
    }

    @And("the sales assistant removes the customer from the transaction")
    public void theSalesAssistantRemovesTheCustomerFromTheTransaction() throws InterruptedException {
        customerPage.removeCustomerFromTransaction();
    }

    @And("the sales assistant assign validate if no result is displayed.")
    public void theSalesAssistantAssignValidateIfNoResultIsDisplayed() {
        customerPage.verifyIfNoResultFound();
    }

    @And("the sales assistant clicks on search results back button from customer profile")
    public void theSalesAssistantClicksOnSearchResultsBackButtonFromCustomerProfile() throws InterruptedException {
        customerPage.navigateToSearchCustomer();
        //customerPage.clicksOnSearchResultBackButton();
    }

    @And("the sales assistant saves the loyalty points")
    public void theSalesAssistantSavesTheLoyaltyPoints() {
        customerPage.clickOnAssignedCustomerButton();
        customerPage.clickOnLoyaltyPointsDetails();
        customerPage.getLoyaltyPoints();
    }

    @And("the sales assistant navigates to basket from page from loyalty page")
    public void theSalesAssistantNavigatesToBasketFromPageFromLoyaltyPage() {
        customerPage.navigateToCustomerProfileFromLoyaltyPage();
        customerPage.navigateToBasketFromCustomerProfile();
    }

    @And("the sales assistant clicks on Loyalty Terms")
    public void theSalesAssistantClicksOnLoyaltyTerms() {
        customerPage.clickOnLoyaltyButton();
    }

    @And("the sales assistant validate Privacy and Loyalty are enabled")
    public void theSalesAssistantValidatePrivacyAndLoyaltyAreEnabled() {
        customerPage.loyaltyAttributeValidation("Yes");
        customerPage.privacyAttributeValidation("Yes");
        customerPage.newsLetterAttributeValidation("No");

    }

    @And("the sales assistant enable all Terms and Conditions")
    public void theSalesAssistantEnableAllTermsAndConditions() {
        customerPage.clickOnPrivacyButton();
        customerPage.clickOnNewsLetterButton();
        if (!properties.getProperty("BrandRegion").equals("TBL-CA")) {
            customerPage.clickOnLoyaltyButton();
        }
    }

    @And("the sales assistant validate all attributes are enabled")
    public void theSalesAssistantValidateAllAttributesAreEnabled() {
        customerPage.privacyAttributeValidation("Yes");
        customerPage.newsLetterAttributeValidation("Yes");
        if (!properties.getProperty("BrandRegion").equals("TBL-CA")) {
            customerPage.loyaltyAttributeValidation("Yes");
        }

    }

    @And("the sales assistant validate there is no way to disable loyalty")
    public void theSalesAssistantValidateThereIsNoWayToDisableLoyalty() {
        customerPage.noWayToDisableLoyalty();
    }

    @And("the sales assistant search recently assigned customer")
    public void theSalesAssistantSearchRecentlyAssignedCustomer() {
        customerPage.searchRecentlyCreatedCustomer();
    }

    @And("the sales assistant validate loyalty type")
    public void theSalesAssistantValidateLoyaltyType() {
        customerPage.clickOnAssignedCustomerButton();
        customerPage.clickOnLoyaltyPointsDetails();
        customerPage.validateLoyaltyType();
    }

    @And("the sales assistant save the customer details")
    public void theSalesAssistantSaveTheCustomerDetails() throws InterruptedException {
        customerPage.saveCustomerDetails();
        //customerPage.clicksOnSearchResultBackButton();
        customerPage.navigateToSearchCustomer();
        basketPage.clickOnAssignCustomerButton();
    }

    @And("the sales assistant search a customer with new Phone Number and email")
    public void theSalesAssistantSearchACustomerWithNewPhoneNumberAndEmail() {
        customerPage.searchCustomerWithNewEmailAndPhone();
    }

    @And("the sales assistant enter New customer detail without email and phone number")
    public void theSalesAssistantEnterNewCustomerDetailWithoutEmailAndPhoneNumber() {
        customerPage.enterCustomerLastName("valid");
        customerPage.enterCustomerFirstName("valid");
        customerPage.enterZipCode("valid");
    }

    @And("the sales assistant clicks on XPLR Pass")
    public void theSalesAssistantClicksOnXPLRPass() {
        customerPage.clickOnXpPassTerms();
    }

    @And("the sales assistant validates that privacy policy and XPLR Terms error message is displayed")
    public void theSalesAssistantValidatesThatPrivacyPolicyAndXPLRTermsErrorMessageIsDisplayed() {
        customerPage.validatePrivacyPolicyMessageIsDisplayed();
        customerPage.validateXplrMessageIsDisplayed();
    }

    @And("the sales assistant search using non existing email id")
    public void theSalesAssistantSearchUsingNonExistingEmailId() {
        customerPage.searchCustomerWithNonExistEmail();
    }

    @And("the sales assistant enter New customer details without email")
    public void theSalesAssistantEnterNewCustomerDetailsWithoutEmail() {
        customerPage.enterCustomerLastName("valid");
        customerPage.enterCustomerFirstName("valid");
        customerPage.enterZipCode("valid");
        customerPage.enterCustomerPhoneNumber("valid");
    }

    @And("the sales assistant search using non existing Phone number")
    public void theSalesAssistantSearchUsingNonExistingPhoneNumber() {
        customerPage.searchCustomerWithNonExistPhoneNumber();
    }

    @And("the sales assistant enter New customer details without phone number")
    public void theSalesAssistantEnterNewCustomerDetailsWithoutPhoneNumber() {
        customerPage.enterCustomerLastName("valid");
        customerPage.enterCustomerFirstName("valid");
        customerPage.enterZipCode("valid");
        customerPage.enterCustomerEmail("valid");
    }

    @And("the sales assistant validate loyalty points after refund")
    public void theSalesAssistantValidateLoyaltyPointsAfterRefund() {
        customerPage.clickOnAssignedCustomerButton();
        customerPage.clickOnLoyaltyPointsDetails();
        customerPage.validateLoyaltyPointAfterRefund();
    }

    @And("the sales assistant assign recently assigned customer")
    public void theSalesAssistantAssignRecentlyAssignedCustomer() {
        customerPage.searchRecentlyCreatedCustomer();
        customerPage.assignCustomer();
    }

    @And("the sales assistant clicks on New Customer without hiding the keyboard")
    public void theSalesAssistantClicksOnNewCustomerWithoutHidingTheKeyboard() {
        customerPage.clickOnNewCustomerButton();
    }
}
