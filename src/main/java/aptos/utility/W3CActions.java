package aptos.utility;

import aptos.base.TestBase;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Pause;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;


import java.time.Duration;
import java.util.Arrays;
import java.util.List;

public class W3CActions extends TestBase {

    /**
     * Performs a vertical scroll/swipe action on the iOS iPad screen.
     */
    public void scroll() {
        int startX = driver.manage().window().getSize().getWidth() / 2;
        int startY = driver.manage().window().getSize().getHeight() / 2;

        int endY = (int) (driver.manage().window().getSize().getHeight() * 0.2);

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence scroll = new Sequence(finger, 0);

        scroll.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        scroll.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        scroll.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), startX, endY));
        scroll.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        driver.perform(List.of(scroll));
    }

    /**
     * Perform action to draw a line
     *
     * @param element Element on which we need to draw the line
     */
    public void fetchCoordinatesAndDrawLine(WebElement element) {
        int startX = element.getLocation().getX() + (element.getSize().getWidth() / 4); // Start at 25% of the width
        int startY = element.getLocation().getY() + (element.getSize().getHeight() / 4); // Start at 25% of the height

        int endX = element.getLocation().getX() + (3 * element.getSize().getWidth() / 4); // End at 75% of the width
        int endY = element.getLocation().getY() + (3 * element.getSize().getHeight() / 4); // End at 75% of the height

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence draw = new Sequence(finger, 0);

        draw.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        draw.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        draw.addAction(finger.createPointerMove(Duration.ofMillis(200), PointerInput.Origin.viewport(), endX, endY)); // Adjust duration as needed
        draw.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        driver.perform(List.of(draw));
    }

    public void tapOnElement(AppiumDriver driver, WebElement element) {
        // Get the location of the element
        Point point = element.getLocation();
        int x = point.getX() + element.getSize().getWidth() / 2; // Center X
        int y = point.getY() + element.getSize().getHeight() / 2; // Center Y

        // Create PointerInput and Sequence
        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence tapSeq = new Sequence(finger, 1);

        // Add actions to the sequence
        tapSeq.addAction(finger.createPointerMove(Duration.ofMillis(0), PointerInput.Origin.viewport(), x, y));
        tapSeq.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        tapSeq.addAction(finger.createPointerMove(Duration.ofMillis(50), PointerInput.Origin.viewport(), x, y));
        tapSeq.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        // Perform the action
        driver.perform(Arrays.asList(tapSeq));
    }

    public void scrollUp() {
        int screenWidth = driver.manage().window().getSize().getWidth();  // Get screen width
        int screenHeight = driver.manage().window().getSize().getHeight(); // Get screen height
        int startX = screenWidth / 2;  // Horizontal center of the screen
        int startY = screenHeight / 2; // Vertical center of the screen
        int endY = (int) (screenHeight * 1.0);  // Scroll to 50% of the screen height

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");  // PointerInput object to simulate the touch gesture
        Sequence scroll = new Sequence(finger, 0);

        scroll.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        scroll.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        scroll.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), startX, endY));
        scroll.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(List.of(scroll));
    }

    public void scrollUpWithPercentage(int percentage) {
        int screenWidth = driver.manage().window().getSize().getWidth();  // Get screen width
        int screenHeight = driver.manage().window().getSize().getHeight(); // Get screen height
        int startX = screenWidth / 2;  // Horizontal center of the screen
        int startY = screenHeight / 2; // Vertical center of the screen
        int endY = startY + (int) (startY * (percentage / 100.0));  // Scroll by the given percentage
        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");  // PointerInput object to simulate the touch gesture
        Sequence scroll = new Sequence(finger, 0);

        scroll.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        scroll.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        scroll.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), startX, endY));
        scroll.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(List.of(scroll));
    }


    public void scrollDown() {
        int screenWidth = driver.manage().window().getSize().getWidth();  // Get screen width
        int screenHeight = driver.manage().window().getSize().getHeight(); // Get screen height
        int startX = screenWidth / 2;  // Horizontal center of the screen
        int startY = screenHeight; // Vertical height of the screen
        int endY = (int) (screenHeight * 0.1);  // Scroll down the screen

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");  // PointerInput object to simulate the touch gesture
        Sequence scroll = new Sequence(finger, 0);

        scroll.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        scroll.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        scroll.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), startX, endY));
        scroll.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(List.of(scroll));
    }

    public void scrollDownWithPercentage(double percentage) {
        // Ensure percentage is between 0 and 100 to avoid invalid scroll distances
        if (percentage < 0 || percentage > 100) {
            throw new IllegalArgumentException("Percentage must be between 0 and 100.");
        }

        // Get screen width and height
        int screenWidth = driver.manage().window().getSize().getWidth();  // Get screen width
        int screenHeight = driver.manage().window().getSize().getHeight(); // Get screen height

        // Calculate starting point (center of the screen)
        int startX = screenWidth / 2;  // Horizontal center of the screen
        int startY = screenHeight; // Bottom of the screen (start from here)

        // Calculate the end Y position based on the given percentage
        int endY = (int) (screenHeight * (percentage / 100.0));  // Scroll by the given percentage

        // Create the PointerInput object for the touch gesture
        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence scroll = new Sequence(finger, 0);

        // Add the actions for the scroll gesture
        scroll.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        scroll.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        scroll.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), startX, endY));
        scroll.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        // Perform the action
        driver.perform(List.of(scroll));
    }

    public void scrollHamburgerMenu() {
        int screenWidth = 320;
        int screenHeight = 790;
        int startX = screenWidth / 2;  // Horizontal center of the screen
        int startY = screenHeight; // Vertical height of the screen
        int endY = (int) (screenHeight * 0.1);  // Scroll down the screen

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");  // PointerInput object to simulate the touch gesture
        Sequence scroll = new Sequence(finger, 0);

        scroll.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        scroll.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        scroll.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), startX, endY));
        scroll.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(List.of(scroll));
    }
}