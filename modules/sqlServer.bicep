@description('The name of the server.')
param sqlServerName string = uniqueString('sql', resourceGroup().id)
//param sqlServerDb string = 'MyFirstDB' 

@description('Resource location.')
param location string = resourceGroup().location

@description('Administrator username for the server. Once created it cannot be changed.')
param administratorLogin string

@description('The administrator login password.')
@secure()
param administratorLoginPassword string

@description('Minimal TLS version')
@allowed([
  '1.0'
  '1.1'
  '1.2'
])
param minimalTlsVersion string = '1.2'

@description('Whether or not public endpoint access is allowed for this server.')
@allowed([
  'Enabled'
  'Disabled'
])
param publicNetworkAccess string

@description('The identity type. Set this to "SystemAssigned" in order to automatically create and assign an Azure Active Directory principal for the resource.')
@allowed([
  'None'
  'SystemAssigned'
  'UserAssigned'
])
param identity string = 'None'

@description('QA or PRD tag')
@allowed([
  'QA'
  'PRD'
])
param Environment string = 'QA'

param administratorsEnabled bool = false

@description('Principal Type of the sever administrator')
@allowed([
  'User'
  'Group'
  'Application'
])
param principalType string = 'Group'

@description('Login name of the server administrator.')
param login string = 'SQL ADMIN GROUP'

@description('SID (object ID) of the server administrator. - globally unique identifier')
param sid string = 'SID SQL ADMIN GROUP'

@description('Tenant ID of the administrator. - globally unique identifier')
param tenantid string = 'tenant id function'

@description('Azure Active Directory only Authentication enabled.')
param azureADOnlyAuthentication bool = false

var tagValues = {
  Environment: Environment
}

var administrators = {
  administratorType: 'ActiveDirectory'
  principalType: principalType
  login: login
  sid: sid
  tenantId: tenantid
  azureADOnlyAuthentication: azureADOnlyAuthentication
}

resource sqlServer 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: sqlServerName
  location: location
  tags: tagValues
  identity: {
    type: identity
  }
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    minimalTlsVersion: minimalTlsVersion
    publicNetworkAccess: publicNetworkAccess
    administrators: (administratorsEnabled ? administrators : json('null'))
  }
}
