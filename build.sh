# allows you to execute ./build.sh without the bash keyword
chmod +x ./build.sh
# copy across files to distribution directory
mkdir dist
cp ./af-helper.rb ./dist
cp ./chadsvasccalc.rb ./dist
cp ./medications.rb ./dist
cp ./resultviewer.rb ./dist
cp ./patient-class.rb ./dist
cp ./druglist.csv ./dist
cp ./cvresult.csv ./dist

# install all gems
gem install terminal-table
gem install colorize
gem install tty-prompt
gem install tty-font

# bash ./build.sh