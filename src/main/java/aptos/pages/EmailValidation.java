package aptos.pages;

import aptos.base.TestBase;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.sql.SQLOutput;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static aptos.pages.BasketPage.*;
import static aptos.stepDefinition.BasketPageStepDefinition.ProductCode;
import static aptos.stepDefinition.PaymentPageStepDefinition.*;
import static aptos.stepDefinition.ProductInquiryPageStepDefinition.itemUPC;

public class EmailValidation extends TestBase {

    public static String emailContent;
    public static String returnBarcodeNumber;

    // Initializing the Page Objects
    public EmailValidation() {
        PageFactory.initElements(macDriver, this);
    }

    //Actions
    public void clickOnLoginButton() {
        System.out.println("check");
        macDriver.findElement(By.xpath("//button[@title='Check Inbox @yopmail.com']")).click();
    }

    public void enterEmailId(String email) {
        macDriver.findElement(By.xpath("//input[@name='login']")).sendKeys(email);
    }

    public void getEmailData() throws InterruptedException {
        WebDriverWait wait = new WebDriverWait(macDriver, Duration.ofSeconds(15));
        Thread.sleep(3000);
        WebElement iframe = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("ifmail")));
        macDriver.switchTo().frame(iframe);
        WebElement mailElement = macDriver.findElement(By.xpath("//*[@id='mail']"));
        emailContent = mailElement.getText();
        System.out.println("Email Content: \n" + emailContent);
    }

    // get the count of img tag in the line item description.
    public void getNoOfImagesInItemDescription() {
        WebElement mailContent = macDriver.findElement(By.xpath("//table//tbody//tr//td//table//tbody//tr[3]//td//table"));
        //If the count equals to zero then the line item description does not contain image
        List<WebElement> images = mailContent.findElements(By.tagName("img"));
        int listSize = images.size();
        Assert.assertTrue("line item contains image", listSize == 0);
    }

    public void validatePaymentDetail() {
        Assert.assertTrue("Details from aptos totalPaymentSale '" + totalPaymentSale + "' does not exist.", emailContent.contains(totalPaymentSale));
        Assert.assertTrue("Details from aptos taxAmountSale '" + taxAmountSale + "' does not exist.", emailContent.contains(taxAmountSale));
        Assert.assertTrue("Details from aptos saleTransactionID'" + saleTransactionID + "' does not exist.", emailContent.contains(saleTransactionID));
        if(discountAmountSale=="0.00") {
            Assert.assertTrue("Details from aptos discountAmountSale'" + discountAmountSale + "' does not exist.", emailContent.contains(discountAmountSale));
        }
    }

    public void validateTransactionIdInEreceipt() {
        Assert.assertTrue("Details from aptos '" + saleTransactionID + "' does not exist.", emailContent.contains(saleTransactionID));
    }


    public void getReturnBarcode() {
        Pattern pattern = Pattern.compile("\\d{16,}");  // Match 16 or more digits
        Matcher matcher = pattern.matcher(emailContent);
        if (matcher.find()) {
            returnBarcodeNumber = matcher.group();
            System.out.println("Return Barcode Number: " + returnBarcodeNumber);
        } else {
            System.out.println("No matching number found.");
        }
    }

    public void validateContents(String content) {
        Assert.assertTrue("Details from aptos '" + content + "' does not exist.", emailContent.contains(content));
    }

    public void validatesDifferentLineItemDisplayForSameItem() {
        int count = countOccurrences(emailContent, itemUPC);
        Assert.assertTrue("UPCs are not displayed in different line items", (count == 2));
    }

    // Helper method to count occurrences of a word in a string
    public static int countOccurrences(String text, String word) {
        int count = 0;
        int index = 0;
        while ((index = text.indexOf(word, index)) != -1) {
            count++;
            index += word.length();
        }
        return count;
    }

    public void validateEReceiptHeader() {
        Assert.assertTrue("E-receipt don't have transaction number", emailContent.contains("Trans #:"));
        Assert.assertTrue("E-receipt don't have date", emailContent.contains("Date:"));
        Assert.assertTrue("E-receipt don't have store", emailContent.contains("Store #:"));
        Assert.assertTrue("E-receipt don't have associate", emailContent.contains("Associate:"));
        Assert.assertTrue("E-receipt don't have device no", emailContent.contains("Device:"));
    }

    public void validateEReceiptFooterLastDayOfReturn() {
        Assert.assertTrue("E-receipt don't have last day of return", emailContent.contains("Last Day for Return is:"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        System.out.println("formatter: "+ formatter);
        // Parse the extracted date string into a LocalDate object
        LocalDate inputDate = LocalDate.parse(extractedDate, formatter);
        // Add 30 days to the input date
        LocalDate dateAfter30Days = inputDate.plusDays(30);
        //Convert to string
        String lastDayOfReturn = dateAfter30Days.format(formatter);
        System.out.println("Last Day for Return: "+lastDayOfReturn);
        Assert.assertTrue("Last day of return date mismatch", emailContent.contains(lastDayOfReturn));
    }

    public void validateEReceiptAddress() {
        Assert.assertTrue("E-receipt don't have address details", emailContent.contains(storeAddress.toUpperCase()));

    }

    public void validateUPCInReceipt() {
        if (properties.getProperty("Brand").equals("DCK")) {
            Assert.assertTrue("UPC " + itemUPC + " does not printed in the Receipt", emailContent.contains(itemUPC));
        } else
            ProductCode = itemUPC;
        System.out.println("ProductCode: "+ ProductCode);
            Assert.assertTrue("UPC " + ProductCode + " does not printed in the Receipt", emailContent.contains(ProductCode));

    }

}



