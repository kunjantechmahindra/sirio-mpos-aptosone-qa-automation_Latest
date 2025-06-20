@VFG10X-1573 @SaleTransaction @Regression
Feature: VFG10X-1573 DCK - iPhone - Sales transaction with transaction level $ off for multiple items

  Scenario: DCK - iPhone - Sales transaction with transaction level $ off for multiple items

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

   # Add transaction level discount
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 2
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Military" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validate the discount applied as "2"

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application