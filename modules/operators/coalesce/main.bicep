param myObject object = {
  'isnull1': null
  'isnull2': null
  'string': 'demoString'
  'emptystr': ''
  'integer': 10
  }

// value demoString
output nonNullStr string = myObject.isnull1 ?? myObject.string ?? myObject.isnull2

// value 10
output nonNullInt int = myObject.isnull1 ?? myObject.integer ?? myObject.isnull2

// value null / empty
output nonNullEmpty string = myObject.isnull1 ?? myObject.emptystr ?? myObject.string ?? myObject.isnull2
