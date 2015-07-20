Configuration LCMExample
{
    Node “localhost”
    {
        LocalConfigurationManager
        {
            ConfigurationModeFrequencyMins = 45
            ConfigurationMode = "ApplyAndAutocorrect"
            RebootNodeIfNeeded = $true
            AllowModuleOverwrite = $false
        }
       # Resource blocks added below when needed
    }
# Apply the configuration by entering the following in PowerShell

$path = "C:\Users\Administrator\Documents\DevOps"
# The following line invokes the configuration and creates a file called Server001.meta.mof at the specified path
LCMExample -OutputPath $path
Set-DscLocalConfigurationManager -Path $path
