@VFG10X-2170 @PromotionsAndDiscounts @Regression
Feature: VFG10X-2170 Promotions and Discounts _Transactional level discount reason code_MILITARY

  Scenario: Promotions and Discounts _Transactional level discount reason code_MILITARY

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "HigherPrice" product to the basket

  #Transactional level amount Discount 3$ off
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 3
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Military" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And sales assistant validates transactional level discount 3 applied

   #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application