function Add-CodeComment {
    <#
        .SYNOPSIS
        Adds code comments for each line

        .DESCRIPTION
        Given some code, the GPT model will regenerate the same code and will add code comments for each line

        .PARAMETER Code
        The code you need to be commented
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Code
    )
    process {
        $params = @{
            Prompt = "I want you to regenerate the code snippet between the curly brackets and include comments for each line of code. {$Code}"
            MaxTokens = 700
        }
        Get-AICompletion @params
    }
}