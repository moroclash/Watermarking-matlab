function watermarkimage = watermark(cover , secret)
    
% get the size of cover
[x,y,z] = size(cover);
% update the size of the image we want to hide to be equal to the cover size
secret = imresize(secret,[x,y]);

for i = 1:x
   for j = 1:y

      % convert cover to 8 bits binary
      arr1R = de2bi(cover(i,j,1),8);
      arr1G = de2bi(cover(i,j,2),8);
      arr1B = de2bi(cover(i,j,3),8);
      % convert hidden image to 8 bits binary
      arr2R = de2bi(secret(i,j,1),8);
      arr2G = de2bi(secret(i,j,2),8);
      arr2B = de2bi(secret(i,j,3),8);

      % lsb algorithm
      arr1R(3) = arr2R(8);
      arr1R(2) = arr2R(7);
      arr1R(1) = arr2R(6);
      arr1G(3) = arr2G(8);
      arr1G(2) = arr2G(7);
      arr1G(1) = arr2G(6);
      arr1B(3) = arr2B(8);
      arr1B(2) = arr2B(7);
      arr1B(1) = arr2B(6);

      cover(i,j,1) = bi2de(arr1R);
      cover(i,j,2) = bi2de(arr1G);
      cover(i,j,3) = bi2de(arr1B);

    end
end
    
    watermarkimage = cover;
    %imshow(watermarkimage);
end


