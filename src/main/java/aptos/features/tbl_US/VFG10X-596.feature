@VFG10X-596 @CashManagement @Regression @SmokeTesting
Feature: VFG10X-596 Cash Management _ No Sale _Reason Code Validation

  Scenario: Cash Management _ No Sale _Reason Code Validation

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #NO Sale Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "No sale" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Select reason code for no sale
    And the sales assistant validates the reason code list for no sale
    And the sales assistant clicks on any reason code
    And the sales assistant clicks on proceed button
    And the sales assistant logout from the application

