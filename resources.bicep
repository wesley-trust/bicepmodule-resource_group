// Deployment Scope
targetScope = 'subscription'

// Parameters
@description('Desired name for the provisioned resources')
param serviceName string

@description('Desired environment for the service collection of provisioned resources')
param serviceEnvironment string

@description('Desired deployment identifier of the service collection of provisioned resources')
param serviceDeployment string

@description('Desired location for each service environment')
param serviceLocation string

// Variables
@description('Split on space, take the first array, and concatonate with the first character of the last array to create a prefix string')
var serviceLocationPrefix = '${string(first(split(serviceLocation, ' ')))}${first(string(last(split(serviceLocation, ' '))))}'

// Resources
resource group 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${serviceName}-${serviceEnvironment}-${serviceLocationPrefix}-${serviceDeployment}-rg'
  location: serviceLocation
}

// Outputs
@description('Name of the resource group')
output name string = group.name

@description('Location of the resource group')
output location string = group.location
