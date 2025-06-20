@VFG10X-1845 @SaleTransaction @Regression

Feature: VFG10X-1845 Store Selling Functions_ Non Merchandise Option
  Scenario: Store Selling Functions_ Non Merchandise Option

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Non Merch
    When the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Non-Merch button
    And the sales assistant select shipping
    And the sales assistant enter the shipping amount as 40
    And the sales assistant clicks on Apply button
    And the sales assistant clicks on Skip button
    And the sales assistant validate if "Shipping" is added to the basket at index 1
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

