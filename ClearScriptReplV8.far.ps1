
Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.Core.dll
Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.V8.dll
$js = New-Object Microsoft.ClearScript.V8.V8ScriptEngine

$js.AddHostObject('far', $Far)
for() {
	$code = Read-Host 'js>'
	$js.ExecuteCommand($code)
}
