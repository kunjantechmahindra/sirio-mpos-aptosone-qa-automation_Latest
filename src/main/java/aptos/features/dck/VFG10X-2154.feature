@VFG10X-2154 @StoreSelling @Regression
Feature: VFG10X-2154 DCK Store Selling Functions_Verify Temp Price with Perm price on Product Inquiry screen

  Scenario: DCK Store Selling Functions_Verify Temp Price with Perm price on Product Inquiry screen

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

 # Search TempMD product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    And the sales assistant add 1 items from "Temp-MD" product to the basket
    And the sales assistant save the original and temporary price
    And the sales assistant verify tempMd is displayed
    And the sales assistant clicks on back button from product inquiry details page
    And the sales assistant clicks on back button from product inquiry search page
    And the sales assistant lands on Basket Page
    And the sales assistant logout from the application



