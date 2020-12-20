
task init {
	exec {dotnet tool restore}
	exec {dotnet paket install}

	[Environment]::SetEnvironmentVariable('ClearScript', $BuildRoot, 'User')

	Copy-Item -Destination packages\Microsoft.ClearScript.Core\lib\net45 @(
		'packages\Microsoft.ClearScript.V8\lib\net45\ClearScript.V8.*'
		'packages\Microsoft.ClearScript.V8.Native.win-x64\runtimes\win-x64\native\ClearScriptV8.win-x64.dll'
		'packages\Microsoft.ClearScript.Windows\lib\net45\ClearScript.Windows.*'
	)
}

task kill {
	remove packages, paket-files, paket.lock
	[Environment]::SetEnvironmentVariable('ClearScript', $null, 'User')
}
