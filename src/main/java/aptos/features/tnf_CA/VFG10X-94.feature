@VFG10X-94 @StoreSelling @Regression
Feature: VFG10X-94 Store Selling Functions_ Gift Card Balance Enquiry enabled

  Scenario: Store Selling Functions_ Gift Card Balance Enquiry enabled

  # Login
    Given the sales assistant login to the application with valid username and password
    When the sales assistant clicks on Start Basket button

  # Gift card balance enquiry
    And the sales assistant validate gift card balance option is enabled and logout