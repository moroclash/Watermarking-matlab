function secret = Extractwatermark(cover)
[x,y,z] = size(cover);

secret = zeros(x,y,z);

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
      arr2R(8) = arr1R(3);
      arr2R(7) = arr1R(2);
      arr2R(6) = arr1R(1);
      arr2G(8) = arr1G(3);
      arr2G(7) = arr1G(2);
      arr2G(6) = arr1G(1);
      arr2B(8) = arr1B(3);
      arr2B(7) = arr1B(2);
      arr2B(6) = arr1B(1);

       secret(i,j,1) = bi2de(arr2R);
       secret(i,j,2) = bi2de(arr2G);
       secret(i,j,3) = bi2de(arr2B);

   end
end

end
