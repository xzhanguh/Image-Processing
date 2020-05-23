Develop a Matlab GUI that allows the users to fill holes in the binary image by clicking inside the hole with mouse.
Following are specific requirements:
• Your GUI must provide a button that allows the user to browse and select a binary image, and then show the selected binary image on axes.
• When the user clicks inside the image on GUI, you must use the position of mouse click as the starting point to implement the ‘Hole Filling’ algorithm discussed in class.
• You can use function ginput to read x and y coordinates of mouse click.
• You can use function imdilate to implement the morphological dilation operation.
• You can use function imcomplement to find the complement of a binary image.
• You must show the result image (with filled hole) on GUI.
• You can use the images provided with the assignment to test your algorithm.