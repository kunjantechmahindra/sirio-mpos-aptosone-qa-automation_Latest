@VFG10X-2191 @CashManagement @Regression
Feature: VFG10X-2191 Cash Management _ No Sale _ On and Above Security level

  Scenario: Cash Management _ No Sale _ On and Above Security level

  # Login and add item to basket
    Given the sales assistant logs in to the application with "above" security level
    When the sales assistant clicks on Start Basket button

  # No Sale Store Operations Above Security level
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "No sale" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant clicks on any reason code
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # No Sale Store Operations On Exact Security level
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "No sale" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant clicks on any reason code
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer
    And the sales assistant logout from the application