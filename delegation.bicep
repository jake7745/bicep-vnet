//Special vNet/Subnet objects
param vNetArray array
param subnetArray array


//Special Subnets
var subnetRTOnly = [
  'GatewaySubnet'
]
var subnetNone = [
  'AzureBastionSubnet'
  'AzureFirewallSubnet'
]
var specialSubnet = [
  'GatewaySubnet'
  'AzureBastionSubnet'
  'AzureFirewallSubnet'
]


//TT Assigning Delegation to subnet
@batchSize(1)
module AssignDelegation 'modules/subnet-delegation.bicep' = [for (subnet, i) in subnetArray: if (contains(subnetNone, subnet.subnetName)) {
  name: 'SubnetsDelegation-${subnet.vNetName}-${subnet.subnetName}-${i}'
  params: {
    rgVnet: resourceGroup().name
    vNetName: subnet.vNetName
    subnetName: subnet.subnetName
    subnetAddressPrefix: subnet.SubnetAddressSpace
    delegations: [
      {
        name: 'Microsoft.Web.ServerFarms'
        properties: {
          serviceName: 'Microsoft.Web.ServerFarms'
        }
      }
    ]
  }
  dependsOn: []
}]
