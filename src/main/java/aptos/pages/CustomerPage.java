package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import aptos.utility.TestDataHelper;
import aptos.utility.W3CActions;
import com.github.javafaker.Faker;
import org.json.simple.parser.ParseException;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.*;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.IOException;
import java.text.DecimalFormat;
import java.time.Duration;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.junit.Assert.*;

public class CustomerPage extends TestBase {

    MobileActions mobileActions = new MobileActions();
    TestDataHelper testDataHelper = new TestDataHelper();
    GeneralUtility generalUtility = new GeneralUtility();

    W3CActions w3CActions = new W3CActions();

    // Initializing the Page Objects
    public CustomerPage() {
        PageFactory.initElements(driver, this);
    }

    Faker faker = new Faker();
    public static String firstName;
    public static String lastName;
    public static String emailAddress;
    public static String phoneNumber;
    public static String zipcode;

    public static String updatedFirstName;
    public static String updatedLastName;
    public static String updatedPhoneNumber;
    public static String updatedZipcode;

    public static String firstNameTestData;
    public static String lastNameTestData;
    public static String emailTestData;

    public static String availableLoyaltyPoints;
    public static String availableLoyaltyPointsAptos;

    public static String customerFullName;
    public static String customerNumber;


    // Page Factory Object Repository.
    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerSearch-button-skip']")
    WebElement iPhoneSkipButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Skip']")
    WebElement skipButton;

    @FindBy(xpath = "//*[@name='CustomerSearch-header-title']")
    WebElement customerSearchHeader;

    @FindBy(xpath = "//*[@name='CustomerScreen-Add-button']")
    WebElement newCustomerButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerScreen-Add-button']")
    WebElement iPhoneNewCustomerHeaderButton;

    @FindBy(xpath = "//*[contains(@name, 'saveButton')]")
    WebElement clickOnSaveButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerAddUpdate-saveButton']")
    WebElement iPhoneClickOnSaveButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerAddUpdate-saveButton']")
    WebElement clickOnUpdateButton;

    @FindBy(xpath = "//*[contains(@name, 'CustomerSearch-header-title')]")
    WebElement searchCustomerHeader;

    @FindBy(xpath = "//*[contains(@name, 'lastName-pressable')]")
    WebElement lastNameText;

    @FindBy(xpath = "//*[contains(@name, 'firstName-pressable')]")
    WebElement firstNameText;

    @FindBy(xpath = "//*[contains(@name, 'emailAddress-pressable')]")
    WebElement emailAddressText;

    @FindBy(xpath = "//*[contains(@name, 'phoneNumber-pressable')]")
    WebElement phoneNumberText;

    @FindBy(xpath = "//*[contains(@name, 'postalCode-pressable')]")
    WebElement zipCodeText;

    @FindBy(xpath = "//*[contains(@name, 'postalCode-label')]")
    WebElement zipCodeLabel;

    @FindBy(xpath = "//XCUIElementTypeSwitch[contains(@name, '-PrivacyPolicy-switch')]")
    WebElement privacyPolicySwitch;

    @FindBy(xpath = "//*[contains(@name, '-LoyaltyTerms-switch')]")
    WebElement passTerms;

    @FindBy(xpath = "//XCUIElementTypeSwitch[contains(@name, 'NL_EMAIL-switch')]")
    WebElement newsLetterSwitch;

    @FindBy(xpath = "//*[@name='No']")
    WebElement popUpButtonNo;

    @FindBy(xpath = "//*[@name='Enroll']")
    WebElement enrollButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Basket'])[2]")
    WebElement basketButtonInHeader;

    @FindBy(xpath = "//*[@name='CustomerScreen-header-header-none-button']")
    WebElement backToBasketInHeader;

    @FindBy(xpath = "//*[@name='CustomerSearch-header-left-button' and @label='Basket']")
    WebElement basketButtonInSearchHeader;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerScreen-header-header-none-button']")
    WebElement basketButtonInSearchHeaderIPhone;

    @FindBy(xpath = "//*[@name='Main-assignCustomer-linkText']")
    WebElement customerName;

    @FindBy(xpath = "//*[contains(@name, 'CustomerSearch-email-')]")
    WebElement customerEmailSearch;

    @FindBy(xpath = "//*[contains(@name, 'CustomerSearch-phoneNumber-')]")
    WebElement customerPhoneSearch;

