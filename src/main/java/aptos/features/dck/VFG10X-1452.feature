@VFG10X-1452 @ReturnTransaction @Card @Regression @VisaDebit
Feature: VFG10X-1452 Return Transaction_Transaction level percentage off discount_Multiple Item_Debit card

  Scenario: Return Transaction_Transaction level percentage off discount_Multiple Item_Debit card

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 2 items from "General" product to the basket

  #Transactional level amount Discount 20$ off
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 20
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Clearance" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant save sale amount details
    And the sales assistant validate transactional level percentage off 20 applied for 2 items

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "visa debit" card using a "insert" action, entering the pin "0"
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant lands on Basket Page

  #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant select "visa debit" card for refund
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application