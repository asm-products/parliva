rm -rf client/ls-compiled
rm -rf public/ls-compiled
rm -rf server/ls-compiled
rm -rf lib/ls-compiled

lsc --bare -o client/ls-compiled -cw client &
lsc --bare -o public/ls-compiled -cw public &
lsc --bare -o server/ls-compiled -cw server &
lsc --bare -o lib/ls-compiled -cw lib &
wait
