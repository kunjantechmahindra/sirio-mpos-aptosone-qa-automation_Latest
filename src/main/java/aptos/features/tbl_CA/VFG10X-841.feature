@VFG10X-841 @CashManagement @Regression
Feature: VFG10X-841 Cash Management _Till to Safe & Safe to Till

  Scenario: Cash Management _Till to Safe & Safe to Till

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Till to safe Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Till to safe" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant enter the amount
    And the sales assistant enters the quantity as 100 on first index
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button


    #Safe to till Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Safe to till" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant enter the amount
    And the sales assistant enters the quantity as 100 on first index
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button
    And the sales assistant logout from the application

