function ConvertTo-PowerShell {
    <#
        .SYNOPSIS
        Converts code to PowerShell

        .DESCRIPTION
        Given some code, the GPT model will return the PowerShell equivalent

        .PARAMETER Code
        The code that will be converted to PowerShell
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Code
    )
    process {
        $params = @{
            Prompt = "I want you to convert the code inside the curly brackets to PowerShell. {$Code}"
        }
        Get-AICompletion @params
    }
}