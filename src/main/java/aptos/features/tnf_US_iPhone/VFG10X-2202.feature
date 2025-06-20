@VFG10X-2202 @Regression @PromotionsAndDiscounts
  Feature: VFG10X-2202 Promotions and Discounts _ Employee Discount validation with Terminated Employee ID

    Scenario: Promotions and Discounts _ Employee Discount validation with Terminated Employee ID

    # Login and add products
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "General" product to the basket without customer

    # Add Employee discount
      And the sales assistant clicks on menu button for iPhone basket
      And the sales assistant selects "Employee Sale" Option from basket page
      And the sales assistant enter "invalid" Employee ID
      And the sales assistant clicks on Apply button
      And the sales assistant validate invalid employee error message and navigate to basket

    # Void Transaction
      And the sales assistant clicks on menu button for iPhone basket
      And the sales assistant void the transaction from basket with reason code "Promo Error"
      And the sales assistant logout from the application