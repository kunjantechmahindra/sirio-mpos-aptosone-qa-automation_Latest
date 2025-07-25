@VFG10X-604 @CashManagement @Regression @TillOut
Feature: VFG10X-604 Cash Management _ Till OUT _Below Security level

  Scenario: Cash Management _ Till OUT _Below Security level

  #Login and add item to basket
    Given the sales assistant logs in to the application with "below" security level
    When the sales assistant clicks on Start Basket button

  #TILL OUT Store Operations below security level
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Till out" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant checks an error message is displayed
    And the sales assistant clicks on till operations back button for below security level
    And the sales assistant clicks on store operations back button
#    And the sales assistant navigate to basket page
    And the sales assistant navigate from store operation to basket page
    And the sales assistant logout from the application

