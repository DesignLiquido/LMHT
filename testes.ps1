$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.load("$PSScriptRoot\lmht.xslt");
$arquivos = Get-ChildItem -Path "$PSScriptRoot\estruturas"
foreach ($arquivo in $arquivos) {
    Write-Debug $arquivo.Basename
    $xslt.Transform("$PSScriptRoot\estruturas\$arquivo", "$($arquivo.basename).html");
}