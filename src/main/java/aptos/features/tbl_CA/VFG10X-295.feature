@VFG10X-295 @StoreSelling @Regression
Feature: VFG10X-295 Store Selling Functions _Order of Product Attributes display in Product details page

  Scenario: Store Selling Functions _Order of Product Attributes display in Product details page

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Search product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by UPC number from "General"

  # And the sales assistant validates the Product description page
    And the sales assistant verifies "Size" in Product description page
    And the sales assistant verifies "Color" in Product description page
    And the sales assistant verifies "Quantity" in Product description page
    And the sales assistant verifies "Season" in Product description page
    And the sales assistant clicks on basket button

  # Void transaction
    And the sales assistant logout from the application