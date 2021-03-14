Feature: Bookit Api tests

    Background:
      * def baseUrl = 'https://cybertek-reservation-api-qa2.herokuapp.com/'
      #point another feature file
      * def AuthFeature = call read('classpath:features/BookItAuth.feature')
      * def accessToken = AuthFeature.token
      * def firstname = AuthFeature.name
      * print firstname
      * print 'Token From Background',accessToken


      Scenario: get user information
        Given url baseUrl
        And path 'api/users/me'
        And header Authorization = 'Bearer ' + accessToken
        And header Accept = 'application/json'
        When method GET
        Then status 200
        And print response
        And match response == {"id":57,"firstName":"Ase","lastName":"Norval","role":"student-team-leader"}



      Scenario:  get campus information
        Given url baseUrl
        And path 'api/campuses'
        And header Authorization = 'Bearer ' + accessToken
        And header Accept = 'application/json'
        When method GET
        Then status 200
        And print response
        # read the campuses.json file in the data directory
        And def expectedCampuses = read('classpath:data/campuses.json')
        And match response == expectedCampuses
