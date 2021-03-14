Feature:  Parameters examples

  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://52.55.102.92:8000'
    * def hrUrl = 'http://52.55.102.92:1000/ords/hr'

  Scenario: path parameters
    Given url baseUrl
    And path "latest"
    When method get
    Then status 200

  Scenario: path parameters
    Given url baseUrl
    And path "2010-01-12"
    When method get
    Then status 200

  Scenario: get all spartans with path
    Given url spartanUrl
    And path "api/spartans"
    When method get
    Then status 200
    And print response

  Scenario: get ones spartan only
    Given url spartanUrl
    And path "api/spartans"
    And path "10"
    When method get
    Then status 200
    And print response
    And match response == { "gender": "Female", "phone": 3312820936, "name": "Lorenza", "id": 10}

  Scenario: get ones spartan only
    * def expectedSpartan =
    """
    {
        "gender": "Female",
         "phone": 3312820936,
         "name": "Lorenza",
         "id": 10
    }
    """
    Given url spartanUrl
    And path "api/spartans"
    And path "10"
    When method get
    Then status 200
    And print response
    And match response == expectedSpartan


    Scenario:  query parameters
      Given url spartanUrl
      And path "api/spartans/search"
      And param nameContains = 'j'
      And param gender = 'Female'
      When method GET
      Then status 200
      And match header Content-Type == 'application/json'
      And print response
      And match response.pageable.pageNumber == 0
      #verify each content has gender = Female
      And match each response.content contains {"gender":"Female"}
      #second way of iteration
      And match each response.content[*].gender == 'Female'
      And match response.content[0].name == 'Jinny'
      #verify each content phone is number
      And match each response.content[*].phone == '#number'


    Scenario: hr regions example
        Given url hrUrl
        And path 'regions'
        When method GET
        Then status 200
        And match response.limit == 25
        And match each response.items[*].region_id == '#number'








