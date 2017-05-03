The Main executable script is MotionEstimation.m

MotionEstimation.m produces all of the result of this homework, 
    including 8x8 macroblocks, 16x16 macroblocks, 8 , 16 search range
    containing two search method, full-search and 2D-logarithm search
    (16 images totally)
    Also produce the bi-direction reference image.

There is one more script called estimate.m, which called by MotionEstimation
    This script will call two functions,
    one is DividTarget2Macro.m, the other is searchReference.m

DividTarget2macro.m will split the image into single macroblock

searchReference.m will depend on the method, logarithm or full-search 
    to determine the approach to search the minimum SAD, 
    then return the replaced block
