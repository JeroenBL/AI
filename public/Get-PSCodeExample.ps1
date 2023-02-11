function Get-PSCodeExample {
    <#
        .SYNOPSIS
        Return PowerShell code example

        .DESCRIPTION
        Given a question, the GPT model will return a PowerShell code example nested in a MarkDown code block

        .PARAMETER Question
        The question you need a code example for
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Question
    )
    process {
        $params = @{
            Prompt = "I want you to act as a PowerShell expert. I will ask you questions and you will reply with a descriptive answer including a code example in markdown format. If the code example contains parameters, I want you to use splatting. My question: {$Question}"
            MaxTokens = 500
        }
        Get-AICompletion @params
    }
}