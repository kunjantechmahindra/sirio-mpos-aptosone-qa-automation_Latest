@VFG10X-2062 @StoreSelling @Regression @Card @GiftCard
Feature: VFG10X-2062 Store Selling Functions_ Gift Card Top Up Functionality enabled

  Scenario: Store Selling Functions_ Gift Card Top Up Functionality enabled

  #Login and gift card top up functionality validation
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    And the sales assistant clicks on gift card button
    And the sales assistant validates existing gift card button is enabled
    And the sales assistant clicks on cancel button
    And the sales assistant logout from the application

