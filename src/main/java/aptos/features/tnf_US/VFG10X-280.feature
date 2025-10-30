@VFG10X-280 @ReturnTransaction @Regression
Feature: VFG10X-280 Return Transaction _Sale of multiple items with multiple employees assigned and item and transactional discount Existing Customer Assigned

  Scenario: Return Transaction _Sale of multiple items with multiple employees assigned and item and transactional discount Existing Customer Assigned

    #Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Add Product
    Then the sales assistant add 2 items from "General" product to the basket without customer

    #Discount at item level
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Discounts" Option from line Action
    And the sales assistant select transaction discount
    And the sales assistant clicks on amount button
    And the sales assistant enter discount amount as 10
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Mall Coupon" as reason code
    And the sales assistant clicks on Apply button
    And the sales assistant lands on Basket Page

    #Discount at transaction level
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant enter discount percentage as 6
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Nurse" as reason code
    And the sales assistant clicks on Apply button

    #Assign sale person
    And the sales assistant selects the product at index 2
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800500" to the transaction item
#    Then the sales assistant selects "Yes" from the salesperson popup box
    And the sales assistant lands on Basket Page
    And the sales assistant selects the product at index 1
    And the sales assistant selects "Salesperson" Option from line Action
    And the sales assistant add salesperson "800200" to the transaction item
    Then the sales assistant selects "Yes" from the salesperson popup box

    #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 1

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant clicks on Accept button
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant clicks on Print button
    And the sales assistant select the printer and save the receipt for return

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant scan the receipt for returning the item
    And the sales assistant return all items from the transaction
    And the sales assistant selects "RTL - Changed Mind" as reason code
    And the sales assistant clicks on "Ok" button to assign customer
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on Cash button
    And the sales assistant enter the Drawer ID
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

    # EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "RTL - Changed Mind" in EJ
    And the sales assistant logout from EJViewer