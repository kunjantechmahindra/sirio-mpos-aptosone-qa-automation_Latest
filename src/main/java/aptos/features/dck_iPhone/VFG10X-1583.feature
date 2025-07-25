@VFG10X-1583 @ExchangeTransaction @Regression
Feature: VFG10X-1583 DCK - iPhone - Verify Product Inquiry by Scanning UPC

  Scenario: DCK - iPhone - Verify Product Inquiry by Scanning UPC

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Search product from Product Inquiry
      And the sales assistant navigate to product inquiry page
      And the sales assistant add 1 items from "General" product to the basket
      And the sales assistant add item to the basket
      And the sales assistant clicks on basket button
      And the sales assistant lands on Basket Page
      And the sales assistant confirms the UPC added to the basket

    # Void transaction
      And the sales assistant clicks on menu button for iPhone basket
      And the sales assistant void the transaction from basket
      And the sales assistant select the printer
      And the sales assistant logout from the application




