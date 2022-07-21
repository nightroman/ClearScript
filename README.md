# ClearScript

> **This development is obsolete. The repository will be archived.**

Use the FarNet module `JavaScriptFar` from <https://github.com/nightroman/FarNet>.

---

ClearScript and FarNet lab for Far Manager scripting in JavaScript

### Requirements

- dotnet SDK, for getting packages by paket
- [Invoke-Build](https://github.com/nightroman/Invoke-Build), for automated bootstrapping
- Far Manager with FarNet and PowerShellFar

PowerShellFar is not needed for using ClearScript with FarNet.
But in this lab it is used for connecting all the pieces.

### How to start

Clone the repository and change to its directory.

Invoke this PowerShell command:

```
Invoke-Build init
```

This command downloads the packages and sets the environment variable `ClearScript`.

If you are in Far Manager, restart it, to pick up the new variable `ClearScript`.

Now you can run some JavaScript in Far Manager.

**Repl**

- [ClearScriptReplJS.far.ps1](ClearScriptReplJS.far.ps1)
- [ClearScriptReplV8.far.ps1](ClearScriptReplV8.far.ps1)

These scripts are invoked by PowerShellFar:

```
ps: ./ClearScriptReplJS.far.ps1
```

Type some JavaScript and see the output in the console.
Try FarNet API, for example the exposed variable `far`:

```
far.Message('Hello')
```

**Demo**

- [Hello-World-Editor.jsf.js](Hello-World-Editor.jsf.js)
- [Hello-World-Editor.v8f.js](Hello-World-Editor.v8f.js)

These scripts should be invoked by the corresponding runners:

- [Invoke-ClearScriptJS.ps1](Invoke-ClearScriptJS.ps1)
- [Invoke-ClearScriptV8.ps1](Invoke-ClearScriptV8.ps1)

Example:

```
ps: .\Invoke-ClearScriptJS.ps1 Hello-World-Editor.jsf.js
```

Alternatively, you may create file associations, for example:

```
A file mask or several file masks:
    *.jsf.js
Description of the association:
    ClearScript
Execute command (used for Enter):
    & "$env:ClearScript\Invoke-ClearScriptJS.ps1" (Get-FarPath) #
Execute command (used for Ctrl+PgDn):
    ps: & "$env:ClearScript\Invoke-ClearScriptJS.ps1" (Get-FarPath) -Debugging #
```

Then you can run the demo script simply by `[Enter]`.

### Clean up

When you are done with this lab, restart Far Manager to unlock the used assemblies, and invoke:

```
Invoke-Build kill
```

This command removes the packages and the environment variable `ClearScript`.

### See also

- [ClearScript project](https://github.com/Microsoft/ClearScript)
- [Old article with a sample](https://msdn.microsoft.com/en-us/magazine/dn781353.aspx)
- [Old Far forum post (Russian)](http://forum.farmanager.com/viewtopic.php?p=117676#p117676)
