@VFG10X-92 @StoreSelling @Regression @Card @GiftCard
Feature: VFG10X-92 Store Selling Functions_ Gift Card Top Up Functionality enabled

  Scenario: Store Selling Functions_ Gift Card Top Up Functionality enabled

  #Login and gift card top up functionality validation
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant clicks on gift card button
    And the sales assistant validates existing gift card button is enabled
    And the sales assistant enters gift card number from index 0
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on add value button
    And the sales assistant clicks on Skip button
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application

