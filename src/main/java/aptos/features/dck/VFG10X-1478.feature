@VFG10X-1478 @CashManagement @Regression @SmokeDCK

Feature: VFG10X-1478 DCK - Cash Management_Till Audit_No Reason code for Dickies

  Scenario: DCK - Cash Management_Till Audit_No Reason code for Dickies

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Safe to till Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Till audit" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant enters the amount for Till Audit
    And the sales assistant assign click on done
    And the sales assistant clicks on proceed button
    And the sales assistant clicks on proceed button
    And the sales assistant select the printer
    And the sales assistant logout from the application