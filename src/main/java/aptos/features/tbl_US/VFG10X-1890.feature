@VFG10X-1890 @ReturnTransaction @Regression @Card @Visa
Feature: VFG10X-1890 Perform Blind return and verify Cash option is disabled for Non-Receipted Returns.

  Scenario: Perform Blind return and verify Cash option is disabled for Non-Receipted Returns.

  #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

    #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "DAMAGED/DEFECTIVE" as reason code
    And the sales assistant clicks on Skip button
    And the sales assistant navigate to basket page from return mode page

     #Assign customer
    And then sales assistant clicks on Assign Customer button
    And the sales assistant assign customer details with index 0

    #Payment transaction
    And the sales assistant clicks on Pay button
    And the sales assistant validates cash option is disabled or not
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

