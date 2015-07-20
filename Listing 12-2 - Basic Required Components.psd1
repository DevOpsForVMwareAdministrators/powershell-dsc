Configuration Test01
{
    param ($NODENAME="localhost")
    Node $NODENAME
    {
     WindowsFeature IIS {
        Ensure = "Present"
        Name = "Web-Server"
        }
    }
}