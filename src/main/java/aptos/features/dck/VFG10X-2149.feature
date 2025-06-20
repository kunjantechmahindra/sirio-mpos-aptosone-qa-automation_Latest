@VFG10X-2149 @Regression @StoreSelling
  Feature: VFG10X-2149 Store Selling Functions_ Item Level Sales person Assignment and Cancel Assignment

    Scenario: Store Selling Functions_ Item Level Sales person Assignment and Cancel Assignment

    # Login and add products
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 2 items from "General" product to the basket

    # Assign sale person and validate Sales Person name
      Then the sales assistant validates the user "Testing Automation" is tagged to item
      And the sales assistant selects the product at index 1
      And the sales assistant selects "Salesperson" Option from line Action
      And the sales assistant add salesperson "800100" to the transaction item
      Then the sales assistant selects "No" from the salesperson popup box
      Then the sales assistant validates the user "User 40" is tagged to item

      # Add another item to the basket and assign new Sales Person
      Then the sales assistant add 1 items from "General" product to the basket
      And the sales assistant selects the product at index 2
      And the sales assistant selects "Salesperson" Option from line Action
      And the sales assistant add salesperson "200100" to the transaction item
      Then the sales assistant selects "Yes" from the salesperson popup box

    # Void Transaction
      And the sales assistant void the transaction from basket with reason code "Promo Error"
      And the sales assistant logout from the application