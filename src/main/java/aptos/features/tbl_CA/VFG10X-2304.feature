@VFG10X-2304 @SaleTransaction @Regression @Card @GiftCard @Visa

  Feature: VFG10X-2304 Sale Transaction _Normal item and Gift card item_ Partial Payment by Cash & Visa Card_ No customer

    Scenario: Sale Transaction _Normal item and Gift card item_ Partial Payment by Cash & Visa Card_ No customer


  # Login and add product
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      And the sales assistant add 2 items from "General" product to the basket without customer

  # Issue New Gift Card
      And the sales assistant clicks on gift card button
      And the sales assistant enters gift card number from index 0
      And the sales assistant enters gift card amount "500.00"
      And the sales assistant clicks on issue button
      And the sales assistant lands on Basket Page

  # Payment transaction
      And the sales assistant clicks on Pay button
      And the sales assistant clicks on Accept button
      And the sales assistant save the transaction details of the sales transaction
      And the sales assistant enters half of the total amount in the payment section
      And the sales assistant clicks on Card button
      And the sales assistant processes the payment with a "visa" card using a "tap" action, entering the pin "0"
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