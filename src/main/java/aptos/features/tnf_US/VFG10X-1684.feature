@VFG10X-1684 @Regression @SaleTransaction
Feature: VFG10X-1684 Sale Transaction_Single Item with Multiple Reward Cards (One Full and One Partial) and Gift card_Void One reward card and add again

  Scenario: Sale Transaction_Single Item with Multiple Reward Cards (One Full and One Partial) and Gift card_Void One reward card and add again

      #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

      #Assign customer and add product
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 3 items from "HigherPrice" product to the basket

      # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 125
    And the sales assistant validate membership reward applied
    And the sales assistant clicks on back button from membership rewards

      # Payment Void
    And the sales assistant voids the partial payment

      # Payment transaction
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 25
    And the sales assistant validate membership reward applied
    And the sales assistant clicks on back button from membership rewards
    And the sales assistant enters the amount to be paid using gift card
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 1
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 1
    And the sales assistant validate the partial payment by gift card
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 50
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer