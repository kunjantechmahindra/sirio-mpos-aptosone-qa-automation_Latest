@VFG10X-589 @StoreSelling @Regression
Feature: VFG10X-589 Store Selling Functions _ Promotions should not  be applied to eligible items during Blind Return

  Scenario: Store Selling Functions _ Promotions should not  be applied to eligible items during Blind Return

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Return transaction
    And the sales assistant clicks on return button
    And the sales assistant select No receipt for blind return
    And the sales assistant clicks on Skip button

  # Add Product
    Then the sales assistant add an items from "WithOutCoupon-10%" product for return
    And the sales assistant selects "Damaged/Defective" as reason code
    And the sales assistant navigate to basket page from return mode page

  # Validate discount not applied and Logout
    And the sales assistant selects the product at index 1
    And the sales assistant validate "10% off without coupon" promotion is not applied
    And the sales assistant void the transaction from basket with reason code "Cashier Error"
    And the sales assistant logout from the application