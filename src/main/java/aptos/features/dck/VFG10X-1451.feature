@VFG10X-1451 @Regression @ReturnTransaction @Card @Master @SmokeDCK
Feature: VFG10X-1451 Returns (Without receipt) with discount applied at Transaction level % off - Single Item -

  Scenario: Returns (Without receipt) with discount applied at Transaction level % off - Single Item -

    #Login and add item to basket
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    #Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return

    #Add Product
    Then the sales assistant add an items from "General" product for return
    And the sales assistant selects "Wrong Size/Color" as reason code
    And the sales assistant navigate to basket page from return mode page

    #Add transaction level discount
    And the sales assistant clicks on Discount button from basket page
    And the sales assistant select transaction discount button
    And the sales assistant clicks on percentage button
    And the sales assistant enter discount percentage as 6
    And the sales assistant clicks on Select a reason code button
    And the sales assistant selects "Senior Citizen" as reason code
    And the sales assistant clicks on Apply button

    #Refund transaction
    And the sales assistant clicks on Pay button
    And the sales assistant save the transaction details of the sales transaction
    And the sales assistant clicks on card for refund
    And the sales assistant processes the payment with a "master" card using a "tap" action, entering the pin "0"
    And the sales assistant sign for the transaction
    And the sales assistant save the payment details for the sales transaction
    And the sales assistant clicks on Print button
    And the sales assistant select the printer
    And the sales assistant logout from the application

 #EJ Validation
    And the sales assistant login to EJViewer
    And the sales assistant enter the store and transaction detail
    And the sales assistant validate the payment details
    And the sales assistant validate details "Senior Citizen" in EJ
    And the sales assistant logout from EJViewer