    @FindBy(xpath = "//*[@name='CustomerSearch-button-search']")
    WebElement customerSearchButton;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerSearch-button-search']")
    WebElement customerSearchButtoniPhone;


    @FindBy(xpath = "//*[@name='CustomerSearch-header-right-button']")
    WebElement iPhoneCustomerSearchButton;

    @FindBy(xpath = "//*[@name='Search results']")
    WebElement searchResultButton;

    @FindBy(xpath = "//*[contains(@name, 'assignCustomer')]")
    WebElement assignCustomer;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name, 'CustomerScreen-add-button')]")
    WebElement assignCustomerFromSearch;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, '@')])")
    WebElement customerContactInformation;

    @FindBy(xpath = "(//*[contains(@name, 'CustomerScreen-headline-textField')])")
    WebElement existingCustomerName;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerScreen-edit-button']")
    WebElement editCustomerButton;

    @FindBy(xpath = "//*[@name='CustomerAddUpdate-header-header-none-button']")
    WebElement editCustomerBackButton;

    @FindBy(xpath = "//XCUIElementTypeButton[@name='OK']")
    WebElement okButton;

    @FindBy(xpath = "//*[contains(@name, 'emailAddress-error')]")
    WebElement emailAddressError;

    @FindBy(xpath = "//*[contains(@name, 'phoneNumber-error')]")
    WebElement phoneNumberError;

    @FindBy(xpath = "//*[contains(@name, 'postalCode-error')]")
    WebElement zipCodeError;

    @FindBy(xpath = "//*[contains(@name, 'firstName-error')]")
    WebElement firstNameCodeError;

    @FindBy(xpath = "//*[contains(@name, 'lastName-error')]")
    WebElement lastNameCodeError;

    @FindBy(xpath = "//*[@name='No result found']")
    WebElement noResultFound;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Search results']")
    WebElement backButtonSearchResultsCustomer;

    @FindBy(xpath = "//*[contains(@name, 'assignCustomer')]")
    WebElement assignCustomerButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'TBL Loyalty Program')])[last()]")
    WebElement loyaltyPointsFullDetails;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'TBL Loyalty Program')])[last()]")
    WebElement iPhoneLoyaltyPointsFullDetails;


    //@FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'XPLR Pass™')])[2]")
    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'XPLR Pass™')])[last()]")
    WebElement loyaltyPointsFullDetailsTNF;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Available points')])[last()]")
    WebElement loyaltyPoints;

    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name, 'Available points')])[last()]")
    WebElement iPhoneLoyaltyPoints;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Main-assignCustomer-linkText']")
    WebElement assignedCustomerButton;

    //@FindBy(xpath = "(//XCUIElementTypeOther[@name='Customer profile'])[2]")
    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Loyalty'])[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement backButtonLoyaltyPage;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Loyalty'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement iPhoneBackButtonLoyaltyPage;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='Basket']")
    WebElement backButtonFromCustomerProfile;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Edit'])[1]/XCUIElementTypeOther[1]")
    WebElement iPhoneBackButtonFromCustomerProfile;

    @FindBy(xpath = "//XCUIElementTypeSwitch[contains(@name,'LoyaltyTerms-switch')]")
    WebElement loyaltyButton;

    @FindBy(xpath = "//XCUIElementTypeSwitch[contains(@name,'EMAIL-switch')]")
    WebElement newsLetterButton;

    @FindBy(xpath = "//XCUIElementTypeSwitch[contains(@name,'PrivacyPolicy-switch')]")
    WebElement privacyButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Loyalty Terms Loyalty Yes'])[1]")
    WebElement loyaltyEnabledLabel;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Privacy Policy Privacy Policy Yes'])[1]")
    WebElement privacyEnabledLabel;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Newsletter Marketing email Yes'])[1]")
    WebElement newsLetterEnabledLabel;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Loyalty Terms Loyalty No'])[1]")
    WebElement loyaltyDisabledLabel;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Privacy Policy Privacy Policy No'])[1]")
    WebElement privacyDisabledLabel;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Newsletter Marketing email No'])[1]")
    WebElement newsLetterDisabledLabel;

    //@FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, 'Full')]")
    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Full'])[4]")
    WebElement loyaltyTypeLabel;

