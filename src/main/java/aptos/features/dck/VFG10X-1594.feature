@VFG10X-1594 @ExchangeTransaction @Regression @SmokeDCK
Feature: VFG10X-1594 Exchange _Transaction level dollar off discount_Sale transaction should have transaction level dollar off discount

  Scenario: Exchange _Transaction level dollar off discount_Sale transaction should have transaction level dollar off discount

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "HigherPrice" product to the basket

  #Transactional level amount Discount 2$ off
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 2
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Group" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And sales assistant validates transactional level discount 2 applied

   #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant lands on Basket Page

    #Add items to the basket
    And the sales assistant add 2 items from "HigherPrice" product to the basket

  #Transactional level amount Discount 3$ off
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 3
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Clearance" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And sales assistant validates transactional level discount 3 applied


  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application
