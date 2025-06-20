@VFG10X-597 @CashManagement @Regression
Feature: VFG10X-597 Cash Management _ No Sale _ Below Security level

  Scenario: Cash Management _ No Sale _ Below Security level

  #Login and add item to basket
    Given the sales assistant logs in to the application with "below" security level
    When the sales assistant clicks on Start Basket button

  #No Sale Store Operations Above security
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "No sale" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant checks an error message is displayed
    And the sales assistant clicks on back button from no sale
    And the sales assistant navigate from store operation to basket page
    And the sales assistant logout from the application

