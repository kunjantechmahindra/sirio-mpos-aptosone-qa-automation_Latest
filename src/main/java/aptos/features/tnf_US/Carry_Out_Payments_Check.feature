@Carry_Out_Payments_Check @Regression
Feature: Check whether all Cash, Cards, Membership Rewards and Gift Cards payment options are available for TBL and additional RCM payment tenders are available for TNF

  Scenario: Check whether all Cash, Cards, Membership Rewards and Gift Cards payment options are available for TBL and additional RCM payment tenders are available for TNF

  # Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant verifies all payment methods on carry_out payment screen
    And the sales assistant clicks on More button
    And the sales assistant verifies all payment methods on more screen

    #Void transaction
    And the sales assistant void the transaction from payment with reason code "Cashier Error"
    And the sales assistant logout from the application