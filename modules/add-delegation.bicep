// ------------------------------------------------------------
// Subnet with delegation
// ------------------------------------------------------------
param vNetName string
param rgVnet string
param subnetName string
param subnetAddressPrefix string
param serviceDelegation array = []

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2020-06-01' = {
  name: '${vNetName}/${subnetName}'
  properties: {
    addressPrefix: subnetAddressPrefix
    delegations: [
      {
        name: 'Microsoft.Web/serverfarms'
        properties: {
          serviceName: 'Microsoft.Web/serverfarms'
        }
      }
    ]
  }
}
