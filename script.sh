#!/bin/bash

# A POSIX variable
OPTIND=1

dsym_binary=""
crash_log=""

while [[ "$#" > 0 ]]; do case $1 in
  -d|--dsym) dsym_binary="$2"; shift; shift;;
  -c|--crash_log) crash_log="$2"; shift; shift;;
  *) echo -e "Usage: $0 [-d,--dsym         Path to .dsym file ]\n\t\t   [-c,--crash_log    Path to .crash file]";  exit 1;;
esac; done

echo "Using crash log [$crash_log] file" 
echo "Using dsym [$dsym_binary] file"

cp $crash_log{,.bak}

while read -r line
do
	token_array=($line)
	if [ ${#token_array[@]} -eq 6 ]
	then
		if [ ${token_array[4]} = "+" ]
		then
			load_address=${token_array[3]}
			address_to_symbolicate=${token_array[2]}
			symbolicated_address=$(atos -arch arm64 -o $dsym_binary -l $load_address $address_to_symbolicate)
			replace_string="${token_array[3]} ${token_array[4]} ${token_array[5]}"
			sed -i'' -e "s/$replace_string/$symbolicated_address/g" "$crash_log"
		fi
	fi
done < "$crash_log"

echo "Done!"

