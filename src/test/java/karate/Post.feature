@features
Feature: User Details

  Background:
   * url 'https://reqres.in/api'

  Scenario: Create single User details
    Given path  '/users'
    And request {"name":"Jitendra","job":"leader"}
    When method Post
    Then status 201
    And print response

  Scenario: Validate User details
    Given path '/register'
    And request {"email":"eve.holt@reqres.in","password":"pistol"}
    When method Post
    Then status 200
    And match response == {"id":4,"token":"QpwL5tke4Pnpja7X4"}

  Scenario:  User Login unsuccessful
    Given path '/login'
    And request {"email": "peter@klaven"}
    When method Post
    Then status 400
    And match response == {"error": "Missing password"}

  Scenario:  User Login successful
    Given path '/login'
    And request
    """
    {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
}
    """
    When method Post
    Then status 200
    And match response ==
    """
    {
    "token": "QpwL5tke4Pnpja7X4"
}
    """

  Scenario: Create User
    Given path  '/users'
    And request
    """
  {
  "name": "morpheus",
  "job": "leader"
  }
  """
    When method Post
    Then status 201
    And print response


