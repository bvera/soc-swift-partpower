#!/bin/bash
# wvera@suse.com
# Tue Mar 15 18:32:59 COT 2016

Usage() {
  echo -e "\nCalculate 2^X Logical Partitions\
  for \n\"SUSE OpenStack Cloud\" Swift Barclamp"
  echo -e "Usage:\n $0 <SOC Swift Nodes> <HDD per Node>\n"
  exit 0
}
[[ $# -eq 2 ]] || Usage
SOC_NODES="$1"
SOC_HDDPNODE="$2"
# SOC6 Uses the first HDD for SO, please consider this
SOC_PW2=$(( $SOC_NODES * $SOC_HDDPNODE * 100 ))

NextPower2="1"
NextPowerCompare="1"
while [ $SOC_PW2 -ge $NextPowerCompare ]; do
        let NextPower2=$NextPower2+1
	NextPowerCompare=$(printf '%s\n' "$(( 2 ** $NextPower2 ))")
done
echo "2^X Logical Partitions,\
for SOC Swift Barclamp: $NextPower2"
