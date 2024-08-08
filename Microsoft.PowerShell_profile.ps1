function Invoke-Starship-PreCommand {
    $host.ui.RawUI.WindowTitle = "$pwd `a"
    # $host.ui.Write($prompt)
}

$cluster_joaofauvel = "0802-185804-xwrpoc7y"
$cluster_da_01 = "0630-001423-1cs6vpjx"

function db {
    <#
    .SYNOPSIS
    Execute Databricks CLI
    #>
    databricks.exe $args
}


function dbc {
    <#
    .SYNOPSIS
    databricks clusters $args
    #>
    databricks.exe clusters $args
}

function dbcls {
    <#
    .SYNOPSIS
    databricks clusters list
    #>
    databricks.exe clusters list
}

function dbcstart {
    <#
    .SYNOPSIS
    databricks clusters start $clusterid
    #>
    databricks.exe clusters start $args
}

function dbcget {
    <#
    .SYNOPSIS
    State of databricks $clusterid
    #>
    databricks.exe clusters get $args
}

function dbcstate {
    <#
    .SYNOPSIS
    State of databricks $clusterid
    #>
    databricks.exe clusters get $args | jq '.state, .state_message'
}

function pyv { 
    <#
    .SYNOPSIS
    Switch to Python version
    #>
    scoop reset python$args 
}

Invoke-Expression (&starship init powershell)
Import-Module PSReadLine

. $PSScriptRoot"\databrickscli_completion.ps1"
. $PSScriptRoot"\dbx_completion.ps1"
. $PSScriptRoot"\gh_completion.ps1"
