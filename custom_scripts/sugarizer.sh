#Cloning all Required Repositories
git clone https://github.com/llaske/sugarizer ${R}/home/pi/sugarizer
git clone https://github.com/llaske/sugarizer-server ${R}/home/pi/sugarizer-server
git clone https://github.com/amanharitsh123/RPI3_HOTSPOTS ${R}/home/pi/RPI3_HOTSPOTS

#Copying Docker Images
cp -r ../docker-images ${R}/home/pi/

#Copying all required scripts to the image
cp ../image_scripts/*.sh ${R}/home/pi/
cp ../image_scripts/sugarizer_nginx ${R}/home/pi/
rm ${ETC_DIR}/rc.local
cp ../image_scripts/rc.local ${ETC_DIR}/

#Optimizing Sugarizer
cd ${R}/home/pi/sugarizer
npm install
grunt
cp -r build/* .

#Changing Hostname
echo "SugarizerSchoolBox" > ${ETC_DIR}/hostname
sed -i "s/rpi3-stretch/SugarizerSchoolBox/g" ${ETC_DIR}/hosts

