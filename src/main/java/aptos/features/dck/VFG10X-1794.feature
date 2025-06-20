@VFG10X-1794 @ReturnTransaction @Regression
Feature: VFG10X-1794 Return Transaction _Verified Return_Sale with Multiple items with Tax exempt and Multiple Quantity

  Scenario: Return Transaction _Verified Return_Sale with Multiple items with Tax exempt and Multiple Quantity

#Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Gift card balance enquiry
    Then the sales assistant validates the Gift Card balance from basket page for index 1
    Then the sales assistant saves the Gift Card balance amount
    And the sales assistant closes the Balance Inquiry screen

  #Add products
    Then the sales assistant add 2 items from "LowerPrice" product to the basket

  #Change quantity
    And the sales assistant selects the product at index 1
    And the sales assistant selects the Change Quantity button
    And the sales assistant increase quantity by 2
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  #Tax exempt
    And the sales assistant selects Tax button from Basket page
    And the sales assistant selects "Tax exempt" Option from line Action
    And the sales assistant enter the tax ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant validates transactional level tax is exempted

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 1
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "Changed Mind" as reason code

  #Refund to gift card
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant clicks on existing gift card button
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on add value button from payment page
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter the email
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate the payment details on e-receipt
    And the sales assistant closes the browser window.