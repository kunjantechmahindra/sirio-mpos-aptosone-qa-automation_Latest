@VFG10X-1721 @ReturnTransaction @Card @Regression @Master

  Feature: VFG10X-1721 Return Transaction _Blind Return single Temp MD item with refund by Master Card_No Customer

    Scenario: Return Transaction _Blind Return single Temp MD item with refund by Master Card_No Customer

    #Login and add item to basket
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button

    #Return transaction
      And the sales assistant clicks on return button
      And the sales assistant select No receipt for blind return

    #Add Product
      Then the sales assistant add an items from "Temp-MD" product for return
      And the sales assistant selects "Damaged/Defective" as reason code
      And the sales assistant clicks on Skip button
      And the sales assistant navigate to basket page from return mode page

    #Discount is not displayed
      And the sales assistant validate the discount applied as "$0.00"

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
