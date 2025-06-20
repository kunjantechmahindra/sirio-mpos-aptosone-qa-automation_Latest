package aptos.utility;

import aptos.base.TestBase;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.Point;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.time.Duration;

public class GeneralUtility extends TestBase {


    /**
     * To check if element is enabled to not
     *
     * @param element Element that needs to be verified for its enabled status.
     * @return True or false
     */
    public boolean isElementEnabled(WebElement element) {
        try {
            return element.isEnabled(); // Check if the element is enabled
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage());
            Assert.fail("Test failed: Element not found.");
            return false;
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage());
            Assert.fail("Test failed: Stale element reference.");
            return false;
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
            Assert.fail("Test failed: Unexpected error.");
            return false;
        }
    }

    /**
     * To check if an element is displayed.
     *
     * @param element Element that needs to be verified for its displayed status.
     * @return True if the element is displayed, false otherwise.
     */
    public boolean isElementDisplayed(WebElement element) {
        try {
            return element.isDisplayed(); // Check if the element is displayed
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage());
            Assert.fail("Test failed: Element not found.");
            return false; // Element not found, return false
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage());
            Assert.fail("Test failed: Stale element reference.");
            return false; // Stale reference, return false
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
            Assert.fail("Test failed: Unexpected error.");
            return false; // Unexpected error, return false
        }
    }


    /**
     * Validates if string a exists in string b.
     *
     * @param stringA The string to check for existence.
     * @param stringB The string in which to check for existence.
     * @return true if string A exists in string B, false otherwise.
     */
    public boolean doesStringExist(String stringA, String stringB) {
        if (stringA == null || stringB == null) {
            return false; // Handle null cases
        }
        return stringB.contains(stringA);
    }


    /**
     * get coordinate of an element
     */
    public void getElementCoordinates(WebElement element) {
        Point location = element.getLocation();
        int x = location.getX();
        int y = location.getY();

        System.out.println("Element coordinates: X = " + x + ", Y = " + y);
    }

    /**
     * @param element Element for which color need to be captured
     * @return
     * @throws IOException
     */
    public String getElementColorName(WebElement element) throws IOException {
        // Capture the screenshot
        File screenshot = driver.getScreenshotAs(OutputType.FILE);

        // Read the screenshot
        BufferedImage img = ImageIO.read(screenshot);

        // Get the element's location and size
        int x = element.getLocation().getX();
        int y = element.getLocation().getY();
        int width = element.getSize().getWidth();
        int height = element.getSize().getHeight();

        // Optionally, you can average the color of the element's area
        int totalRed = 0, totalGreen = 0, totalBlue = 0;
        int count = 0;

        // Loop through the element's area
        for (int i = x; i < x + width; i++) {
            for (int j = y; j < y + height; j++) {
                int pixel = img.getRGB(i, j);
                totalRed += (pixel >> 16) & 0xff;
                totalGreen += (pixel >> 8) & 0xff;
                totalBlue += pixel & 0xff;
                count++;
            }
        }
        int avgRed = totalRed / count;
        int avgGreen = totalGreen / count;
        int avgBlue = totalBlue / count;

        return getColorName(new Color(avgRed, avgGreen, avgBlue));
    }

    private String getColorName(Color color) {
        int r = color.getRed();
        int g = color.getGreen();
        int b = color.getBlue();

        // Simple rules for color approximation
        if (r > 190 && r <= 200 && g < 50 && b < 50){
            return "Red";
        } else if (r > 200 && g > 100 && b < 50) {
            return "Orange";
        } else if (r > 200 && g > 200 && b < 50) {
            return "Yellow";
        } else if (g > 200 && r < 50 && b < 50) {
            return "Green";
        } else if (b > 100 && r < 50 && g < 50) {
            return "Blue";
        } else if (r < 50 && g < 50 && b < 50) {
            return "Black";
        } else if (r > 200 && g > 200 && b > 200) {
            return "White";
        } else if (r > 100 && g > 100 && b < 50) {
            return "Brown";
    }

        // Fallback for unrecognized colors
        return "Custom Color (" + r + ", " + g + ", " + b + ")";
    }

    /**
     * To Get Text from an Element
     *
     * @param element Element to get text from
     * @return The text of the element
     */
    public String getTextFromElement(WebElement element) {
        String text = "";
        try {
            text = element.getText();
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage());
            Assert.fail("Test failed: Element not found.");
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage());
            Assert.fail("Test failed: Stale element reference.");
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
            Assert.fail("Test failed: Unexpected error.");
        }
        return text;
    }

    /**
     * @param element           Element to be visible
     * @param waitTimeInSeconds Wait time required.
     */
    public void waitForElementToBeVisible(WebElement element, int waitTimeInSeconds) {
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(waitTimeInSeconds));
            wait.until(ExpectedConditions.visibilityOf(element));
        } catch (NoSuchElementException e) {
            System.out.println("Element not found: " + e.getMessage());
            Assert.fail("Test failed: Element not found.");
        } catch (TimeoutException e) {
            System.out.println("Element was not visible within the wait time: " + e.getMessage());
            Assert.fail("Test failed: Element not visible within the wait time.");
        } catch (StaleElementReferenceException e) {
            System.out.println("Element is no longer attached to the DOM: " + e.getMessage());
            Assert.fail("Test failed: Stale element reference.");
        } catch (Exception e) {
            System.out.println("An unexpected error occurred: " + e.getMessage());
            Assert.fail("Test failed: Unexpected error.");
        }
    }

    // Method to check if an element exists
    public boolean isElementExists(By locator) {
        try {
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(8));
            driver.findElement(locator);
            return true;
        } catch (NoSuchElementException e) {
            return false;
        } finally {
            // Restore the original implicit wait timeout from properties
            driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(Long.parseLong(properties.getProperty("OriginalImplicitWait"))));
        }
    }

}
