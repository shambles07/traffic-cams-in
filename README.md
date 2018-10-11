# traffic-cams-in
Pull images from Indiana traffic cameras into subdirectories.

The script currently uses a list of working cameras listed in the good-cams.txt file. Using wget, this script pulls the images from the open directory they are hosted in (they are updated once per minute) and places them into subdirectories based on their subnet.

Future plans for the script are to use ImageMagick to compare the files, allowing traffic information to be checked directly from the command line. Also, the good-cams.txt file can be negated in the future by comparing file sizes of the images (although this may be slightly flawed, as working camera image files can end up being the same size).
