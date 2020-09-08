#! /bin/sh
echo running demo...
echo first we get the input from the user
echo "read -r input"
echo "input is the new variable that is created"
read -r input
echo "we revived $input"
echo now we need to parse it
echo storing passwords in plain text is an awful idea so we hash the text
echo hashing the text turns the text string in to a random set of characters that are hard to decode
echo when you type your password the text is hashed and compared to the database to see if its really you
hash=$(echo -n $input | sha256sum)
echo the hash ok $input is $hash
echo ok lets test it
echo you can play around with it and press ctl - c to finish the demo
while true; do
   echo enter password
   read -r new_input
   echo you typed $new_input
   new_hash=$(echo -n $new_input | sha256sum)
   echo $new_input hashes to $new_hash
   echo lets compare $hash and $new_hash
   if [ "$new_hash" = "$hash" ]; then
      echo they match
   else
      echo wrong passcode
   fi
   
done
