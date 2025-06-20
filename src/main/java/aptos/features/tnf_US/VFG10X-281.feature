@VFG10X-281 @ReturnTransaction @Regression @Card @Master @GiftCard
Feature: VFG10X-281 Return Transaction _ Return multiple items including one Temp MD item_Employee discount and price override
  applied_ payment 50 % by Mastercard swipe and 50 % Gift Card_Refund to Gift card_Existing customer Assigned_E-Receipt validation

  Scenario: Return Transaction _ Return multiple items including one Temp MD item_Employee discount and price override applied_
  payment 50 % by Mastercard swipe and 50 % Gift Card_Refund to Gift card_Existing customer Assigned_E-Receipt validation

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Search TempMD product from Product Inquiry
    And the sales assistant navigate to product inquiry page
    And the sales assistant add 1 items from "Temp-MD" product to the basket
    And the sales assistant verify tempMd is displayed
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button
    And the sales assistant clicks on Skip button
    And the sales assistant lands on Basket Page

  #Add a general item
    And the sales assistant add 1 items from "General" product to the basket

  #Apply employee Discount
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

  #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enters maximum price
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button

  #Partial Payment transaction with master card and giftcard
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "master" card using a "swipe" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 0
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 0
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

  #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code

  #Assign customer
    And the sales assistant lands on Basket Page
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 6

  # Refund
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from Refund
    And the sales assistant clicks on existing gift card button
    And the sales assistant enter the gift card number for payment from index 0
    And the sales assistant clicks on add value button from payment page
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Email button
    And the sales assistant enter continue without entering mailID
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #E-receipt validation
    Given the sales assistant launch the browser and navigate to YOP mail
    And the sales assistant validate the payment details on e-receipt
    And the sales assistant closes the browser window.


