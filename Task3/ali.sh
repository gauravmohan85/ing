#!/bin/sh

ORGID=""
PROJECTID=""
REPOID=""
BRANCHID=""
FILEPATH=""
DEBUGMODE="false"

function usage()
{
    echo "This command is used to get artifacts from Azure Devops"
    echo ""
    echo "--debug    		Prints the download URL to the standard out"
    echo "--orgid    		Organization Id under Azure DevOps Account"
    echo "--projectid		ProjectId under Azure DevOps Organization"
    echo "--repoid		Repository Id where file is located"
    echo "--branchid              Branch Id of repository"
    echo "--filepath		Filepath of file to be downloaded"
    
}

function create_download_url()
{
	local dloadURL="https://dev.azure.com/$ORGID/$PROJECTID/_apis/git/repositories/$REPOID/items?path=$FILEPATH&api-version=5.1"
	echo $dloadURL
}

while [ "$1" != "" ]; do
   
   PARAM=`echo $1 | awk -F= '{print $1}'`
 
   case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --debug)
            DEBUGMODE="true"
            ;;
		--orgid)
			ORGID=$2
			shift
            ;;
		 --projectid)
			PROJECTID=$2
			shift
            ;;
		--repoid)
			REPOID=$2
			shift
            ;;
		--branchid)
			BRANCHID=$2
			shift
            ;;
        	--filepath)
            		FILEPATH=$2
			shift
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

dloadURL=$(create_download_url)

if ("$DEBUGMODE" == "true");
then
echo $dloadURL
else
curl $dloadURL
fi

echo "Debug mode is $DEBUGMODE";
echo "OrgId value is $ORGID";
echo "Project Id value is $PROJECTID";
echo "Repo Id is $REPOID";
echo "Branch Id is $BRANCHID";
echo "Filepath is $FILEPATH";
