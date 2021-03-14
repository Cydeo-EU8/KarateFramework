Feature: using match keyword

  Scenario: some matching example
    * def name = 'Severus Snape'
    * match name == 'Severus Snape'
    # similar to Assert.assertEquals(name,"Severus Snape");
    * match name != 'Tom Riddle'

  Scenario: more matching example
    * def employee =
  """
    {
      "first_name":"TJ",
      "salary":24001,
      "active":true
    }
    """
    * def emp_name = employee.first_name
    * match emp_name == 'TJ'
    * match employee.salary == 24001

  Scenario: fuzzy matching
    * def employee =
  """
     {
      "first_name":"TJ",
      "salary":24001,
      "active":true
    }
    """
    * match employee.first_name == '#string'
    * match employee.salary == '#number'
    * match employee.active == '#boolean'
    * match employee.last_name == '#notpresent'


  Scenario: contains matching
    * def employees =
  """
  [
     {
      "first_name":"TJ",
      "salary":24001,
      "active":true
     },
     {
      "first_name":"Steven",
      "salary":2100,
      "active":false
     }
    ]
    """
    * def length = employees.length
    * print length
    * match  length == 2
    * match employees contains any {"first_name":"TJ","salary":24001,"active":true }





