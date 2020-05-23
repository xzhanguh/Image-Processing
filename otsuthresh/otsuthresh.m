function otsuthresh(filename)
    %Read the input image
    img = imread(filename);

    %Show the input image
    figure;
    subplot(3,1,1);
    imshow(img);
    title('Input image');
    
    %Find the histogram of input image
    I=reshape(img,[],1);
    Histogram=imhist(I);
    H=reshape(Histogram,[],1);

    Ind=0:255;
    Index=reshape(Ind,[],1);
    
    result=zeros(size([1 256]));

    for i=0:255
    % Weight Calculation
    weight1=sum(H(1:i))/sum(H);
    weight2=sum(H(i+1:255))/sum(H); 
    
    %Mean Calculation
    value=H(1:i).*Index(1:i);
    total=sum(value);
    mean1=total/sum(H(1:i));
    value=H(i+1:255).*Index(i+1:255);
    total=sum(value);
    mean2=total/sum(H(i+1:255));
    
    %Variance calculation.
    value2=(Index(1:i)-mean1).^2;
    numer=sum(value2.*H(1:i));
    var1=numer/sum(H(1:i));
    value2=(Index(i+1:255)-mean2).^2;
    numer=sum(value2.*H(i+1:255));
    var2=numer/sum(H(i+1:255));
    
    result(i+1)=(weight1*var1)+(weight2*var2);     
    end
    
    %Find the minimum value in the array.
    [~,val]=min(result);
    tval = (val-1)/256;
    
    %Show the histogram of input image
    subplot(3,1,2);
    b = bar(H,'FaceColor','flat');
    hold on
    for i = 1:val
       b.CData(i,:) = [0 0.8 0.8];
    end
    for i = val+1:256
       b.CData(i,:) = [0.6 0 0.2];   
    end
    hold off
    title('Histogram of the input image');
     
    %Show the Otsu's threholding image
    bw = im2bw(img,tval);
    subplot(3,1,3);
    imshow(bw);
    title('Otsu''s threholding image');
    
end