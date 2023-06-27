// ------------------------------------------------------------
// Subnet with delegation
// ------------------------------------------------------------
param vNetName string
param rgVnet string
param subnetName string
param subnetAddressPrefix string
param serviceDelegation array = []


param tempvNet string = '10.5.0.0/16'

// resource vnet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
//   name: vNetName
//   location: resourceGroup().location
//   properties: {
//     addressSpace: {
//       addressPrefixes: [tempvNet]//[vNetAddressPrefix]
//     }
//   }
// }


resource subnet 'Microsoft.Network/virtualNetworks/subnets@2020-06-01' = {
  name: '${vNetName}/${subnetName}'
  // name: 'asubnet'
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
