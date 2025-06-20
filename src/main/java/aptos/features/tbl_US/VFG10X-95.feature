@VFG10X-95 @StoreSelling @Regression

Feature: VFG10X-95 Store Selling System _Validation of Suspend Functionality

  Scenario: Store Selling System _Validation of Suspend Functionality

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Suspend and Void Transaction
    And then sales assistant clicks on Suspend button
    And the sales assistant enter the reference ID
    And the sales assistant logout from the application

