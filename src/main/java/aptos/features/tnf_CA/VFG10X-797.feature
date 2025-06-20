@VFG10X-797 @CashManagement @Regression
Feature: VFG10X-797 Cash Management _PAID IN_ Reason Code - Postage for TBL and Fill the Fridge for TNF.

  Scenario: Cash Management _PAID IN_ Reason Code - Postage for TBL and Fill the Fridge for TNF.

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #PAID IN Store Operations
    And the sales assistant navigate to store operations page
    And the sales assistant clicks on "Till operations" for cash management
    And the sales assistant clicks on "Paid in" for cash management
    And the sales assistant enter the Drawer ID
    And the sales assistant assign enter the amount 50
    And the sales assistant clicks on Select a reason code for cash management
    And the sales assistant selects "Fill the Fridge" as reason code
    And the sales assistant clicks on proceed button
    And the sales assistant sign for the transaction
    And the sales assistant select the printer
    And the sales assistant logout from the application