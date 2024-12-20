# MANUAL STAGE OF DEPLOYMENT

With the architecture now established, we can now build the overall Sparta Global app manually. This involves logging into the Azure portal and following a set of steps to provision the two VMs. 

Please read [AZURE PROVISIONING](AZURE_PROVISIONING.md) for detailed information on this process. 

Once the VMs are provisioned, and you are logged in over an SSH session, you can begin to issue the appropriate commands. The two scripts [db_prov.sh](../sparta_app_deployment_scripts/db_prov.sh) and [app_prov.sh](../sparta_app_deployment_scripts/app_prov.sh) document the commands. 

Essentially, a script is a mere list of commands that are known to work. Once they are proven, they can be assembled like a recipe, which the BASH shell interpreter runs through sequentially from top to bottom, executing each one in turn. 

The advantage of a script is that you just need to run it once, as opposed to running multiple commands - in this way, much time and effort is saved. 

When you look at each script (linked to above), you will see that there are "#" hash marks or Comments above each command. These explain what each command performs. 

It is essential that there are no problems with the scripts when run, otherwise it can be hard to troubleshoot up to what command the script got up to. 

During the evolution of this project - and by that I mean the further stages of automation - it became necessary to refine and prune much of the scripts, since the Azure User Data process would not work otherwise (more on this in [TECHNICAL HURDLES AND BLOCKERS](TECHNICAL_HURDLES_AND_BLOCKERS.md), later in the documentation).