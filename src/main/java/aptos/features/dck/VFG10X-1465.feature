@VFG10X-1465 @Regression @GiftCard @Card @SmokeDCK
Feature: VFG10X-1465 Gift Card - Balance Inquiry

  Scenario: Gift Card - Balance Inquiry

    # Login and add products
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

    # Gift card balance enquiry
    Then the sales assistant validates the Gift Card balance from basket page for index 1
    And the sales assistant closes the Balance Inquiry screen

    # Logout from the application
    And the sales assistant logout from the application