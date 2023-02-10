function ConvertTo-MeetingSummary {
    <#
        .SYNOPSIS
        Converts short descriptive notes to a summary

        .DESCRIPTION
        Given some text, the GPT model will return the summary

        .PARAMETER Text
        The text that will be converted to a short summary
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]
        $Text
    )
    process {
        $params = @{
            Prompt = "Convert my short hand notes inside the curly brackets into a first-hand account of the meeting: {$Text}"
        }
        Get-AICompletion @params
    }
}