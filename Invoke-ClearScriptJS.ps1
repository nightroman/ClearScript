
param(
	[Parameter(Mandatory=1)]
	[string]$Path,
	[switch]$Debugging
)

$Path = $PSCmdlet.GetUnresolvedProviderPathFromPSPath($Path)
$code = [System.IO.File]::ReadAllText($Path)

Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.Core.dll
Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.Windows.dll
if ($Debugging) {
	$js = New-Object Microsoft.ClearScript.Windows.JScriptEngine ([Microsoft.ClearScript.Windows.WindowsScriptEngineFlags]3)
	$code = "debugger;`r`n$code"
}
else {
	$js = New-Object Microsoft.ClearScript.Windows.JScriptEngine
}

try {
	$js.AddHostObject('far', $Far)
	$js.Execute($code)
}
finally {
	$js.Dispose()
}
