This script is used to look at your catalogue (csv format only) and use the coordinates to download images from other surveys.

As of 15/10/2012 it is in a development stage and will i will make it more robust, be able to handle more parameters and be able to dynamically accept what folders the images will be placed in as well as the rules for each. 

The way to run it is as per usual "./downloadskyviewimages.sh" . This will firstly look up config file. If none is specified in the cmmand line then it will default to looking for config.txt

THE ORDER AND STRUCTRE OF THE CONFIG FILE IS VERY IMPORTANT!!!!!!

do not put any "=" in your descriptions as this WILL break it. For an example config see end of file. 

All the desciptions about your config file go at the top. Then the first section of "General Settings". 

"General Settings" currently (15/10/2012) only has one parameter, this is the Catalogue. This is how you define the csv file it is to read.  

eg. "Catalogue=HOPS_HCCCN-DuchampCat.csv"

The next section is the "Catalogue Settings". This has 4 settings as of 15/10/2012. "EmmissionName", "Glon", "Glat" and "Voxel". These are used to define what column your data lies in i.e 1,2,3, ect..

e.g. In this example the emmission name is in column 1 with the galatic long in column 3.

EmmissionName=1

Glon=3

Glat=4

Voxel=20

The next section is "Folders". As of 15/10/2012 this does not do anything. When it is implemented it will define the folders for the script to place images into.

Th next section is "Folder Rules". As of 15/10/2012 this does nothing. When it is built is will have two functions. This will first have a param of "Rule". This will take a olumn number for the sorting rule to be run on. After this, one or two params per line will be accepted. This will be the limits for the folders to properly sort the downloaded images. 

The next section is "Skyview Settings". This is where skyview is told to perform its task with certain params. 
Currenty the list of params is "Survey", "Projection", "Coordinates", "Size" and "Pixel"


The function of these params is explained in more detail here -- http://skyview.gsfc.nasa.gov/jar/skyviewinajar.html

if you require changes/updates please ask and lodge a ticket so we can all keep track of development. To lodge a ticket please goto appsuws.scem.uws.edu.au/projectmanagement/login.aspx. You will need a login for this and i can and will provide you one.

PLEASE EMAIL/TEXT ME AT THE SAME TIME. 



----------EXAMPLE CONFIG------------


General Settings

Catalogue=../HOPS_HCCCN-DuchampCat.csv



Catalogue Settings

EmmissionName=1

Glon=3

Glat=4

Voxel=20



Folders






Folder Rules




Skyview Settings

Survey=wise,wise12

Projection=Arc

Coordinates=galactic

Quicklook=jpgnofits

Size=0.5

Pixel=100




