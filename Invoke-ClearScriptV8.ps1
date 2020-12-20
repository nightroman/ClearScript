
param(
	[Parameter(Mandatory=1)]
	[string]$Path
)

$Path = $PSCmdlet.GetUnresolvedProviderPathFromPSPath($Path)
$code = [System.IO.File]::ReadAllText($Path)

Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.Core.dll
Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.V8.dll
$js = New-Object Microsoft.ClearScript.V8.V8ScriptEngine

try {
	$js.AddHostObject('far', $Far)
	$js.Execute($code)
}
finally {
	$js.Dispose()
}
