@VFG10X-1359 @PromotionsAndDiscounts @Regression

Feature: VFG10X-1359 Promotions and Discounts _ Single Item Employee Discount _Item from Authorized group

  Scenario: Promotions and Discounts _ Single Item Employee Discount _Item from Authorized group

  #Login and Add items
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Apply Employee Discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Employee Sale" is applied to item

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
