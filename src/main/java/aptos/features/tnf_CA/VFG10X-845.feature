@VFG10X-845 @CashManagement @Regression
Feature: VFG10X-845 Cash Management _Safe To Till_Extra Fund

  Scenario: Cash Management _Safe To Till_Extra Fund

  # Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Safe to till Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Safe to till" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant enter the amount
    And the sales assistant enters the quantity as 100 on first index
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer

  # Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Safe to till" in EJ
    And the sales assistant logout from EJViewer