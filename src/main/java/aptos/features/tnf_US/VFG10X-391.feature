@VFG10X-391 @Regression @StoreSelling
  Feature: VFG10X-391 Store Selling Functions _ Prompt for price entry validation_ Zero Price Items

    Scenario: Store Selling Functions _ Prompt for price entry validation_ Zero Price Items

      #Login and add products
      Given the sales assistant login to the application with valid username and password
      When the sales assistant clicks on Start Basket button
      Then the sales assistant add 1 items from "ZeroPrice" product to the basket

      #Enter Price
      And the sales assistant validate price entry prompt is displayed
      And the sales assistant edit price as 25
      And the sales assistant clicks on Apply button
      And the sales assistant clicks on Skip button

      #Void Transaction
      And the sales assistant void the transaction from basket with reason code "Promo Error"
      And the sales assistant logout from the application






