function ConvertTo-CSharp {
    <#
        .SYNOPSIS
        Converts PowerShell code to CSharp

        .DESCRIPTION
        Given some code, the GPT model will return the CSharp equivalent

        .PARAMETER Code
        The code that will be converted to CSharp
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Code
    )
    process {
        $params = @{
            Prompt = "I want you to convert the code inside the curly brackets to CSharp. {$Code}"
        }
        Get-AICompletion @params
    }
}