if ($MyInvocation.line -match '-verbose'){
    $VerbosePreference = 'Continue'
}

try {
    Write-Verbose 'Importing public functions'

    $public = @( Get-ChildItem -Recurse -Path $PSScriptRoot\public\*.ps1 -ErrorAction Stop )
    foreach($psFile in @($public)) {
        . $psFile.FullName
    }
} catch {
    throw $_
}

Export-ModuleMember -Function $public.Basename