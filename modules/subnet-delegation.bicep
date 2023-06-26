param vNetName string
param rgVnet string
param subnetName string
param subnetAddressPrefix string
param delegations array = []

//Subnet with delegation
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2020-06-01' = {
  name: '${vNetName}/${subnetName}'
  properties: { 
    // delegations: delegations
    delegations:[
      {
        name: 'delegation'
        properties:{
          serviceName: 'Microsoft.Web/serverfarms'
        }
      }
    ]
  }
}
