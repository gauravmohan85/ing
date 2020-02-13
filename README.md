# Introduction
The script will be used to load the artifacts from Azure Devops Account. 

# Usage
--debug       &nbsp;&nbsp;&nbsp;Use this parameter to display the URL to download the artifact/file.  
--orgid       Use this parameter to input the Organization Id of the account.  
--projectid   Use this parameter to input the project id of the account.  
--repoid      Use this parameter to input the repository id from where artifact is to be loaded.  
--branchid    Use this parameter to input the branch id.  
--filepath    Use this parameter to input the file path.  

# Example  
bash ali.sh --orgid "gauravmohan185" --projectid "ing" --repoid "samplerep" --branchid "1001" --filepath "test" --debug  

# Notes
1) Currently the command has some url issues with Azure Devops. Will be fixed in next release.  
2) The script needs additional enhancement to connect to Azure Key vault to get the secrets.  

# Version
1.0.0

