function FrequencyFilter(filename,kind,type,D0,n)
    f = imread(filename);
    f=im2double(f);
    
    figure;
    subplot(2,2,1);
    imshow(f);
    title('Input Image');
    
    PQ = paddedsize(size(f));
    F = fft2(f,PQ(1),PQ(2));
    F_powerspectrum = abs(F);
    Fs = fftshift(F_powerspectrum);
    F_logTransform=log(1+Fs);
    subplot(2,2,2);
    imshow(F_logTransform, []);
    title('Power Spectrum');
    
    if kind == "low"
        H = lpfilter(type,PQ(1),PQ(2),D0,n);
    else
        H = hpfilter(type,PQ(1),PQ(2),D0,n);
    end
    
    G = H.*F;
    G_powerspectrum = abs(G);
    Gs = fftshift(G_powerspectrum);
    G_logTransform=log(1+Gs);
    subplot(2,2,3);
    imshow(G_logTransform, []);
    title('Filtered Power Spectrum');
    
    g = real(ifft2(G));
    g = g(1:size(f,1), 1:size(f,2));
    subplot(2,2,4);
    imshow(g, []);
    title('Filtered Image');
    
end

