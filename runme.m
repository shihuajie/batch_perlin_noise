d = str2num(input('please input id range :', 's'));
s = d(1);
e = d(2);

B = im2double(imread('trg_gc.png'));

for i = s:e
    dir_path = ['maps' filesep num2str(i)];
    fname = [dir_path filesep 'src_gc.png'];
    G = im2double(imread(fname));

    rng(i);
    res = matchNoise(G, B, 7, 3);
    fname = [dir_path filesep 'trg_gc.png'];
    imwrite(res, fname);
end
