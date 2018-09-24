<#
.SYNOPSIS
Function to compare the hash of a file to a reference hash given the hashing algorithm.

.PARAMETER FilePath
This can be a string containing either the relative or absolute path to file.

.PARAMETER Reference
This is a string containing the exact reference hash for comparison.

.PARAMETER Algorithm
This can be any of the following: { SHA1 | SHA256 | SHA384 | SHA512 | MACTripleDES | MD5 | RIPEMD160 }

.NOTE
Name:   HshThis.ps1
Author: LRninja
Email:  37206777+LRninja@users.noreply.github.com

.SYNTAX
HshThis.ps1 [FilePath] <string[]> [Reference] <string[]> [Algorithm <string[]> { SHA1 | SHA256 | SHA384 | SHA512 | MACTripleDES | MD5 | RIPEMD160 }]

.EXAMPLE
HshThis.ps1 .\myFile.txt "492e01d5ef25bf97a5ba157d6ae2101e54f1b6965f41f05c5299dc701dc73182" SHA256
#>
Param(
	[Parameter(Mandatory=$false,
		ValueFromPipeline=$true,
		Position=0)]
	[string]$FilePath,
	[Parameter(Mandatory=$false,
		ValueFromPipeline=$true,
		Position=1)]
	[string]$Reference,
	[Parameter(Mandatory=$false,
		ValueFromPipeline=$true,
		Position=2)]
	# HelpMessage="Enter one of the following { SHA1 | SHA256 | SHA384 | SHA512 | MACTripleDES | MD5 | RIPEMD160 } (SHA256)"
	[ValidateSet("SHA1", "SHA256", "SHA384", "SHA512", "MACTripleDES", "MD5", "RIPEMD160")]
	[string]$Algorithm="SHA256"
	)
	
$myHsh= (Get-FileHash -Path $FilePath -Algorithm $Algorithm).hash
$refHsh= $Reference.toupper() 
if ($myHsh -eq $refHsh) { 
	write-host
	write-host '================================'  
	write-host -foregroundcolor green "Winner Winner Chicken Dinner!!!" 
	write-host
	write-host -foregroundcolor green $myHsh
	write-host $refHsh
	write-host '================================'
	write-host
}else{ 
	write-host
	write-host '================================'
	write-warning "!!Beware Your DOOM!!"
	write-host
	write-host -foregroundcolor red $myHsh 
	write-host $refHsh 
	write-host '================================'
	write-host
}