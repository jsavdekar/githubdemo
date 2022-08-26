Feature: Graph Ql
  Background:
    * url 'https://api.graphql.jobs'

  Scenario: Graph QL Testcases
    Given path '/'
    When text query =
    """
    {
    jobs{
        id,title
    }
}
    """
    And request { query:'#(query)'}
    When method Post
    Then status 200
    Then match response  == "#object"
