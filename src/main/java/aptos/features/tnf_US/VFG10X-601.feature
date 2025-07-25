@VFG10X-601 @CashManagement @Regression
Feature: VFG10X-601 Cash Management _ Paid OUT _Below Security level

  Scenario: Cash Management _ Paid OUT _Below Security level

  #Login and add item to basket
    Given the sales assistant logs in to the application with "below" security level
    When the sales assistant clicks on Start Basket button

  #PAID OUT Store Operations below security level
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Paid out" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant checks an error message is displayed
    And the sales assistant clicks on back arrow button from paid out
    And the sales assistant clicks on store operations back button
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application

