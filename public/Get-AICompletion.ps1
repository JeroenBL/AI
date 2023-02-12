function Get-AICompletion {
    [CmdletBinding()]
    <#
        .SYNOPSIS
        Returns a completion from the OpenAI API

        .DESCRIPTION
        Given a prompt, the OpenAI API will return a predicted completion

        .PARAMETER Prompt
        The prompt to generate a completion for

        .PARAMETER Model
        Name of the model to use. The default model is set to 'text-davinci-003' which is GPT's most advanced model

        .PARAMETER Temperature
        The temperature controls the model's level of creativity when generating responses. A higher temperature value will result in the model generating more creative or diverse answers, while a lower temperature value will result in the model generating more conservative and predictable responses. The default temperature value is set to 0.

        .PARAMETER MaxTokens
        The maximum number of tokens to generate. The default value is set to 256.

        .PARAMETER TopP
        Controls how many different words or phrases the language model considers when it’s trying to predict the next word. The default value is set to 0.
    #>
    param (
        [Parameter(Mandatory, ValueFromPipeLine)]
        [string]
        $Prompt,

        [Parameter()]
        [ValidateSet('text-davinci-003', 'text-curie-001', 'text-babbage-001', 'text-ada-001', 'code-cushman-001', 'code-davinci-001')]
        [string]
        $Model = 'text-davinci-003',

        [Parameter()]
        [ValidateSet(0,1)]
        [int]
        $Temperature = 0,

        [Parameter()]
        [ValidateSet(0,2048)]
        [int]
        $MaxTokens = 256,

        [Parameter()]
        [ValidateSet(0,1)]
        [int]
        $TopP = 0
    )
    try {
        $splatParams = @{
            Uri     = 'https://api.openai.com/v1/completions'
            Method  = 'POST'
            Headers = @{
                Authorization = "Bearer $((Get-ItemProperty 'HKCU:\SOFTWARE\AI\').APIKey)"
            }
            Body = @{
                prompt      = $Prompt
                model       = $Model
                temperature = $Temperature
                max_tokens  = $MaxTokens
                top_p       = $TopP
            } | ConvertTo-Json
            ContentType = 'application/json'
        }
        $response = Invoke-RestMethod @splatParams
        $response.choices.text
    } catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}