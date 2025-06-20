@VFG10X-2266 @StoreSelling @Regression
Feature: VFG10X-2266 Store Selling Functions _ Product Enquiry _ Search and Add Zero Price Item to basket

  Scenario: Store Selling Functions _ Product Enquiry _ Search and Add Zero Price Item to basket

  #Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Search product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    Then the sales assistant add 1 items from "ZeroPrice" product to the basket
    And the sales assistant add item to the basket
    And the sales assistant clicks on Apply button
    And the sales assistant validates a popup message is displayed in zero price product page
    And the sales assistant navigate to basket page
    And the sales assistant lands on Basket Page
    And the sales assistant logout from the application