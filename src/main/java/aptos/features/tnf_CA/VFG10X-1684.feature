@VFG10X-1684 @ReturnTransaction @Regression @GiftCard

Feature: VFG10X-1684 Sale Transaction_Single Item with Multiple Reward Cards (One Full and One Partial) and Gift card_ Void One reward card and add again

  Scenario: Sale Transaction_Single Item with Multiple Reward Cards (One Full and One Partial) and Gift card_ Void One reward card and add again

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

   # Assign customer and add product
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1
    Then the sales assistant add 1 items from "General" product to the basket

    # Price override to match the rewards
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 100
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button

    # Partial Payment transaction by reward
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 25
    And the sales assistant validate membership reward applied
    And the sales assistant clicks on back button from membership rewards

  # Partial Payment transaction by reward
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 25
    And the sales assistant validate membership reward applied
    And the sales assistant clicks on back button from membership rewards

  # void one reward and partial payment by gift card
    And the sales assistant voids the partial payment
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on gift card button from payment page
    And the sales assistant enter the gift card number for payment from index 3
    And the sales assistant clicks on redeem button
    And the sales assistant enter the the pin from index 3
    And the sales assistant validate the partial payment by gift card

   # Balance payment by reward
    And the sales assistant clicks on More button
    And the sales assistant clicks on Membership Reward button
    And the sales assistant selects loyalty reward 25
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application