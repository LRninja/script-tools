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
Author: Ben Hershberger
Email:  bhershberger10@gmail.com

.SYNTAX
HshThis.ps1 [FilePath] <string[]> [Reference] <string[]> [Algorithm <string[]> { SHA1 | SHA256 | SHA384 | SHA512 | MACTripleDES | MD5 | RIPEMD160 }]

.EXAMPLE
HshThis.ps1 .\myFile.txt "492e01d5ef25bf97a5ba157d6ae2101e54f1b6965f41f05c5299dc701dc73182" SHA256
#>