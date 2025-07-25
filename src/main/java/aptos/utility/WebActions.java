package aptos.utility;

import aptos.base.TestBase;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class WebActions extends TestBase {
    public void clickOnElement(WebElement element) {
        try {
            element.click();
        } catch (NoSuchElementException e) {
            handleException("clickOnElement", "Element not found", e);
        } catch (ElementNotInteractableException e) {
            handleException("clickOnElement", "Element is not interactable", e);
        } catch (StaleElementReferenceException e) {
            handleException("clickOnElement", "Element is no longer attached to the DOM", e);
        } catch (Exception e) {
            handleException("clickOnElement", "Unexpected error occurred", e);
        }
    }

    public void waitAndClickOnElement(WebElement element, int waitTimeInSeconds) {
        try {
            new WebDriverWait(browserDriver, Duration.ofSeconds(waitTimeInSeconds))
                    .until(ExpectedConditions.elementToBeClickable(element));
            element.click();
        } catch (TimeoutException e) {
            handleException("waitAndClickOnElement", "Element not clickable within the timeout", e);
        } catch (NoSuchElementException e) {
            handleException("waitAndClickOnElement", "Element not found", e);
        } catch (ElementNotInteractableException e) {
            handleException("waitAndClickOnElement", "Element is not interactable", e);
        } catch (Exception e) {
            handleException("waitAndClickOnElement", "Unexpected error occurred", e);
        }
    }

    public void clearAndEnterText(WebElement element, String text) {
        try {
            element.clear();
            element.sendKeys(text);
        } catch (NoSuchElementException e) {
            handleException("clearAndEnterText", "Element not found", e);
        } catch (ElementNotInteractableException e) {
            handleException("clearAndEnterText", "Element is not interactable", e);
        } catch (StaleElementReferenceException e) {
            handleException("clearAndEnterText", "Element is no longer attached to the DOM", e);
        } catch (Exception e) {
            handleException("clearAndEnterText", "Unexpected error occurred", e);
        }
    }

    public void enterText(WebElement element, String text) {
        try {
            element.sendKeys(text);
        } catch (NoSuchElementException e) {
            handleException("enterText", "Element not found", e);
        } catch (ElementNotInteractableException e) {
            handleException("enterText", "Element is not interactable", e);
        } catch (StaleElementReferenceException e) {
            handleException("enterText", "Element is no longer attached to the DOM", e);
        } catch (Exception e) {
            handleException("enterText", "Unexpected error occurred", e);
        }
    }

    public boolean isElementEnabled(WebElement element) {
        try {
            return element.isEnabled();
        } catch (NoSuchElementException e) {
            handleException("isElementEnabled", "Element not found", e);
            return false;
        } catch (Exception e) {
            handleException("isElementEnabled", "Unexpected error occurred", e);
            return false;
        }
    }

    public boolean isElementDisplayed(WebElement element) {
        try {
            return element.isDisplayed();
        } catch (NoSuchElementException e) {
            handleException("isElementDisplayed", "Element not found", e);
            return false;
        } catch (Exception e) {
            handleException("isElementDisplayed", "Unexpected error occurred", e);
            return false;
        }
    }

    /**
     * Helper method to handle exception logging and test failure.
     *
     * @param methodName The name of the method where the error occurred
     * @param message    Custom error message to be logged
     * @param e          The exception object
     */
    private void handleException(String methodName, String message, Exception e) {
        System.out.println(methodName + " failed: " + message + " | " + e.getMessage());
        Assert.fail("Test failed in method: " + methodName + " with message: " + message);
    }


}