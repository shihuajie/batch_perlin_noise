function s = myPerlin2D(Spyr, Tpyr)

  % The size of the top level is that of the Tpyr top level
  numLevels = size(Tpyr, 2);
  m = size(Tpyr{1}, 1);
  s = zeros([m,m]);
  w = m;
  i = 0;
  %while w > 3
  level = numLevels;
  while level > 0
    %k = 1 + m/2^i;
    k = size(Tpyr{numLevels-level+1}, 1);
    i = i + 1;
    %d1 = randn([k,k]);
    d1 = randn([k/2,k/2]);
    d1 = imresize(d1, [k, k]);
    d = interp2(d1, i-1, 'spline');
    %s = s + i * d(1:m, 1:m);
    
    pLevel = numLevels - level + 1;
    noiseVar = var(d1(:));
    Svar = var(Spyr{pLevel}(:));
    dmod = (Svar/noiseVar)*d1;
    Tpyr{pLevel} = Tpyr{pLevel} + 1.0*dmod;
    
    %w = w - ceil(w/2 - 1);
    level = level - 1;
  end
  s = 2*(s - min(s(:))) ./ (max(s(:)) - min(s(:))) - 1.0;
  %imagesc(s);
  s = Tpyr;
  
end