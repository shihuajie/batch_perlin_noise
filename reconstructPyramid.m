function res = reconstructPyramid(Laplace)

    numLevels = size(Laplace, 2);
    res = Laplace{numLevels};
    for level = numLevels-1 : -1 : 1
        res = imresize(res, size(Laplace{level})) + Laplace{level};
    end
    %figure; imshow(res);

end