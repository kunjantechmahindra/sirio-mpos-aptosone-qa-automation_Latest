@VFG10X-2111 @StoreSelling @Regression
Feature: VFG10X-2111 Store Selling Functions _ Product Inquiry _ Search by Product Description

  Scenario: Store Selling Functions _ Product Inquiry _ Search by Product Description

# Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Add item from Product Inquiry(partial)
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by partial description "DISC"
    And the sales assistant select an item from the list
    And the sales assistant clicks on back button from product inquiry details page

    #Add product by entering full description
    And the sales assistant search product by entering full description "DISC CAMO DIAMOND QLTD JA"
    And the sales assistant select an item from the list
    And the sales assistant clicks on back button from product inquiry details page
    And the sales assistant clicks on back button from product inquiry search page
    And the sales assistant logout from the application
