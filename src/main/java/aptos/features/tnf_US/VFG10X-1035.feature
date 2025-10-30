@VFG10X-1035 @ReturnTransaction @Card @Regression @Master
Feature: VFG10X-1035 Return Transaction _Non verified return single Temp MD item with refund to Cash

  Scenario: Return Transaction _Non verified return single Temp MD item with refund to Cash

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "Temp-MD" product to the basket without customer

 #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

  #Return transaction
    And the sales assistant lands on Basket Page
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

  #Add Product
    Then the sales assistant add an items from "Temp-MD" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

  #Discount is not displayed
    And the sales assistant validate the discount applied as "$0.00"

  #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application






