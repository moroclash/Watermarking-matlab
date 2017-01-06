function EImage = OPAP( CImage , SImage , x )

k = x;
c = power(2,k);
c1 = power(2,k-1);
EImage = SImage;
for i = 1 : numel(CImage)
    error = SImage(i) - CImage(i);
    if ((c1<error)&&(error<c))
        if (SImage(i)>=c)
            EImage(i) = (SImage(i)-c);
        end
        if (SImage(i)<c)
            EImage(i) = EImage(i);
        end
    end
    if ((-c<error)&&(error<-c1))
        if (SImage(i)<(256-c))
            EImage(i) = (SImage(i)+c);
        end
        if (SImage(i)>=(256-c))
            EImage(i) = EImage(i);
        end
    end
end

end

