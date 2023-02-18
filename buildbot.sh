read -p "Curent rom prefix:" rom1
read -p "New rom prefix:" rom2
read -p "Device codename:" device
find . -not -path "*/.*" -name "*.mk" -type f -exec sed -i "s/${rom1}/${rom2}/g" {} +
mv ${rom1}_${device}.mk ${rom2}_${device}.mk
