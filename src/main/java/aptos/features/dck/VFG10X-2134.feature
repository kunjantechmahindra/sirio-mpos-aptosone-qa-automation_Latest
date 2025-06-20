@VFG10X-2134 @StoreSelling @Regression

  Feature: VFG10X-2134 Store Selling Functions _Price Override Function

    Scenario: Store Selling Functions _Price Override Function

   # Login
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "General" product to the basket

  #validates item level price override functionality
      And the sales assistant selects the product at index 1
      And the sales assistant validates Price override line action function is enabled
      And the sales assistant void the transaction from basket with reason code "Cashier Error"
      And the sales assistant logout from the application
