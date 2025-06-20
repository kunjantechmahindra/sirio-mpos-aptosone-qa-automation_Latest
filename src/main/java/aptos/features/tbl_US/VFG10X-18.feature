@VFG10X-18 @SaleTransaction @Regression @GiftCard @Card @SmokeTesting
Feature: VFG10X-18 Sale Transaction _Multiple Items with multiple line item discounts _Payment by New Gift Card_ Existing customer

  Scenario: Sale Transaction _Multiple Items with multiple line item discounts _Payment by New Gift Card_ Existing customer

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  #Issue New Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant enters gift card number from index 0
    And the sales assistant enters gift card amount "500.00"
    And the sales assistant clicks on issue button
    And the sales assistant clicks on Skip button

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer

  #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    And the sales assistant navigate to product inquiry page
    And the sales assistant search product by style number "7695"
    And the sales assistant select an item from the list
    And the sales assistant add item to the basket
    And the sales assistant clicks on back button from product inquiry details page
    And the sales assistant search product by style number "8614"
    And the sales assistant select an item from the list
    And the sales assistant add item to the basket
    And the sales assistant clicks on basket button

  #Discount at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant enter discount amount as 50
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Discount ($50.00)" is applied to item

  #Discount at item level
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "DAMAGED/DEFECT" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 2
    And the sales assistant validate "Discount - 10%" is applied to item

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 0
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 0
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "$50.00" in EJ
    And the sales assistant validate details "10" in EJ
    And the sales assistant logout from EJViewer