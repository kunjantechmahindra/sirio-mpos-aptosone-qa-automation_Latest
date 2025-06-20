@VFG10X-1791 @SaleTransaction @Regression
Feature: VFG10X-1791 Sale Transaction _Multiple Item_ transaction level Employee discount with override _Pay with Cash and Card

  Scenario: Sale Transaction _Multiple Item_ transaction level Employee discount with override _Pay with Cash and Card

   #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button
    Then the sales assistant add 3 items from "General" product to the basket

    #Add Employee discount Dickies-50% transactional
    And the sales assistant clicks on Employee Sale button from basket page
    And the sales assistant enter "valid" Employee ID
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Price override
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 60
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect Ticket" as reason code
    And the sales assistant clicks on Apply button

    #Price override
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 60
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect Ticket" as reason code
    And the sales assistant clicks on Apply button

    #Price override
    And the sales assistant selects the product at index 3
    And the sales assistant selects "Override price" Option from line Action
    And the sales assistant enter price as 60
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Incorrect PLU Price" as reason code
    And the sales assistant clicks on Apply button

    # Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant enters half of the total amount in the payment section
    And the sales assistant clicks on Card button
    And the sales assistant processes the payment with a "amex" card using a "tap" action, entering the pin "0"
    And the sales assistant validate if partial payment was success
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

  # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant logout from EJViewer


