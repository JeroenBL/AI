function ConvertTo-AcademicEnglish {
    <#
        .SYNOPSIS
        Converts an English sentence to academic English

        .DESCRIPTION
        Given a text, the GPT model will return the academic English sentence and also correct grammar and spelling

        .PARAMETER Text
        The text that will be translated to academic English
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Text
    )
    process {
        $params = @{
            Prompt = "I want you to translate the text inside the curly brackets to academic english and also correct grammar and spelling mistakes. {$Text}"
            Temperature = 1
            TopP = 1
        }
        Get-AICompletion @params
    }
}