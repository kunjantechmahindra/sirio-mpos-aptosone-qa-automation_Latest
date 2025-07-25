@VFG10X-588 @StoreSelling @Regression @GiftCard
Feature: VFG10X-588 Store Selling Functions _ Maximum Gift Card Top UP Amount
  Scenario: Store Selling Functions _ Maximum Gift Card Top UP Amount

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant clicks on existing gift card button
    And the sales assistant enters gift card number from index 6
    And the sales assistant enters gift card amount "1000.01"
    And the sales assistant validate the displayed error message
    And the sales assistant validate add value is disabled
    And the sales assistant enters valid gift card amount "999.99"
    And the sales assistant clicks on add value button
    And the sales assistant clicks on Skip button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application


