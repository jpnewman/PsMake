function Scaffold-Empty($psmakeVersion)
{
    Write-Host "Creating $($Context.MakeDirectory)..."
    mkdir $Context.MakeDirectory -ErrorAction SilentlyContinue | Out-Null
    
    Write-Host "Creating make.ps1..."
    $nuArgs=$Context.NuGetArgs
    $cmd = "$($Context.NuGetExe) install psmake -Version $psmakeVersion -OutputDirectory $($Context.MakeDirectory)\psmake -Verbosity detailed $nuArgs"  
    $file = "$($Context.MakeDirectory)\make.ps1"
    Write-Output "$cmd" | Out-File $file
    Write-Output "$($Context.MakeDirectory)\psmake\psmake.$psmakeVersion\psmake.ps1 `@PSBoundParameters" | Out-File $file -append
}

function Scaffold-Project($type, $psmakeVersion)
{
    Write-Host "Scaffolding project type: $type"
    switch ($type) {
        'empty' { Scaffold-Empty $psmakeVersion }
    }
}