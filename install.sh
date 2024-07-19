if [ -f /usr/local/bin/save-rm.sh ];
then
  echo "Allready Installed";
  exit 1;
else 
  sudo cp save-rm.sh /usr/local/bin/save-rm.sh;
  echo "Installed! Have fun!";
fi
