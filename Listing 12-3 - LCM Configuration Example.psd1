Configuration LCMExample
{
    param ($NODENAME="localhost")
    Node $NODENAME
    {
     LocalConfigurationManager {
        ConfigurationModeFrequencyMins = 45
        ConfigurationMode = "ApplyAndAutocorrect"
        RebootNodeIfNeeded = $true
        AllowModuleOverwrite = $false
        }
     WindowsFeature IIS {
        Ensure = "Present"
        Name = "Web-Server"
        }
     File Scripts {
        Ensure = "Present"
        Type = "Directory"
        SourcePath = "\\scriptserver\Scripts\"
        DestinationPath = "C:\Users\Administrator\Documents\Scripts"
        Recurse = "True"
        }
    }
}