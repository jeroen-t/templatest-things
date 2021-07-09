resource sqlServer 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: 'string'
  location: resourceGroup().location
  tags: {}
  identity: {
    type: 'None'
  }
  properties: {
    administratorLogin: 'string'
    administratorLoginPassword: 'string'
    version: 'string'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Disabled'
    keyId: 'string'
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'Group'
      login: 'string'
      sid: 'string'
      tenantId: 'string'
      azureADOnlyAuthentication: true
    }
  }
}
