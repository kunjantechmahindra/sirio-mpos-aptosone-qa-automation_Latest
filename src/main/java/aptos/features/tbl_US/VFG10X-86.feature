@VFG10X-86 @StoreSelling @Regression @Smoke @SmokeTesting
Feature: VFG10X-86 Store Selling Functions_ Bag Fee Screen Validations

  Scenario: Store Selling Functions_ Bag Fee Screen Validations

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #validate gift card as tender button enabled
    And the sales assistant clicks on Pay button
    And the sales assistant validate if Bag Fee page is displayed
    And the sales assistant clicks on cancel button from bag fee page
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application


