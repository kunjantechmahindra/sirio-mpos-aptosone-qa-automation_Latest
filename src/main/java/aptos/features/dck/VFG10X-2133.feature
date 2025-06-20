@VFG10X-2133 @StoreSelling @Regression
Feature: VFG10X-2133 Store Selling Functions_ Product Details Screen

  Scenario: Store Selling Functions_ Product Details Screen

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Search product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by UPC number from "General"
    And the sales assistant validates the Product description page
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button

  # Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application