@VFG10X-1934 @PriceOverride @Regression
Feature: VFG10X-1934 Sale Transaction _Single Item_ Employee discount_ Payment by Cash with change due

  Scenario: Sale Transaction _Single Item_ Employee discount_ Payment by Cash with change due

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

    #Apply employee discount
    And the sales assistant clicks on menu button for iPhone basket
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant navigate to basket page

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant enter extra amount
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application