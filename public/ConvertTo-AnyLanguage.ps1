function ConvertTo-AnyLanguage {
    <#
        .SYNOPSIS
        Translates text to any language

        .DESCRIPTION
        Given some text, the GPT model will return the provided text in the specified language

        .PARAMETER Text
        The text that will be translated

        .PARAMETER Language
        The Language to which the text will be translated
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Text,

        [Parameter(Mandatory)]
        [string]
        $Language
    )
    process {
        $params = @{
            Prompt = "I want you to act as an $Language translator, correct spelling and improve my text. You will translate my text, placed inside curly brackets, and answer with the corrected and improved version of my text in $Language. I want you to replace my simplified A0-level words and sentences with more beautiful and elegant, upper level $Language words and sentences. Keep the meaning same, but make them more literary. I want you to only reply with the correction, improvements and nothing else. {$Text}"
            Temperature = 0.3
            TopP = 1
        }
        Get-AICompletion @params
    }
}