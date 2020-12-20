
var editor = far.CreateEditor()
editor.FileName = 'Test.txt'
editor.Open()
editor.Add('Hello World')
editor.Redraw()

far.Message('Continue')
far.PostMacro('Keys("Esc Right Enter")')
