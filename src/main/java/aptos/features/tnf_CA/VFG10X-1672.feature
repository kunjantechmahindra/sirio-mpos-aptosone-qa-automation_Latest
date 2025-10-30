@VFG10X-1672 @Regression @GiftCard @Card
Feature: VFG10X-1672 Gift Card _Unable to apply Item Level , Transactional Level discount and Price Override a Top Up Gift card Item in a transaction

  Scenario: Gift Card _Unable to apply Item Level , Transactional Level discount and Price Override a Top Up Gift card Item in a transaction

  #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Top Up Gift Card
    And the sales assistant clicks on gift card button
    And the sales assistant validates existing gift card button is enabled
    And the sales assistant enters gift card number from index 2
    And the sales assistant enters gift card amount "50.00"
    And the sales assistant clicks on add value button
    And the sales assistant clicks on Skip button
    Then the sales assistant validates the Gift Card balance from basket page for index 2
    Then the sales assistant enter the the pin from index 2
    Then the sales assistant saves the Gift Card balance amount
    And the sales assistant closes the Balance Inquiry screen
    And the sales assistant lands on Basket Page

    #Add normal item to the basket
    And the sales assistant add 2 items from "General" product to the basket

    #Apply item level discount to gift card
    And the sales assistant selects gift card item at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant clicks on amount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validates the error message for gift card discount

    #Apply line item level discount to normal item
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant clicks on amount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Damaged" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant validate "Discount" is applied to item

    #Apply transactional level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount
    And the sales assistant clicks on amount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Other" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validate transactional level discount don't applied to issued gift card

    #Apply price override to gift card
    And the sales assistant selects gift card item at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant validates the error message for gift card discount

    #Apply price override to normal item
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 30
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Price Match" as reason code
    And the sales assistant clicks on Apply button

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant clicks on Cash option
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant lands on Basket Page

    #Gift card balance enquiry
    Then the sales assistant validates the Gift Card balance from basket page for index 2
    Then the sales assistant enter the the pin from index 2
    Then the sales assistant saves the Gift Card balance amount
    And the sales assistant closes the Balance Inquiry screen
    And the sales assistant validates the gift card balance after applying discounts
    And the sales assistant logout from the application

    #Missing Feature




