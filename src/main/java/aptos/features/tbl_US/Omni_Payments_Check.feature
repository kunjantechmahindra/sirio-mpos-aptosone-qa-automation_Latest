@Omni_Payments_Check @Omni @Regression
Feature: Check whether only Cards, Membership Rewards and Gift Cards payment options are available for TBL and additional RCM payment tenders are available for TNF
  Scenario: Check whether only Cards, Membership Rewards and Gift Cards payment options are available for TBL and additional RCM payment tenders are available for TNF

    # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Search product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    Then the sales assistant add 1 items from "OMNI" product by UPC Number
    And the sales assistant clicks on Skip button

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant enters Bill to Information on Delivery page
    And the sales assistant enters Delivery "Address" at index 1 for assigned customer
    And the sales assistant selects "Standard" Delivery option
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant verifies all payment methods on STH payment screen

    #Void transaction
    And the sales assistant void the transaction from payment with reason code "Cashier Error"
    And the sales assistant logout from the application
