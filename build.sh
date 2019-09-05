# allows you to execute ./build.sh without the bash keyword
chmod +x ./build.sh
# copy across files to distribution directory
mkdir dist
cp ./app.rb ./dist
cp ./contacts.rb ./dist
cp ./test.rb ./dist
# install all gems
gem install letter_opener
gem install colorize 