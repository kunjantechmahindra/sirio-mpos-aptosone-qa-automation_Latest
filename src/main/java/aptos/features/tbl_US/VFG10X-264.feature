@VFG10X-264 @PromotionsAndDiscounts @Regression

  Feature: VFG10X-264 Promotions and Discounts _ Employee Discount validation _ Employee A apply the discount for Employee A

    Scenario: Promotions and Discounts _ Employee Discount validation _ Employee A apply the discount for Employee A

      # Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 2 items from "General" product to the basket without customer

      #Add Employee discount
      And the sales assistant clicks on Employee Sale button from basket page
      And the sales assistant enter "sameEmployee" Employee ID
      And the sales assistant clicks on Apply button
      And the sales assistant validates the same employee error message
      And the sales assistant clicks on cancel button

    # Void transaction
      And the sales assistant void the transaction from basket with reason code "Cashier Error"
      And the sales assistant logout from the application