@VFG10X-1778 @StoreSelling @Regression

  Feature: VFG10X-1778 Store Selling Functions _ Product Enquiry _ Search by manually entering the UPC of different types of items

    Scenario: Store Selling Functions _ Product Enquiry _ Search by manually entering the UPC of different types of items

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

  # Add Temp MD product to basket
      And the sales assistant navigate to product inquiry page
      And the sales assistant add 1 items from "Temp-MD" product to the basket
      And the sales assistant add item to the basket
      And the sales assistant clicks on basket button
      And the sales assistant lands on Basket Page
      And the sales assistant confirms the UPC added to the basket

  # Add Zero Price product to basket
      And the sales assistant navigate to product inquiry page
      And the sales assistant add 1 items from "ZeroPrice" product to the basket
      And the sales assistant add item to the basket
      And the sales assistant validate price entry prompt is displayed
      And the sales assistant edit price as 25
      And the sales assistant clicks on Apply button
      And the sales assistant clicks on basket button
      And the sales assistant lands on Basket Page
      And the sales assistant confirms the UPC added to the basket

  # Void transaction
      And the sales assistant void the transaction from basket
      And the sales assistant select the printer
      And the sales assistant logout from the application