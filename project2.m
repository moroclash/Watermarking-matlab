function extractwatermark = project2(cover)
[x,y,z] = size(cover);

extractwatermark = zeros(x,y,z);

for i = 1:x
   for j = 1:y

      % convert cover to 8 bits binary
      arr1R = de2bi(cover(i,j,1),8);
      arr1G = de2bi(cover(i,j,2),8);
      arr1B = de2bi(cover(i,j,3),8);
      % convert hidden image to 8 bits binary
      arr2R = de2bi(extractwatermark(i,j,1),8);
      arr2G = de2bi(extractwatermark(i,j,2),8);
      arr2B = de2bi(extractwatermark(i,j,3),8);

      % lsb algorithm
      arr2R(8) = arr1R(2);
      arr2R(7) = arr1R(1);
      arr2G(8) = arr1G(2);
      arr2G(7) = arr1G(1);
      %arr2B(8) = arr1B(3);
      arr2B(8) = arr1B(2);
      arr2B(7) = arr1B(1);

       extractwatermark(i,j,1) = bi2de(arr2R);
       extractwatermark(i,j,2) = bi2de(arr2G);
       extractwatermark(i,j,3) = bi2de(arr2B);

   end
end

    figure; imshow(extractwatermark);
end