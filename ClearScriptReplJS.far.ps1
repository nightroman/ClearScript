
Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.Core.dll
Add-Type -Path $env:ClearScript\packages\Microsoft.ClearScript.Core\lib\net45\ClearScript.Windows.dll
$js = New-Object Microsoft.ClearScript.Windows.JScriptEngine

$js.AddHostObject('far', $Far)
for() {
	$code = Read-Host 'js>'
	$js.ExecuteCommand($code)
}
