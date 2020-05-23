function AdaptiveMedianFilter(filename,Smax)
    %Smax must be an odd, positive integer greater than 1
    if (Smax <= 1) || (Smax/2 == round(Smax/2)) || (Smax ~= round(Smax))
        error('Smax must be an odd integer >1.')
    end
    
    %read the input image
    img = imread(filename);
    %img=imnoise(img,'salt & pepper',0.2);
    figure;
    subplot(2,2,1);
    imshow(img);
    title('Original image');
    
    % m and n are the number of rows and columns in input image
    [m, n] = size(img);
    
    % extend four edges of input image
    imgn=zeros(m+2*Smax,n+2*Smax);
    imgn(1+Smax:m+Smax,1+Smax:n+Smax)=img;
    imgn(1:Smax,1+Smax:n+Smax)=img(1:Smax,1:n);
    imgn(1:m+Smax,n+Smax+1:n+2*Smax)=imgn(1:m+Smax,n+1:n+Smax);
    imgn(m+Smax+1:m+2*Smax,Smax+1:n+2*Smax)=imgn(m+1:m+Smax,Smax+1:n+2*Smax);
    imgn(1:m+2*Smax,1:Smax)=imgn(1:m+2*Smax,Smax+1:2*Smax);   
    newImg=imgn;
    
    %apdaptive median filter algorithm
    for i=1+Smax:m+Smax
        for j=1+Smax:n+Smax
            s=1; 
            while s~=1+Smax
                W=imgn(i-s:i+s,j-s:j+s);
                W=sort(W(:));
                Imin=min(W(:));
                Imax=max(W(:));
                Imed=W(ceil((2*s+1)^2/2));
                if Imin<Imed && Imed<Imax 
                    break;
                else
                    s=s+1;
                end
            end
            
            if Imin<imgn(i,j) && imgn(i,j)<Imax
                newImg(i,j)=imgn(i,j);
            else
                newImg(i,j)=Imed;
            end
        end
    end
   
    g=newImg(1+Smax:m+Smax,1+Smax:n+Smax);
    
    %read the output image
    subplot(2,2,2);
    imshow(g,[]);
    title('Output(filtered) image');
end
