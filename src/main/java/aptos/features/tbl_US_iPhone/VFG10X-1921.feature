@VFG10X-1921 @PromotionsAndDiscounts @Regression
Feature: VFG10X-1921 Promotions and Discounts _ Employee Discount validation with Terminated Employee ID

  Scenario: Promotions and Discounts _ Employee Discount validation with Terminated Employee ID

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Apply employee discount
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "terminated" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant validates the invalid employee error message
    And the sales assistant navigate to basket page
    And sales assistant clicks on Ok button

    # Void transaction
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application