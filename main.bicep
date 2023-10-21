@secure()
param adminPassword string = '$trongPwd'

var location = 'westeurope'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'appPlan'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2022-09-01' = {
  name: 'name'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'StorageKey'
          value: 'duKMjSsdgW0Hcd32vbj4OMi5RVV/iXgGhvbYDjMAfR/AQgNPgc/KTUXQvZhWIeE3Z2JzyV91Uqf7+AStrhACHw=='
        }
      ]
      ftpsState: 'AllAllowed'
      minTlsVersion: '1.0'
    }
  }
}

