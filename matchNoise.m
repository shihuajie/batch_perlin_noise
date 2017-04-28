function res = matchNoise(S, T, numLevels, histMatch)

    
    Spyr = constructPyramid(S, numLevels); % compute the source Laplacian pyramid
    src_hist = imhist(S); % compute the histogram of source progression map
    
    if (histMatch == 1)
        % Perform histogram matching before adding the noise
        T = histeq(T, src_hist); % histogram equalization
    end

    %figure; imshow(B);
    Tpyr = constructPyramid(T, numLevels); % compute the Bump's pyramid
    if (histMatch == 3)
        % do histogram matching on the coarse level only
        src_hist = imhist(Spyr{numLevels});
        Tpyr{numLevels} = histeq(Tpyr{numLevels}, src_hist);
    end
    newT = myPerlin2D(Spyr, Tpyr); % add noise to the pyramid levels
    
    % Reconstruct the noisy map
    s = reconstructPyramid(newT);
    s = (s - min(s(:))) ./ (max(s(:)) - min(s(:)));
    if (histMatch == 2)
        % Perform histogram matching after the noise has been added
        s = histeq(s, src_hist);
    end

    res = s;
    %figure; imshow(S);
    %figure; imshow(res);
    
end
