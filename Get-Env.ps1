<#PSScriptInfo

.VERSION 0.0

.GUID 143f5059-ba30-491b-bf75-12849f266310

.AUTHOR David Walker, Sitecore Dave, Radical Dave

.COMPANYNAME David Walker, Sitecore Dave, Radical Dave

.COPYRIGHT David Walker, Sitecore Dave, Radical Dave

.TAGS powershell file io script powershellgallery

.LICENSEURI https://github.com/Radical-Dave/Get-Env/blob/main/LICENSE

.PROJECTURI https://github.com/Radical-Dave/Get-Env

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


#>

<#
.SYNOPSIS
PowerShell Script wrapper for [Environment]::GetEnvironmentVariable with logging, default value, etc

.DESCRIPTION
PowerShell Script wrapper for [Environment]::GetEnvironmentVariable with logging, default value, etc

.EXAMPLE
PS> .\Get-Env 'name'

.EXAMPLE
PS> .\Get-Env 'name' 'Machine'

.EXAMPLE
PS> .\Get-Env 'name' 'Process' 'd:\repos'

.EXAMPLE
PS> .\Get-Env 'name' 'Process' 'd:\repos'

.Link
https://github.com/Radical-Dave/Get-Env

.OUTPUTS
    System.String
#>
#####################################################
#  Get-Env
#####################################################
Param(
	# Name of variable
	[Parameter(Mandatory=$true,Position=0)] [string]$name,
	# Scope of variable [User, Machine, Process]
	[Parameter(Mandatory=$false,Position=1)] [string]$scope = "User",
    # Default value
	[Parameter(Mandatory=$false,Position=2)] [string]$default = ""
)
$ErrorActionPreference = 'Stop'
$PSScriptName = $MyInvocation.MyCommand.Name.Replace(".ps1","")
$results = [Environment]::GetEnvironmentVariable($name, $scope)
Write-Verbose "$PSScriptName.GetEnvVar($name,$scope,$default):$results"
if (!$results) {
    $results = $default
}
return $results