function Laplace = constructPyramid(G, numLevels)

    Gauss = cell(1, numLevels);
    Gauss{1} = G;
    %figure; imshow(Gauss{1});
    for level = 2 : numLevels
        Gauss{level} = imresize(Gauss{level-1}, 0.5);
        %figure; imshow(Gauss{level});
    end
    
    Laplace = cell(1, numLevels);
    variance = zeros(1, numLevels);
    average = zeros(1, numLevels);
    Laplace{numLevels} = Gauss{numLevels};
    %figure; imagesc(Laplace{numLevels});
    for level = numLevels-1 : -1 : 1
        Laplace{level} = Gauss{level} - imresize(Gauss{level+1}, size(Gauss{level}));
        %figure; imagesc(Laplace{level});
        %variance(level) = var(Laplace{level}(:));
        %average(level) = mean(Laplace{level}(:));
    end
    
end