//    @FindBy(xpath = "(//XCUIElementTypeOther[contains(@name,'Customer number')])[last]")
    //@FindBy(xpath = "//XCUIElementTypeStaticText[contains(@name, 'CustomerScreen-headline-textField')]")
   @FindBy(xpath = "//XCUIElementTypeStaticText[@name='CustomerScreen-supportingText-textField']")
    WebElement customerIdNumber;

    @FindBy(xpath = "//XCUIElementTypeStaticText[@name='CustomerScreen-headline-textField']")
    WebElement customerIdName;

    @FindBy(xpath = "(//*[@name='You must accept the XPLR Pass Terms before you create an account.'])")
    WebElement xplrTermsValidationMessage;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='You must accept the Privacy Policy before you create an account.'])")
    WebElement privacyPolicyValidationMessage;

    @FindBy(xpath = "//XCUIElementTypeOther[contains(@name,'header-left-button')]")
    WebElement iPhoneInfoPageBackButton;

    @FindBy(xpath = "(//XCUIElementTypeOther[@name='Resume sale'])[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther")
    WebElement iPhoneBackButton;

    @FindBy(xpath = "//*[@name='CustomerScreen-add-button']")
    WebElement removeCustomer;

    @FindBy(xpath = "//*[@name='CustomerScreen-Search-button']")
    WebElement customerSearchIcon;

    @FindBy(xpath = "//XCUIElementTypeOther[@name='CustomerSearch-button-clear']")
    WebElement customerDataClearButton;

    @FindBy(xpath = "//*[@name='CustomerScreen-add-button']")
    WebElement addCustomer;

    //Actions
    public void clickOnSkipButton() {
        if ((properties.getProperty("DeviceName").contains("iPhone"))) {
            mobileActions.clickOnElement(iPhoneSkipButton);
        } else {
            mobileActions.clickOnElement(skipButton);
        }
    }

    public void clickOnNewCustomerButton() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(iPhoneNewCustomerHeaderButton);
        } else {
            mobileActions.clickOnElement(newCustomerButton);
        }
    }

    public void clickOnSearchCustomerHeader() {
        mobileActions.clickOnElement(searchCustomerHeader);
    }

    public void enterCustomerLastName(String validationStatus) {
        lastName = faker.name().lastName();
        if (validationStatus == null) {
            mobileActions.enterText(lastNameText, "");
        } else {
            if (validationStatus.equals("valid")) {
                mobileActions.enterText(lastNameText, lastName);
            } else {
                mobileActions.enterText(lastNameText, "!nval1D");
            }
        }
    }

    public void enterCustomerFirstName(String validationStatus) {
        firstName = faker.name().lastName();
        if (validationStatus == null) {
            mobileActions.enterText(firstNameText, "");
        } else {
            if (validationStatus.equals("valid")) {
                mobileActions.enterText(firstNameText, firstName);
            } else {
                mobileActions.enterText(firstNameText, "!nval1D");
            }
        }
    }

    public void enterCustomerEmail(String validationStatus) {
        emailAddress = faker.internet().emailAddress();
        if (validationStatus == null) {
            mobileActions.enterText(emailAddressText, "");
        } else {
            if (validationStatus.equals("valid")) {
                mobileActions.enterText(emailAddressText, emailAddress);
            } else {
                mobileActions.enterText(emailAddressText, "!nval1D");
            }
        }
    }

    public void enterCustomerPhoneNumber(String validationStatus) {
        phoneNumber = TestDataHelper.generatePhoneNumber();
        if (validationStatus == null) {
            mobileActions.enterText(phoneNumberText, "");
        } else {
            if (validationStatus.equals("valid")) {
                mobileActions.enterText(phoneNumberText, String.valueOf(phoneNumber));
            } else {
                mobileActions.enterText(phoneNumberText, "!nval1D");
            }
        }
    }

    public void enterZipCode(String validationStatus) throws InterruptedException {
        zipcode = TestDataHelper.generateZipCode();
        if (validationStatus == null) {
            mobileActions.enterText(zipCodeText, "");
        } else {
            if (validationStatus.equals("valid")) {
                mobileActions.enterText(zipCodeText, zipcode);
            } else {
                mobileActions.enterText(zipCodeText, "!nv@l1D");
            }
        }
    }

    public void updateCustomerLastName() {
        updatedLastName = faker.name().lastName();
        for (int i = 0; i < 10; i++) {
            lastNameText.sendKeys(Keys.BACK_SPACE);
        }mobileActions.clearAndEnterText(lastNameText, updatedLastName);
    }

    public void verifyIfNoResultFound() {
        generalUtility.isElementDisplayed(noResultFound);
    }

    public void updateCustomerFirstName() {
        updatedFirstName = faker.name().firstName();
        for (int i = 0; i < 10; i++) {
            firstNameText.sendKeys(Keys.BACK_SPACE);
        }
        mobileActions.clearAndEnterText(firstNameText, updatedFirstName);
    }

    public void updateCustomerZipcode() {
        updatedZipcode = TestDataHelper.generateZipCode();
        for (int i = 0; i < 6; i++) {
            zipCodeText.sendKeys(Keys.BACK_SPACE);
        }
        mobileActions.clearAndEnterText(zipCodeText, updatedZipcode);
    }

    public void updateCustomerPhoneNumber() {
        updatedPhoneNumber = TestDataHelper.generatePhoneNumber();
        for (int i = 0; i < 10; i++) {
            phoneNumberText.sendKeys(Keys.BACK_SPACE);
        }
        mobileActions.clearAndEnterText(phoneNumberText, updatedPhoneNumber);
    }

    public void clickOnPrivacyPolicy() {
        mobileActions.clickOnElement(privacyPolicySwitch);
    }

    public void clickOnNewsLetterSwitch() {
        mobileActions.clickOnElement(newsLetterSwitch);
    }

    public void clickOnSaveButton() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(iPhoneClickOnSaveButton);
        } else {
            mobileActions.clickOnElement(clickOnSaveButton);
        }
    }

    public void clickOnUpdateButton() throws InterruptedException {
        mobileActions.clickHideKeyboard();
        mobileActions.clickOnElement(clickOnUpdateButton);
    }

    public void clickOnNoButtonInPopUp() {
        mobileActions.clickOnElement(popUpButtonNo);
    }

    public void clickOnEnrollButtonInPopUp() {
        mobileActions.clickOnElement(enrollButton);
    }

    public void clickOnBasketButtonFromHeader() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            mobileActions.clickOnElement(backToBasketInHeader);
        }
    }

    public void clickOnBasketButtonInHeader() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            mobileActions.clickOnElement(basketButtonInHeader);
        }
    }

    public void searchAndAssignCustomerUsingEmail(int index) throws IOException, ParseException {
        String email = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "email");
        emailAddress = email;
        System.out.println(emailAddress);
        mobileActions.enterText(customerEmailSearch, email);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(customerSearchButtoniPhone);
            generalUtility.waitForElementToBeVisible(assignCustomerFromSearch, 10);
        } else {
            mobileActions.clickOnElement(customerSearchButton);
           generalUtility.waitForElementToBeVisible(assignCustomerFromSearch, 10);
//            mobileActions.clickOnElement(searchResultButton);
        }
        mobileActions.clickOnElement(assignCustomerFromSearch);
    }

    public void searchCustomerUsingEmail(int index) throws IOException, ParseException {
        String email = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "email");
        mobileActions.enterText(customerEmailSearch, email);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(customerSearchButtoniPhone);
        } else {
            mobileActions.clickOnElement(customerSearchButton);
        }
    }

    public void searchCustomerUsingEmailAndPhoneNumber(int index) throws IOException, ParseException {
        String email = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "email");
        String phone = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "Phone");
        mobileActions.enterText(customerEmailSearch, email);
        mobileActions.enterText(customerPhoneSearch, phone);
        mobileActions.clickOnElement(customerSearchButton);
    }

    public void searchCustomerWithNewEmailAndPhone() {
        String phone = TestDataHelper.generatePhoneNumber();
        String email = faker.internet().emailAddress();
        mobileActions.enterText(customerEmailSearch, email);
        mobileActions.enterText(customerPhoneSearch, phone);
        mobileActions.clickOnElement(customerSearchButton);
    }


    public void clickOnCustomerSearchButton() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(customerSearchButtoniPhone);
        } else {
            mobileActions.clickOnElement(customerSearchButton);
        }
    }

    public void enterEmailInSearch(int index) throws IOException, ParseException {
        String email = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "email");
        mobileActions.clearAndEnterText(customerEmailSearch, email);
    }

    public void enterPhoneNumberInSearch(int index) throws IOException, ParseException {
        String phoneNumber = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "Phone");
