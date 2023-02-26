function Get-AIModels {
    [CmdletBinding()]
    param()

    try {
        $splatParams = @{
            Uri     = 'https://api.openai.com/v1/models'
            Method  = 'GET'
            Headers = @{
                Authorization = "Bearer $((Get-ItemProperty 'HKCU:\SOFTWARE\AI\').APIKey)"
            }
        }
        Invoke-RestMethod @splatParams
    } catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}