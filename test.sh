tr -d '\n'  < temp > temp2

cat temp2 | sed 's/" Align : <a href="http:\/\/127.0.0.1:5000\/#”>  "//g' | sed ’s/" Hair : <a href="http:\/\/127.0.0.1:5000\/#”>  //g' | sed 's/ Eye : <a href="http:\/\/127.0.0.1:5000\/#">  //g' | sed 's/ Identity : <a href="http:\/\/127.0.0.1:5000\/#”>  //g' |  sed 's/ Sex : <a href="http:\/\/127.0.0.1:5000\/#">  //g' | sed 's/ Alive : <a href="http:\/\/127.0.0.1:5000\/#">  //g' |  sed 's/ Appearances : <a href="http:\/\/127.0.0.1:5000\/#">  //g' |  sed 's/ First Appearance : <a href="http:\/\/127.0.0.1:5000\/#">  //g' | sed 's/ Year : <a href="http:\/\/127.0.0.1:5000\/#">  //g' > temp3

cat temp3 | sed ’s/ <\/a>//g | sed ’s/<p class="h4”>//g > temp4



cat temp2 | sed 's/ Align : <a href="http:\/\/127.0.0.1:5000\/#">//g' > temp3
cat temp4 | sed 's/ Year : <a href="http:\/\/127.0.0.1:5000\/#">//g' | sed 's/ Alive : <a href="http:\/\/127.0.0.1:5000\/#">//g' | sed 's/ Eye : <a href="http:\/\/127.0.0.1:5000\/#">//g' | sed 's/ First Appearance : <a href="http:\/\/127.0.0.1:5000\/#">//g' | sed 's/ Sex : <a href="http:\/\/127.0.0.1:5000\/#">//g' > temp5

cat temp5 | sed 's/ Appearances : <a href="http:\/\/127.0.0.1:5000\/#">//g' | sed 's/ Appearances : <a href="http:\/\/127.0.0.1:5000\/#">//g' > temp6


cat temp7 | sed 's/<p class="h2">/<\/tr><tr><td>/g' > temp8
cat temp8 | sed 's/<p class="h4">/<td>/g' > temp9
cat temp9 | sed 's/<\/p>/<\/td>/g' > temp10
cat temp10 | sed 's/<h2>/<\/tr><tr><td>/g' > temp11

cat temp11 | sed 's/<\/h2>/<\/td>/g' > temp12
cat temp12 | sed 's/<h4>/<td>/g' > temp13
cat temp14 | sed 's/<\/h4>/<\/td>/g' > temp14
