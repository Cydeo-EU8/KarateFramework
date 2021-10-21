Feature: pet store api tests

  Scenario: basic test with status code validation
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method GET
    Then status 200

  Scenario: header verification
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'
    #to verify headers we use header keyword then headername without double or single code
    # and == 'header value'
    And match header Date == '#present'
    #this equals to headers().hasHeaderWithName("headername") in restassured



  @wip
  Scenario: json body verification
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And print response.Available
    #verify base is EUR
    And match response.Available == 13
    And match response.roma == '#present'












