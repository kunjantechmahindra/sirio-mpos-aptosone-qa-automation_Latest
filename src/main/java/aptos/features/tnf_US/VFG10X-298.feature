@VFG10X-298 @StoreSelling @Regression
Feature: VFG10X-298 Store Selling Functions _ Product Inquiry _ Search by Style Number

  Scenario: Store Selling Functions _ Product Inquiry _ Search by Style Number

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Add item from Product Inquiry
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by style number "0A4ODU"
    And the sales assistant select an item from the list
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant clicks on Skip button

    # Void transaction
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application