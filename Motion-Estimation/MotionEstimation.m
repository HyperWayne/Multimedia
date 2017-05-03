% Load the reference image 

%%
% Size = 320 x 640 x 3
R = im2double(imread('data/frame72.jpg'));
Target = im2double(imread('data/frame73.jpg'));

%%

sizeofMacro = 8;
range = 8;
method = 'full-search';
mode = 'one-direction';
[residualImage_8_8_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_8_full,'data/residualImage_8_8_full_73.jpg');
SAD

sizeofMacro = 8;
range = 16;
method = 'full-search';
mode = 'one-direction';
[residualImage_8_16_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_16_full,'data/residualImage_8_16_full_73.jpg');
SAD

sizeofMacro = 16;
range = 8;
method = 'full-search';
mode = 'one-direction';
[residualImage_16_8_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_16_8_full,'data/residualImage_16_8_full_73.jpg');
SAD

sizeofMacro = 16;
range = 16;
method = 'full-search';
mode = 'one-direction';
[residualImage_16_16_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_16_16_full,'data/residualImage_16_16_full_73.jpg');
SAD

%%

sizeofMacro = 8;
range = 8;
method = '2D-log-search';
mode = 'one-direction';
[residualImage_8_8_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_8_log,'data/residualImage_8_8_log_73.jpg');
SAD

sizeofMacro = 8;
range = 16;
method = '2D-log-search';
mode = 'one-direction';
[residualImage_8_16_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_16_log,'data/residualImage_8_16_log_73.jpg');
SAD

sizeofMacro = 16;
range = 8;
method = '2D-log-search';
mode = 'one-direction';
[residualImage_16_8_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_16_8_log,'data/residualImage_16_8_log_73.jpg');
SAD

sizeofMacro = 16;
range = 16;
method = '2D-log-search';
mode = 'one-direction';
[residualImage_16_16_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_16_16_log,'data/residualImage_16_16_log_73.jpg');
SAD

%%
% Size = 320 x 640 x 3
R = im2double(imread('data/frame72.jpg'));
Target = im2double(imread('data/frame81.jpg'));

%%

sizeofMacro = 8;
range = 8;
method = 'full-search';
mode = 'one-direction';
[residualImage_8_8_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_8_full,'data/residualImage_8_8_full_81.jpg');
SAD

sizeofMacro = 8;
range = 16;
method = 'full-search';
mode = 'one-direction';
[residualImage_8_16_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_16_full,'data/residualImage_8_16_full_81.jpg');
SAD

sizeofMacro = 16;
range = 8;
method = 'full-search';
mode = 'one-direction';
tic
[residualImage_16_8_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
time = toc
imwrite(residualImage_16_8_full,'data/residualImage_16_8_full_81.jpg');
SAD


sizeofMacro = 16;
range = 16;
method = 'full-search';
mode = 'one-direction';
tic
[residualImage_16_16_full, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
time = toc
imwrite(residualImage_16_16_full,'data/residualImage_16_16_full_81.jpg');
SAD

%%

sizeofMacro = 8;
range = 8;
method = '2D-log-search';
mode = 'one-direction';
[residualImage_8_8_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_8_log,'data/residualImage_8_8_log_81.jpg');
SAD


sizeofMacro = 8;
range = 16;
method = '2D-log-search';
mode = 'one-direction';
[residualImage_8_16_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
imwrite(residualImage_8_16_log,'data/residualImage_8_16_log_81.jpg');
SAD


sizeofMacro = 16;
range = 8;
method = '2D-log-search';
mode = 'one-direction';
tic
[residualImage_16_8_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
time = toc
imwrite(residualImage_16_8_log,'data/residualImage_16_8_log_81.jpg');
SAD


sizeofMacro = 16;
range = 16;
method = '2D-log-search';
mode = 'one-direction';
tic
[residualImage_16_16_log, SAD] = estimate(R,Target,sizeofMacro,range,method,mode);
time = toc
imwrite(residualImage_16_16_log,'data/residualImage_16_16_log_81.jpg');
SAD

%%
% Bi-direction 
% Size = 320 x 640 x 3

R_front = im2double(imread('data/frame72.jpg'));
Target = im2double(imread('data/frame81.jpg'));

%%
sizeofMacro = 8;
range = 8;
method = '2D-log-search';
mode = 'bi-direction';
[residualImage, SAD] = estimate(R_front,Target,sizeofMacro,range,method, mode);
imwrite(residualImage,'data/residualImage_8_8_log_bi_direction.jpg');
SAD
