@features
Feature: Create User

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedResponse = read("response1.json")

# Simple Post Scenario
  Scenario: Create User Simple
    Given url 'https://reqres.in/api/users'
    And request {"name": "TestUser","job": "Automation Engineer"}
    When method Post
    Then status 201
    And print response

# Post with Background and Assertions
  Scenario: Create User background
    Given path '/users'
    And request {"name": "TestUser","job": "Automation Engineer"}
    When method Post
    Then status 201
    And match response == { "createdAt": "#ignore", "name": "TestUser", "id": "#string", "job": "Automation Engineer" }

# Post with read expected response from json file
  Scenario: Create User resp from file
    Given path '/users'
    And request {"name": "TestUser","job": "Automation Engineer"}
    When method Post
    Then status 201
    And match response == expectedResponse

# Post with read request body and expected response from json file
  Scenario: Create User req body and resp from file
    Given path '/users'
    And def requestBody = read("request1.json")
    And request requestBody
    When method Post
    Then status 201
    And match response == expectedResponse