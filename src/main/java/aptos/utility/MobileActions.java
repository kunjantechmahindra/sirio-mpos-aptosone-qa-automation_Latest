package aptos.utility;

import aptos.base.TestBase;
import io.appium.java_client.AppiumDriver;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Pause;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.time.Duration;
import java.util.Collections;
import java.util.concurrent.Delayed;

public class MobileActions extends TestBase {

    /**
     * To Click on an Element
     *
     * @param element Element to be clicked
     */
    public void clickOnElement(WebElement element) {
        try {
            element.click();
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage() + "..Element is" + element);
            Assert.fail("Test failed: Element not found." + "..Element is" + element);
        } catch (ElementClickInterceptedException e) {
            System.out.println("Element was not clickable: " + e.getMessage() + "..Element is" + element);
            Assert.fail("Test failed: Element not clickable." + "...Element is" + element);
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage() + "..Element is" + element);
            Assert.fail("Test failed: Stale element reference." + "...Element is" + element);
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage() + "..Element is" + element);
            Assert.fail("Test failed: Unexpected error." + "..Element is" + element);
        }
    }

    /**
     * To identify the element with name and click on it
     *
     * @param name of the element
     */
    public void clickOnElementByName(String name) {
        String xpath = String.format("//*[@name='%s']", name);
        WebElement element = driver.findElement(By.xpath(xpath));
        clickOnElement(element);
    }

    /**
     * To Click on an Element after waiting for some time
     *
     * @param element Element to be clicked
     */
    public void waitAndClickOnElement(WebElement element, int waitTimeInSeconds) {
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(waitTimeInSeconds));
            wait.until(ExpectedConditions.elementToBeClickable(element));
            element.click();
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage());
            Assert.fail("Test failed: Element not found.");
        } catch (ElementClickInterceptedException e) {
            System.out.println("Element was not clickable: " + e.getMessage());
            Assert.fail("Test failed: Element not clickable.");
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage());
            Assert.fail("Test failed: Stale element reference.");
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
            Assert.fail("Test failed: Unexpected error.");
        }
    }

    /**
     * @param driver Name of the driver
     * @param x      x Coordinate
     * @param y      y Coordinate
     */
    public void clickUsingCoordinates(AppiumDriver driver, int x, int y) throws InterruptedException {
        Thread.sleep(2000);
        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence sequence = new Sequence(finger, 1)
                .addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), x, y))
                .addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()))
                .addAction(new Pause(finger, Duration.ofMillis(150)))
                .addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(Collections.singletonList(sequence));
        System.out.println("Tap with Coordinates");
    }

    /**
     * To Clear the text and Enter the value in a field.
     *
     * @param element Element to be clicked
     * @param text    Text to be entered
     */
    public void clearAndEnterText(WebElement element, String text) {
        try {
            element.clear();
            element.sendKeys(text);
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage());
            Assert.fail("Test failed: Element not found.");
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage());
            Assert.fail("Test failed: Stale element reference.");
        } catch (ElementNotInteractableException e) {
            System.out.println("Element is not interactable: " + e.getMessage());
            Assert.fail("Test failed: Element not interactable.");
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
            Assert.fail("Test failed: Unexpected error.");
        }
    }

    /**
     * To Enter the text in a Field
     *
     * @param element Element to be clicked
     * @param text    Text to be entered
     */
    public void enterText(WebElement element, String text) {
        try {
            element.sendKeys(text); // Enter text without clearing
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage());
            Assert.fail("Test failed: Element not found.");
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage());
            Assert.fail("Test failed: Stale element reference.");
        } catch (ElementNotInteractableException e) {
            System.out.println("Element is not interactable: " + e.getMessage());
            Assert.fail("Test failed: Element not interactable.");
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
            Assert.fail("Test failed: Unexpected error.");
        }
    }

    /**
     * Click on the Hide Keyboard button.
     */
    public void clickHideKeyboard() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPad")) {
            try {
                WebElement element = driver.findElement(By.xpath("//XCUIElementTypeButton[@name='Hide keyboard']"));
                clickOnElement(element);
            } catch (NoSuchElementException e) {
                System.out.println("Hide keyboard button not found: " + e.getMessage());
                Assert.fail("Test failed: Hide keyboard button not found.");
            } catch (StaleElementReferenceException e) {
                System.out.println("Hide keyboard button is no longer attached to the DOM: " + e.getMessage());
                Assert.fail("Test failed: Stale element reference.");
            } catch (ElementNotInteractableException e) {
                System.out.println("Hide keyboard button is not interactable: " + e.getMessage());
                Assert.fail("Test failed: Hide keyboard button not interactable.");
            } catch (Exception e) {
                System.out.println("An unexpected error occurred: " + e.getMessage());
                Assert.fail("Test failed: Unexpected error.");
            }
        } else {
            clickUsingCoordinates(driver, 185, 25);
        }
    }

    public void iPhoneHideKeyboard() throws InterruptedException {
        if (properties.getProperty("DeviceName").contains("iPhone")) {
            System.out.println("device is iphone");
            clickUsingCoordinates(driver, 185, 25);
        }
    }

}
