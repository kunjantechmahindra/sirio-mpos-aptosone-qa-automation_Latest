@VFG10X-1635 @SFCC @PrerequisiteRequired

Feature: VFG10X-1635 SFCC_ Update a TBL promotion without coupon
  Scenario: SFCC_ Update a TBL promotion without coupon

    #Login
    Given the sales assistant launches SFCC application
    And the sales assistant login to SFCC application
    And the sales assistant selects "TBL POS" as site
    And the sales assistant selects campaigns from merchant tools
    And the sales assistant enter the promotion ID "010420248"
    And the sales assistant select start date "18-Dec-2024"
    And the sales assistant select end date "28-Jan-2025"
    And sales assistant clicks on apply button in campaign page
    And sales assistant selects promotions from merchant tools
    And sales assistant enter the promotion ID "010420248" for promotions
    And sales assistant update the UPC's for the promotion
    And sales assistant select the SKU for "Promo-without-coupon-category"
    And sales assistant edit the promotion rule to "20"
    And sales assistant clicks on Apply button in promotion page
    And sales assistant clicks on Jobs from administration tab
    And sales assistant clicks on export promotion JSON for "TBL"
    And sales assistant clicks on Schedule and History Tab
    And sales assistant clicks on run button
    And sales assistant quit the browser