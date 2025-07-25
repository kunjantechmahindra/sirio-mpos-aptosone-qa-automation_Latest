@VFG10X-2301 @GiftCard @Regression @StoreSelling
Feature: VFG10X-2301 Gift Card _ Sale transaction using Gift card with Zero balance

  Scenario: Gift Card _ Sale transaction using Gift card with Zero balance

  # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Gift card balance enquiry (for zero balance gift card)
    Then the sales assistant validates the Gift Card balance from basket page for index 2
    Then the sales assistant enter the the pin from index 2
    Then the sales assistant saves the Gift Card balance amount
    Then the sales assistant validates the Gift Card balance is "0.00"
    And the sales assistant closes the Balance Inquiry screen

    #Add item to the basket
    Then the sales assistant add 1 items from "General" product to the basket without customer

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 2
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 2
    And the sales assistant validates the payment decline error message
    And the sales assistant clicks on Close button from payment page
    And the sales assistant void the transaction from payment with reason code "Promo Error"
    And the sales assistant logout from the application