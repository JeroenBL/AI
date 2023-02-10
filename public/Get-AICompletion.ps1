function Get-AICompletion {
    [CmdletBinding()]
    <#
        .SYNOPSIS
        Get a completion from the OpenAI GPT API

        .DESCRIPTION
        Given a prompt, GPT will return a predicted completion

        .PARAMETER Prompt
        The prompt to generate a completion for

        .PARAMETER Model
        Name of the model to use. The default model is set to 'text-davinci-003' which is GPT's most advanced model

        .PARAMETER Temperature
        The temperature is used to control the model's likelihood to generate more creative answers. The default value is set to 0

        .PARAMETER MaxTokens
        The maximum number of tokens to generate. By default, this will be 64 if the prompt is not provided, and 1 if a prompt is provided. The maximum is 2048

        .PARAMETER TopP
        Controls how many different words or phrases the language model considers when it’s trying to predict the next word. The default value is set to 0.
    #>
    param (
        [Parameter(Mandatory)]
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