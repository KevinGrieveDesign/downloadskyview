#!/bin/bash

echo "Starting Script..."

configFile=$1
Catalogue=""

if [ -z $configFile ]; then
	configFile="config.txt"
fi

echo "Reading configs from: $configFile"

configLocation="Start"
echo $configLocation

exec<$configFile

while IFS="=" read variable value
do
	if [ -z $value ]; then
		if [ "$variable" == "General Settings" ]; then
			configLocation="GeneralSettings"
			echo $configLocation
		elif [ "$variable" = "Catalogue Settings" ]; then
			configLocation="CatalogueSettings"
			echo $configLocation
		elif [ "$variable" == "Folders" ]; then
			configLocation="FolderDec"
			echo $configLocation
		elif [ "$variable" == "Folder Rules" ]; then
			configLocation="FolderRules"
			echo $configLocation
		elif [ "$variable" == "Skyview Settings" ]; then
			configLocation="SkyviewSettings"
			echo $configLocation
		fi 	
	else
		if [ $configLocation == "GeneralSettings" ]; then
			if [ $variable == "Catalogue" ]; then
				Catalogue=$value
				echo "	Catalogue: $Catalogue"
			fi
		elif [ $configLocation == "CatalogueSettings" ]; then
			if [ $variable == "EmmissionName" ]; then
				EmmissionNameColumn=$value
				echo "	EmmissionNameValue: $EmmissionNameColumn"
			fi

			if [ $variable == "Glon" ]; then
				GlonColumn=$value
				echo "	GlonColumn: $GlonColumn"
			fi

			if [ $variable == "Glat" ]; then
				GlatColumn=$value
				echo "	GlatColumn: $GlatColumn"
			fi
	
			if [ $variable == "Voxel" ]; then
				VoxelColumn=$value
				echo "	VoxelColumn: $VoxelColumn"
			fi
		elif [ $configLocation == "FolderDec" ]; then
			 echo "here"
		elif [ $configLocation == "FolderRules" ]; then
			 echo "here"
		elif [ $configLocation == "SkyviewSettings" ]; then
			if [ $variable == "Survey" ]; then
				Survey=$value
				echo "	Survey: $Survey"
			fi
			
			if [ $variable == "Projection" ]; then
				Projection=$value
				echo "	Projection: $Projection"
			fi

			if [ $variable == "Coordinates" ]; then
				Coordinates=$value
				echo "	Coordinates: $Coordinates"			
			fi

			if [ $variable == "Quicklook" ]; then
				Quicklook=$value
				echo "	Quicklook: $Quicklook"
			fi

			if [ $variable == "Size" ]; then
				Size=$value
				echo "	Size: $Size"
			fi

			if [ $variable == "Pixel" ]; then
				Pixel=$value
				echo "	Pixel: $Pixel"
			fi
		fi	
	fi 
done 

count=0 
completedcount=0
highestnVox=0
highestnPix=0



exec<$Catalogue

#while IFS=, read col1 col2 col3 col4 col5 col6 col7 col8 col9 col10 col11 col12 col13 col14 col15 col16 col17 col18 col19 col20 col21 col22 col23 col24 col25 col26 col27 col28 col29 col30 col31 col32 col33


while IFS="\n" read line
do
	fieldCount=1
	((count++))

	IFS=','
	LineInArray=$line

	for x in $LineInArray
	do
		LineInArray[$fieldCount]=$x	
		((fieldCount++))
	done
	
	if [ $count != 1 ]; then	
		if [ ${LineInArray[$VoxelColumn]} -gt "100" ]; then
			if [ $completedcount = 10000 ]; then
				break;
			fi
			
#			if [ $(bc <<< "$highestnVox < $col20") -eq 1 ]; then
#				(($highestnVox = $col20))
#			fi

#			if [ $(bc <<< "$highestnPix < $col19") -eq 1 ]; then
#				$highestnPix = $col19
#			fi
					
			echo "Glong: ${LineInArray[$GlonColumn]}, Glat: ${LineInArray[$GlatColumn]}, nVox: ${LineInArray[$VoxelColumn]}"
		
			if [ $(bc <<< "${LineInArray[$GlonColumn]} >= 290.0") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 300.0") -eq 1 ]; then
				folderlocation="01.G290.0-300.0/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 300.0") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 310.3") -eq 1 ]; then
				folderlocation="02.G300.0-310.3/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 310.3") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 320.0") -eq 1 ]; then
				folderlocation="03.G310.3-320.0/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 320.0") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 330.0") -eq 1 ]; then
					folderlocation="04.G320.0-330.0/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 330.0") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 340.0") -eq 1 ]; then
					folderlocation="05.G330.0-340.0/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 340.0") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 349.7") -eq 1 ]; then
					folderlocation="06.G340.0-349.7/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 349.7") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 357.3") -eq 1 ]; then
					folderlocation="07.G349.7-357.3/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 357.3") -eq 1 ] || [ $(bc <<< "${LineInArray[$GlonColumn]} <= 003.9") -eq 1 ]; then
					folderlocation="08.G357.3-003.9/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 003.9") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 009.8") -eq 1 ]; then
				folderlocation="09.G003.9-009.8/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 009.8") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 020.0") -eq 1 ]; then
					folderlocation="10.G009.8-020.0/images/"
			elif [ $(bc <<< "${LineInArray[$GlonColumn]} >= 020.0") -eq 1 ] && [ $(bc <<< "${LineInArray[$GlonColumn]} <= 030.0") -eq 1 ]; then
				folderlocation="11.G020.0-030.0/images/"
			else
				folderlocation="images/"
			fi
		
			#do these surveys on the first pass
			#dss,wise22,2massk
			
			pixels="pixels=1800"
			projection=Arc
			size=0.5
			coordinates=galactic
			position="${LineInArray[$GlonColumn]},${LineInArray[$GlatColumn]}"
		        	
			IFS=','
			arr2=$Survey

			for y in $arr2
			do
				mkdir $folderlocation$y
				output="$folderlocation$y/${LineInArray[EmmissionNameColumn]}"
    				java -jar skyview.jar survey=$y projection=$projection Size=$size coordinates=$coordinates position=${LineInArray[$GlonColumn]},${LineInArray[GlatColumn]} $pixels output="$output-$y" / quicklook=jpg nofits
echo $output
			done

			IFS=$OIFS
			
			((completedcount++))
		fi
	fi
done 

echo "Amount Completed: $completedcount, Highest nVox: $highestnVox, Highest nPix: $highestnPix"
