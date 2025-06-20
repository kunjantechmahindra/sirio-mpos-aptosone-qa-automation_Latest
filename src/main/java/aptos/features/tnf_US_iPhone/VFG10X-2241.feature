@VFG10X-2241 @Regression @StoreSelling
  Feature: VFG10X-2241 Store Selling Functions_ Item Level Sales person Assignment

    Scenario: Store Selling Functions_ Item Level Sales person Assignment

      # Login and add products
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "General" product to the basket without customer

      # Assign sale person
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Salesperson" Option from line Action
      And the sales assistant add salesperson "800500" to the transaction item
      Then the sales assistant selects "Yes" from the salesperson popup box

      # Void Transaction
      And the sales assistant clicks on menu button for iPhone basket
      And the sales assistant void the transaction from basket with reason code "Cashier Error"
      And the sales assistant logout from the application