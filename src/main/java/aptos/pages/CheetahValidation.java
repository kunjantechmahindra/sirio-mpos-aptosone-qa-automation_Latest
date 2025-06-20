package aptos.pages;

import aptos.base.TestBase;
import aptos.utility.GeneralUtility;
import aptos.utility.MobileActions;
import io.cucumber.java.it.Ma;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static aptos.pages.BasketPage.*;
import static aptos.pages.CustomerPage.*;
import static aptos.stepDefinition.BasketPageStepDefinition.ProductCode;
import static aptos.stepDefinition.PaymentPageStepDefinition.*;
import static aptos.stepDefinition.PaymentPageStepDefinition.totalPaymentSale;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class CheetahValidation extends TestBase {


    // Initializing the Page Objects
    public CheetahValidation() {
        PageFactory.initElements(macDriver, this);
    }

    @FindBy(xpath = "//div//input[@name = 'admin[email]']")
    WebElement emailInputField;


    //Actions
    public void logIntoCheetah(String userName, String passWord) {
        macDriver.findElement(By.xpath("//div//input[@name = 'admin[email]']")).sendKeys(userName);
        macDriver.findElement(By.xpath("//div//button[@id = 'redirect_sign_in']")).click();
        macDriver.findElement(By.xpath("//div//input[@name = 'admin[password]']")).sendKeys(passWord);
        macDriver.findElement(By.xpath("//div//input[@name='commit' and @value='Login']")).click();
    }

    public void searchCustomer() {
        macDriver.findElement(By.xpath("//div//input[@class ='form-control search-query' and contains(@name ,'search')]")).sendKeys(emailAddress);
        macDriver.findElement(By.xpath("//button//span[@class='glyphicon glyphicon-search']")).click();
    }

    public void validateCustomerDetails() throws InterruptedException {
        Thread.sleep(3000);
        WebDriverWait wait = new WebDriverWait(macDriver, Duration.ofSeconds(10));
        WebElement customerTable = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("people")));
        String customerDetails = customerTable.getText();
        System.out.println(customerDetails);
        //Validate customer name and customer number
        Assert.assertTrue("Test Failed: Invalid Customer Name", customerDetails.contains(customerFullName));
        Assert.assertTrue("Test Failed: Invalid Customer Number", customerDetails.contains(customerNumber));
    }

    public void validateCustomerLoyaltyPoints() {
        macDriver.findElement(By.xpath("//*[@id='people']//span//a")).click();
        WebDriverWait wait = new WebDriverWait(macDriver, Duration.ofSeconds(10));
        WebElement currentPoints = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div//h2[contains(@id, 'balance')]")));
        String points = currentPoints.getText();
        System.out.println("points from cheetah " +points);
        System.out.println("points from aptos " +availableLoyaltyPoints );
        Assert.assertTrue("Test Failed: Incorrect Loyalty Point", points.contains(availableLoyaltyPoints));


    }
}
