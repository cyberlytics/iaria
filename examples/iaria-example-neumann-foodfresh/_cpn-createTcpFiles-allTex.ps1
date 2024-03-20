# Ensure we can run everything
Set-ExecutionPolicy Bypass -Scope Process -Force

# Escape characters in PowerShell: https://ss64.com/ps/syntax-esc.html
Write-Host "== $PSScriptRoot =="

Get-ChildItem $PSScriptRoot -Filter *.tex | Sort-Object Name | % {
	# Remove name-identical TeXnicCenter project (TCP) file
	Remove-Item -Path (Join-Path -Path $_.DirectoryName -ChildPath "$($_.BaseName).tcp") -Force 2> $nul
	
	$relativeFileName = $_.Name
	$tcpTemplate=@"
[FormatInfo]
Type=TeXnicCenterProjectInformation
Version=4

[ProjectInfo]
MainFile=$($relativeFileName)
UseBibTeX=0
UseMakeIndex=0
ActiveProfile=LaTeX ⇨ PDF
ProjectLanguage=de
ProjectDialect=DE

"@

	# Generate name-identical TEX file
	$tcpFileFullName = Join-Path -Path $_.DirectoryName -ChildPath "$($_.BaseName).tcp"
	Out-File -FilePath $tcpFileFullName -InputObject $tcpTemplate -Encoding ASCII -Width 50

}

Write-Host "Press ENTER to continue..."
cmd /c Pause | Out-Null
