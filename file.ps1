# Write your PowerShell commands here.

Write-Host "Hello World"

Write-Host "paths:"
$paths = Get-ChildItem -include *.csproj .Recurse
Write-Host $paths

foreach($pathobject in $paths)
{
$path = $pathobject.fullname
Write-Host "Path"
Write-Host $path
$doc = New-Object System.Xml.XmlDocument
$doc.Load($path)
$child = $doc.CreateElement("ProjectGuid")
$child.InnerText = [guid]::NewGuid().ToString().ToUpper()
Write-Host "New Guid"
Write-Host $child.InnerText
$node = $doc.SelectSingleNode("//Project/PropertyGroup")
$node.AppendChild($child)
$doc.Save($path)
Write-Host $doc
}