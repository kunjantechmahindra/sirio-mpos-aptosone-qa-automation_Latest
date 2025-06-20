@VFG10X-1780 @CashManagement @Regression

Feature: VFG10X-1780 Cash Management _ Till OUT

  Scenario: Cash Management _ Till OUT

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Till out" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on counted amount for till out
    And the sales assistant enters the quantity as 100 on first index
    And the sales assistant assign click on done
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button from variance in amount
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer
    And the sales assistant clicks on GO to basket button

  #Get transaction number from information
    And the sales assistant navigate to information page
    And the sales assistant save the transaction number from information page
    And the sales assistant navigate to basket page
    And the sales assistant logout from the application
  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate details "Till out" in EJ
    And the sales assistant logout from EJViewer