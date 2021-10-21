Feature: Hr my trials

Background:
  * def hrurl2 = 'http://34.228.41.120:1000/ords/hr'

    Scenario: Get a country name and verify
      Given url hrurl2
      And path "/countries"
      And path "US"
      And header Accept = 'application/json'
      When method GET
      Then status 200
      And match response.country_id == 'US'
      And match response.country_name == "United States of America"
      And match response.region_id == 2

  Scenario: users sends request to employees with parameter
    Given url hrurl2
    And path "/employees"
    And param q = '{"department_id":80}'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * def SDG = Java.type('utilities.stringManupulator')
    * def twoLetter = SDG.FirstTwoLetters(response.items[1].job_id)
    And match twoLetter == 'SA'
    And match each response.items[*].department_id == 80
    And match response.count == 25


  Scenario: users sends request to employees with region parameter
    Given url hrurl2
    And path "/countries"
    And param q = '{"region_id":3}'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match each response.items[*].region_id == 3
    And match response.count == 6
    And match response.hasMore == false
    And match response.items[*].country_name == ["Australia","China","India","Japan","Malaysia","Singapore"]
