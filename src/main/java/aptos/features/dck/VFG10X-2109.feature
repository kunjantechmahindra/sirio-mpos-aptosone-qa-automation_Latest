@VFG10X-2109 @StoreSelling @Regression

  Feature: VFG10X-2109 Store Selling Functions _Order of Product Attributes display in Product details page

    Scenario: Store Selling Functions _Order of Product Attributes display in Product details page

  # Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

  # Search product from Product Inquiry by entering the UPCA data
      And the sales assistant navigate to product inquiry page
      And the sales assistant add 1 items from "General" product to the basket
      And the sales assistant validate the Product details in the Product Inquiry Page
      And the sales assistant lands on Basket Page

  # Search product from Product Inquiry by entering the UPCA data
      And the sales assistant navigate to product inquiry page
      And the sales assistant search product by UPC number from "General"
      And the sales assistant validate the Product details in the Product Inquiry Page
      And the sales assistant lands on Basket Page

  # Add item from Product Inquiry
      And the sales assistant navigate to product inquiry page
      And the sales assistant search product by style number "011"
      And the sales assistant select an item from the list
      And the sales assistant validate the Product details in the Product Inquiry Page
      And the sales assistant lands on Basket Page

  # Void transaction
      And the sales assistant logout from the application