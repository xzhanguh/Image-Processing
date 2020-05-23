function [g] = Negative(filename)
    %Read the image
    f = imread(filename);
    %Get the size of the image
    [w,h] = size(f);
    %Invert the image
    for i=1:w
        for j=1:h
            g(i,j) = 255 - f(i,j);
        end
    end
    %Show the negative image
    figure;
    imshow(g);
    %Save the negative image
    imwrite(g,'negative.tif');
end

