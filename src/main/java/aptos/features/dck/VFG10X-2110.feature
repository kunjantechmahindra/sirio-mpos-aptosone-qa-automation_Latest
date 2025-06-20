@VFG10X-2110 @StoreSelling @Regression
Feature: VFG10X-2110 Store Selling Functions _ Product Inquiry _ Search by Style Number

  Scenario: Store Selling Functions _ Product Inquiry _ Search by Style Number

# Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Add item from Product Inquiry
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by style number "011"
    And the sales assistant select an item from the list
    And the sales assistant validates the product details in product inquiry page
    And the sales assistant clicks on back button from product inquiry details page
    And the sales assistant clicks on back button from product inquiry search page
    And the sales assistant logout from the application
