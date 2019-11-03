connect-azaccount

$colSubscriptions = Get-AZsubscription

foreach($subscription in $colSubscriptions)
{
    
    $path = ".\" + ($subscription.name).replace("/", "-")
    $path = ($path).replace("\\", "-")
    

    if (-not(Test-Path $path) )
    {
        New-Item -Path $path -ItemType Directory
    }
    
    select-azsubscription $subscription.name
    $colRG = get-azresourcegroup

    foreach ($rg in $colRG)
    {
       export-azresourcegroup -ResourceGroupName $rg.resourcegroupname -Path $path -Force -SkipAllParameterization
    }
}

