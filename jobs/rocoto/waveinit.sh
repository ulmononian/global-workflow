#!/bin/bash -x

###############################################################
echo
echo "=============== START TO SOURCE FV3GFS WORKFLOW MODULES ==============="
. $HOMEgfs/ush/load_fv3gfs_modules.sh
status=$?
[[ $status -ne 0 ]] && exit $status

###############################################################
echo
echo "=============== START TO RUN WAVE INIT ==============="
# Execute the JJOB
$HOMEgfs/jobs/JGLOBAL_WAVE_INIT
status=$?
[[ $status -ne 0 ]] && exit $status

###############################################################
# Force Exit out cleanly
if [ ${KEEPDATA:-"NO"} = "NO" ] ; then rm -rf $DATAROOT ; fi
exit 0
