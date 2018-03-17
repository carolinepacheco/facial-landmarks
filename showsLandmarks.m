function showsLandmarks(V,CONT,varv,landcont)
%  This function is to shows the landmarks
%  Reference:
%  Silva, Caroline; Schnitman, Leizer ;  Oliveira, Luciano. "Detection of Facial Landmarks
%  Using Local-Based Information". The 19th edition of the Brazilian Conference on Automation - CBA 2012, 
%  Campina Grande, PB, Brazil (oral presentation), September 3, 2012. 
%
%  Copyright 2014 by Caroline Pacheco do E.Silva
%  If you have any problem, please feel free to contact Caroline Pacheco do E.Silva.
%  lolyne.pacheco@gmail.com
%%

Elandmark =  V(1,:);
Dlandmark =  V(2,:);
Slandmark =  V(3,:);
Ilandmark =  V(4,:);
newposIlandmark =  V(5,:);
newposSlandmark =  V(6,:);
existe = CONT(2);

if (landcont == 4)
    
    if (existe == 1)
        
        plot(Elandmark(2)+varv(1,1),Elandmark(1)+varv(1,2),'w.');
        plot(Dlandmark(2)+varv(1,1),Dlandmark(1)+varv(1,2),'w.');
        plot(newposIlandmark(2)+varv(1,1),newposIlandmark(1)+varv(1,2),'w.');
        plot(newposSlandmark(2)+varv(1,1),newposSlandmark(1)+varv(1,2),'w.');
    else
        plot(Elandmark(2)+varv(1,1),Elandmark(1)+varv(1,2),'w.');
        plot(Dlandmark(2)+varv(1,1),Dlandmark(1)+varv(1,2),'w.');
        plot(Slandmark(2)+varv(1,1),Slandmark(1)+varv(1,2),'w.');
        plot(Ilandmark(2)+varv(1,1),Ilandmark(1)+varv(1,2),'w.');
    end
end

if (landcont == 5)
    
    Elandmark =  V(1,:);
    Dlandmark =  V(2,:);
    Slandmark =  V(3,:);
    Ilandmark =  V(4,:);
    newposIlandmark =  V(5,:);
    newposSlandmark =  V(6,:);
    existe = CONT(2);
    de2 = CONT(3);
    
    if (existe == 1)
        plot(Elandmark(2)+varv(1,1),Elandmark(1)+varv(1,2),'w.');
        plot(Dlandmark(2)+varv(1,1),Dlandmark(1)+varv(1,2),'w.');
        plot(newposIlandmark(2)+varv(1,1),newposIlandmark(1)+varv(1,2),'w.');
        plot(newposSlandmark(2)+varv(1,1),newposSlandmark(1)+varv(1,2),'w.');
        plot(newposSlandmark(2)+varv(1,1),newposSlandmark(1)+varv(1,2)+de2,'w.');
    else
        plot(Elandmark(2)+varv(1,1),Elandmark(1)+varv(1,2),'w.');
        plot(Dlandmark(2)+varv(1,1),Dlandmark(1)+varv(1,2),'w.');
        plot(Slandmark(2)+varv(1,1),Slandmark(1)+varv(1,2),'w.');
        plot(Ilandmark(2)+varv(1,1),Ilandmark(1)+varv(1,2),'w.');
        plot(Slandmark(2)+varv(1,1),Slandmark(1)+varv(1,2)+de2,'w.');
    end
end

if (landcont == 2)
    
    Elandmark =  V(1,:);
    Dlandmark =  V(2,:);
    
    plot(Elandmark(2)+varv(1,1),Elandmark(1)+varv(1,2),'w.');
    plot(Dlandmark(2)+varv(1,1),Dlandmark(1)+varv(1,2),'w.');
    
end

end
       