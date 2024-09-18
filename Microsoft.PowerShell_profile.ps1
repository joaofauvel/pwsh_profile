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
Import-Module posh-git
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"
Import-Module posh-docker

. $PSScriptRoot"\databrickscli_completion.ps1"
. $PSScriptRoot"\dbx_completion.ps1"
. $PSScriptRoot"\gh_completion.ps1"
