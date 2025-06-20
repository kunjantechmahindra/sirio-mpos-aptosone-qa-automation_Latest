@VFG10X-1446 @Regression @GiftCard @SaleTransaction @SmokeDCK
Feature: VFG10X-1446 Sale Transaction_Transaction level percentage off discount_Single Item_Redeem Gift Card

  Scenario: Sale Transaction_Transaction level percentage off discount_Single Item_Redeem Gift Card

  #Login and add product
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

 #Add Product
    Then the sales assistant add 1 items from "General" product to the basket

# Add transaction level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 15
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Birthday" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant save sale amount details
    And the sales assistant validate transactional level percentage off 15 applied for 1 items

  #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 1
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application