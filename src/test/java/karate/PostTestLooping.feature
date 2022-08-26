@features
Feature: Create User

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

# Post with read request body and expected response from json file
  Scenario: Create User for User 1 - scenario1
    Given path '/users'
    And def requestBody = read("PostTestLoopingRequestBody.json")
    And request requestBody.scenario1
    When method Post
    Then status 201

  Scenario: Create User for user 2 - scenario2
    Given path '/users'
    And def requestBody = read("PostTestLoopingRequestBody.json")
    And request requestBody.scenario2
    When method Post
    Then status 201
