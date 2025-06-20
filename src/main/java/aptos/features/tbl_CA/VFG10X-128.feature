@VFG10X-128 @StoreSelling @Regression @Card @Master
Feature: VFG10X-128 Original Tender Option Availability for Refund

  Scenario: Original Tender Option Availability for Refund

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket without customer

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - DAMAGED/DEFECTIVE" as reason code

  #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant validate original tender of sale transaction

  #Void Transaction
    And the sales assistant void the transaction from payment with reason code "Promo Error"
    And the sales assistant logout from the application
