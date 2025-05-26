
# Variables
$resourceGroup = "batch27"
$location = "EastUS"
$vmName = "MyPowerShellVM"
$vmSize = "Standard_B1s"
$adminUsername = "azureuser"
$adminPassword = ConvertTo-SecureString "P@ssword1234!" -AsPlainText -Force

# Create resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create VM config
$cred = New-Object System.Management.Automation.PSCredential($adminUsername, $adminPassword)
New-AzVM `
    -ResourceGroupName $resourceGroup `
    -Name $vmName `
    -Location $location `
    -VirtualNetworkName "$vmName-VNet" `
    -SubnetName "$vmName-Subnet" `
    -SecurityGroupName "$vmName-NSG" `
    -PublicIpAddressName "$vmName-PIP" `
    -Credential $cred `
    -OpenPorts 22,80 `
    -Size $vmSize