//        String phoneNo = "+1" + phoneNumber;
        mobileActions.clearAndEnterText(customerPhoneSearch, phoneNumber);
    }

    public void validateCustomerDetails(int index) throws IOException, ParseException, InterruptedException {
        firstNameTestData = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "firstName");
        lastNameTestData = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "lastName");
        emailTestData = TestDataHelper.getCustomerDetail(properties.getProperty("BrandRegion"), index, "email");
        Thread.sleep(5000);
        String customerInformation = customerContactInformation.getAttribute("label") + existingCustomerName.getAttribute("label")  ;

        boolean containsFirstName = customerInformation.contains(firstNameTestData);
        boolean containsLastName = customerInformation.contains(lastNameTestData);
        boolean containsEmail = customerInformation.contains(emailTestData);

        assertTrue("First name not found in customer information", containsFirstName);
        assertTrue("Last name not found in customer information", containsLastName);
        assertTrue("Email not found in customer information", containsEmail);
    }

    public void validateNewCustomerDetails() {
        String customerInformation = customerContactInformation.getAttribute("label") + existingCustomerName.getAttribute("label")  ;
        boolean containsFirstName = customerInformation.contains(firstName);
        boolean containsLastName = customerInformation.contains(lastName);
        boolean containsEmail = customerInformation.contains(emailAddress);

        assertTrue("First name not found in customer information", containsFirstName);
        assertTrue("Last name not found in customer information", containsLastName);
        assertTrue("Email not found in customer information", containsEmail);
    }

    public void validateCustomerDetail(String detailType) {
        String customerInformation = customerContactInformation.getAttribute("label");  //+ existingCustomerName.getAttribute("label")  ;
        customerInformation = customerInformation.replaceAll("[()\\s-]", "");
        switch (detailType.toLowerCase()) {
            case "first name":
                assertTrue("First name not found in customer information", customerInformation.contains(firstName));
                break;
            case "last name":
                assertTrue("Last name not found in customer information", customerInformation.contains(lastName));
                break;
            case "email":
                assertTrue("Email not found in customer information", customerInformation.contains(emailAddress));
                break;
            case "phone number":
                assertTrue("phone number not found in customer information", customerInformation.contains(phoneNumber));
                break;
            case "zip code":
                assertTrue("zip code not found in customer information", customerInformation.contains(zipcode));
                break;
            default:
                throw new IllegalArgumentException("Invalid detail type: " + detailType);
        }
    }


    public void validateCustomerDetailWithoutName(String detailType) {
        String customerInformation = customerContactInformation.getAttribute("label")  ;
        customerInformation = customerInformation.replaceAll("[()\\s-]", "");
        switch (detailType.toLowerCase()) {
            case "email":
                assertTrue("Email not found in customer information", customerInformation.contains(emailAddress));
                break;
            case "phone number":
                assertTrue("phone number not found in customer information", customerInformation.contains(phoneNumber));
                break;
            case "zip code":
                assertTrue("zip code not found in customer information", customerInformation.contains(zipcode));
                break;
            default:
                throw new IllegalArgumentException("Invalid detail type: " + detailType);
        }
    }

    public void validateUpdatedCustomerDetails(String field) throws IOException, ParseException {
        String customerInformation = cleanCustomerInformation(customerContactInformation.getText() + existingCustomerName.getAttribute("label") );
        switch (field.toLowerCase()) {
            case "all":
                validateFirstName(customerInformation);
                validateLastName(customerInformation);
                validatePhoneNumber(customerInformation);
                validateZipCode(customerInformation);
                break;
            case "first name":
                validateFirstName(customerInformation);
                break;
            case "last name":
                validateLastName(customerInformation);
                break;
            case "phone number":
                validatePhoneNumber(customerInformation);
                break;
            case "zipcode":
                validateZipCode(customerInformation);
                break;
            default:
                throw new IllegalArgumentException("Invalid field: " + field);
        }
    }

    private String cleanCustomerInformation(String customerInformation) {
        System.out.println(customerInformation);
        return customerInformation.replace("(", "")
                .replace(")", "")
                .replace("-", "")
                .replace(" ", "");
    }

    private void validateFirstName(String customerInformation) {
        boolean containsFirstName = customerInformation.contains(updatedFirstName);
        assertTrue("First name not found in customer information", containsFirstName);
    }

    private void validateLastName(String customerInformation) {
        boolean containsLastName = customerInformation.contains(updatedLastName);
        assertTrue("Last name not found in customer information", containsLastName);
    }

    private void validatePhoneNumber(String customerInformation) {
        boolean containsPhone = customerInformation.contains(updatedPhoneNumber);
        assertTrue("Phone is not found in customer information", containsPhone);
    }

    private void validateZipCode(String customerInformation) {
        boolean containsZipCode = customerInformation.contains(updatedZipcode);
        assertTrue("Zip code is not found in customer information", containsZipCode);
    }

    public void validateZipCodeError(String error) {
        String errorMessage = generalUtility.getTextFromElement(zipCodeError);
        assertTrue("Expected error message not found: " + error, errorMessage.contains(error));
    }

    public void validateEmailError(String error) {
        String errorMessage = generalUtility.getTextFromElement(emailAddressError);
        assertTrue("Expected error message not found: " + error, errorMessage.contains(error));
    }

    public void validateFirstNameCodeError(String error) {
        String errorMessage = generalUtility.getTextFromElement(firstNameCodeError);
        assertTrue("Expected error message not found: " + error, errorMessage.contains(error));
    }

    public void validateLastNameCodeError(String error) {
        String errorMessage = generalUtility.getTextFromElement(lastNameCodeError);
        assertTrue("Expected error message not found: " + error, errorMessage.contains(error));
    }

    public void validatePhoneNumberError(String error) {
        String errorMessage = generalUtility.getTextFromElement(phoneNumberError);
        assertTrue("Expected error message not found: " + error, errorMessage.contains(error));
    }

    public void updateCustomerDetailInTestData(int index, String field) throws IOException, ParseException {
        switch (field.toLowerCase()) {
            case "all":
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "firstName", updatedFirstName);
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "lastName", updatedLastName);
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "Phone", updatedPhoneNumber);
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "zip", updatedZipcode);
                break;
            case "first name":
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "firstName", updatedFirstName);
                break;
            case "last name":
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "lastName", updatedLastName);
                break;
            case "phone":
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "Phone", updatedPhoneNumber);
                break;
            case "zip":
                testDataHelper.updateCustomerDetail(properties.getProperty("BrandRegion"), index, "zip", updatedZipcode);
                break;
            default:
                throw new IllegalArgumentException("Invalid field: " + field);
        }
    }

    public void navigateToSearchCustomer() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            //The coordinates for back button is 10 and 20
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        }
    }

    public void removeCustomerFromTransaction() throws InterruptedException {
        // The coordinates of remove customer button is 983 and 719
    mobileActions.clickHideKeyboard();
    mobileActions.clickOnElement(removeCustomer);
    }

    public void clickOnEditCustomer() {
        mobileActions.clickOnElement(editCustomerButton);
    }

    public void clickOnBackButtonFromSearchCustomer() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(basketButtonInSearchHeaderIPhone);
        } else {
            mobileActions.clickOnElement(backToBasketInHeader);
        }
        generalUtility.isElementEnabled(assignCustomer);
    }

    public void clickOnBackButtonFromSearchCustomerProfile() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(basketButtonInSearchHeaderIPhone);
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            mobileActions.clickOnElement(backToBasketInHeader);
        }
        generalUtility.isElementEnabled(assignCustomer);
    }

    public void clickOnBackButtonFromEditCustomer() {
        mobileActions.clickOnElement(editCustomerBackButton);
        mobileActions.clickOnElement(okButton);
    }

    public void validateIfEmailIsEnabled() {
        generalUtility.isElementDisplayed(emailAddressText);
        mobileActions.clickOnElement(emailAddressText);
        boolean isEmailEnabled = generalUtility.isElementEnabled(emailAddressText);
        assertTrue("Email address field should be enabled", isEmailEnabled);
    }

    public void assignCustomerOnTheReturnCustomerSearch() {
        if (properties.getProperty("DeviceName").equals("iPhone")) {
            mobileActions.clickOnElement(assignCustomerFromSearch);
        } else {
            mobileActions.clickOnElement(searchResultButton);
            mobileActions.clickOnElement(assignCustomerFromSearch);
        }
    }

    public boolean isSkipButtonDisplayed() {
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(3));
            wait.until(ExpectedConditions.visibilityOf(skipButton));
            return true;
        } catch (TimeoutException e) {
            return false;
        } finally {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

    public void clicksOnSearchResultBackButton() {
        mobileActions.clickOnElement(backButtonSearchResultsCustomer);
    }

    public void clickOnLoyaltyPointsDetails() {
        String brand = properties.getProperty("Brand");
        String device = properties.getProperty("DeviceName");
        if (Objects.equals(brand, "TBL")) {
            if (device.contains("iPhone")) {
                mobileActions.clickOnElement(iPhoneLoyaltyPointsFullDetails);
            } else {
                generalUtility.isElementEnabled(removeCustomer);
                mobileActions.clickOnElement(loyaltyPointsFullDetails);
            }
        } else {
            generalUtility.isElementDisplayed(removeCustomer);
            mobileActions.clickOnElement(loyaltyPointsFullDetailsTNF);
        }
    }

    public void getLoyaltyPoints() {
        String loyaltyPointsDetails;
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            loyaltyPointsDetails = iPhoneLoyaltyPoints.getText();
        } else {
            loyaltyPointsDetails = loyaltyPoints.getText();
        }
        Pattern pattern = Pattern.compile("Available points (\\d+)");
        Matcher matcher = pattern.matcher(loyaltyPointsDetails);
        if (matcher.find()) {
            String availableLoyaltyPointsWithoutThousandSeparator = matcher.group(1);
            System.out.println(availableLoyaltyPointsWithoutThousandSeparator);
            availableLoyaltyPointsAptos = availableLoyaltyPointsWithoutThousandSeparator;
            DecimalFormat decimalFormat = new DecimalFormat("#,###");
            availableLoyaltyPoints = decimalFormat.format(Integer.parseInt(availableLoyaltyPointsWithoutThousandSeparator));
            System.out.println(availableLoyaltyPoints);
        }
//        availableLoyaltyPoints = availableLoyaltyPoints.replace(",", "").trim();
    }

    public void clickOnAssignedCustomerButton() {
        mobileActions.clickOnElement(assignedCustomerButton);
    }

    public void navigateToCustomerProfileFromLoyaltyPage() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(iPhoneBackButtonLoyaltyPage);
            mobileActions.clickUsingCoordinates(driver, 10, 20);
        } else {
            mobileActions.clickOnElement(backButtonLoyaltyPage);
        }
    }

    public void navigateToBasketFromCustomerProfile() {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(iPhoneBackButtonFromCustomerProfile);
        } else {
//            mobileActions.clickOnElement(backButtonFromCustomerProfile);
            mobileActions.clickOnElement(basketButtonInHeader);
        }
    }

    public void clickOnLoyaltyButton() {
        mobileActions.clickOnElement(loyaltyButton);
    }

    public void loyaltyAttributeValidation(String value) {
        if (value.equals("Yes")) {
            String attributeContent = generalUtility.getTextFromElement(loyaltyEnabledLabel);
            Assert.assertTrue("Test failed: Privacy does not contains Attribute Value ", attributeContent.contains(value));
        } else if (value.equals("No")) {
            String attributeContent = generalUtility.getTextFromElement(loyaltyDisabledLabel);
            Assert.assertTrue("Test failed: Privacy does not contains Attribute Value ", attributeContent.contains(value));
        }
    }

    public void privacyAttributeValidation(String value) {
        if (value.equals("Yes")) {
            String attributeContent = generalUtility.getTextFromElement(privacyEnabledLabel);
            Assert.assertTrue("Test failed: Privacy does not contains Attribute Value ", attributeContent.contains(value));
        } else if (value.equals("No")) {
            String attributeContent = generalUtility.getTextFromElement(privacyDisabledLabel);
            Assert.assertTrue("Test failed: Privacy does not contains Attribute Value ", attributeContent.contains(value));
        }
    }

    public void newsLetterAttributeValidation(String value) {
        if (value.equals("Yes")) {
            String attributeContent = generalUtility.getTextFromElement(newsLetterEnabledLabel);
            Assert.assertTrue("Test failed: Privacy does not contains Attribute Value ", attributeContent.contains(value));
        } else if (value.equals("No")) {
            String attributeContent = generalUtility.getTextFromElement(newsLetterDisabledLabel);
            Assert.assertTrue("Test failed: Privacy does not contains Attribute Value ", attributeContent.contains(value));
        }
    }

    public void clickOnPrivacyButton() {
        mobileActions.clickOnElement(privacyButton);
    }

    public void clickOnNewsLetterButton() {
        mobileActions.clickOnElement(newsLetterButton);
    }

    public void searchRecentlyCreatedCustomer() {
        mobileActions.enterText(customerEmailSearch, emailAddress);
        mobileActions.clickOnElement(customerSearchButton);
    }

    public void noWayToDisableLoyalty() {
        boolean buttonStatus = generalUtility.isElementExists(By.xpath("//XCUIElementTypeSwitch[contains(@name,'LoyaltyTerms-switch')])"));
        System.out.println(buttonStatus);
        assertFalse("Test Failed: Loyalty Disabled option is present", buttonStatus);
    }

    public void validateLoyaltyType() {
        assertTrue("Test Failed: Loyalty Type isn't Full", generalUtility.getTextFromElement(loyaltyTypeLabel).contains("Full"));
    }

    public void saveCustomerDetails() {
        generalUtility.isElementEnabled(removeCustomer);
        String customerName = generalUtility.getTextFromElement(customerIdName);
        String customerNumber = generalUtility.getTextFromElement(customerIdNumber);

        // Define the regex pattern to extract dynamic values
//        String pattern = "(\\D+?)\\s+Customer number:\\s+(\\S+)";
//
//        // Compile the regex pattern
//        Pattern r = Pattern.compile(pattern);
//
//        // Create a matcher to find matches
//        Matcher m = r.matcher(customerData);
//
//        // Check if the pattern matches
//        if (m.find()) {
//            // Extract the dynamic parts using group()
//            customerFullName = m.group(1).trim();
//            customerNumber = m.group(2);
        customerFullName = customerName;
        CustomerPage.customerNumber = customerNumber;

            System.out.println("Customer Name = " +customerFullName);
            System.out.println("Customer Number = " +customerNumber);
//        } else {
//            System.out.println("No match found!");
//        }
    }

    public void clickOnXpPassTerms() {
        mobileActions.clickOnElement(passTerms);
    }

    public void validatePrivacyPolicyMessageIsDisplayed() {
        generalUtility.isElementDisplayed(privacyPolicyValidationMessage);
    }

    public void validateXplrMessageIsDisplayed() {
        generalUtility.isElementDisplayed(xplrTermsValidationMessage);
    }

    public void clickOnBackButtoniPhone() {
        mobileActions.clickOnElement(iPhoneBackButton);
    }

    public void searchCustomerWithNonExistEmail() {
        String email = faker.internet().emailAddress();
        mobileActions.enterText(customerEmailSearch, email);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(customerSearchButtoniPhone);
        } else {
            mobileActions.clickOnElement(customerSearchButton);
        }
    }

    public void searchCustomerWithNonExistPhoneNumber() {
        String phone = TestDataHelper.generatePhoneNumber();
        mobileActions.enterText(customerPhoneSearch, phone);
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            mobileActions.clickOnElement(customerSearchButtoniPhone);
        } else {
            mobileActions.clickOnElement(customerSearchButton);
        }
    }

    public void validateLoyaltyPointAfterRefund() {
        String loyaltyPointsDetails;
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            loyaltyPointsDetails = iPhoneLoyaltyPoints.getText();
        } else {
            loyaltyPointsDetails = loyaltyPoints.getText();
        }
        Pattern pattern = Pattern.compile("Available points (\\d+)");
        Matcher matcher = pattern.matcher(loyaltyPointsDetails);
        String availableLoyaltyPointsWithoutThousandSeparator = null;
        if (matcher.find()) {
            availableLoyaltyPointsWithoutThousandSeparator = matcher.group(1).replace(",","");
        }
        assertEquals(availableLoyaltyPointsAptos, availableLoyaltyPointsWithoutThousandSeparator);
    }

    public void assignCustomer(){
//        generalUtility.waitForElementToBeVisible(searchResultButton, 10);
//        mobileActions.clickOnElement(searchResultButton);
//        mobileActions.clickOnElement(assignCustomerFromSearch);
        mobileActions.clickOnElement(addCustomer);
    }

    public void clickOnCustomerSearchIcon(){
        mobileActions.clickOnElement(customerSearchIcon);
    }

    public void clickCustomerDataClearButton(){
        mobileActions.clickOnElement(customerDataClearButton);
    }

    public void clicksOnBackButtonFromEditCustomer() {    mobileActions.clickOnElement(editCustomerBackButton);}

}