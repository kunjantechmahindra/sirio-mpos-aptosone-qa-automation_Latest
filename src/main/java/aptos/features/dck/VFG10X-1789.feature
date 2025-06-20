@VFG10X-1789 @ReturnTransaction @Regression
Feature: VFG10X-1789 Promotions and Discounts _ Verified Return_Sale with Item level Discount_ Temp MD item _with change quantity .

  Scenario: Promotions and Discounts _ Verified Return_Sale with Item level Discount_ Temp MD item _with change quantity .

   #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 1 items from "General" product to the basket

    #Add Temp MD item
    And the sales assistant navigate to product inquiry page
    And the sales assistant add 1 items from "Temp-MD" product to the basket
    And the sales assistant save the original and temporary price
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant lands on Basket Page
    And the sales assistant confirms the UPC added to the basket

    #Item level amount 3$ off
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount button
    And the sales assistant enter discount amount as 3
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Birthday" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant saves the final price

    #Item level amount 3$ off
    And the sales assistant selects the product at index 2
    And the sales assistant selects the Change Quantity button
    And the sales assistant increase quantity by 2
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Payment
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "mastercard" card using a "tap" action, entering the pin "0"
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email and Print button
    And the sales assistant enter the email
    And the sales assistant select the printer and save the receipt for return

    #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate the payment details on e-receipt
    Then the sales assistant save the return barcode from the email receipt
    And the sales assistant closes the browser window.

    #Return Transaction
    And the sales assistant lands on Basket Page
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Wrong Size/Color" as reason code
    And the sales assistant lands on Basket Page

    #validate the discount amount and temp-MD amount while return
    And the sales assistant selects the product at index 1
    And the sales assistant verify the return price of the Item with Discount
    And the sales assistant selects the product at index 2
    And the sales assistant verify the return price of the TEMP MD item

    #Refund to cash
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant validate the refund amount is correct
    And the sales assistant do partial refund to "MasterCard" at position 1
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer


