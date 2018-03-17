function [V, CONT] = detectLandmarks(canny,resize,landcont)
%  This function is to detect the landmarks
%  Reference:
%  Silva, Caroline; Schnitman, Leizer ;  Oliveira, Luciano. "Detection of Facial Landmarks
%  Using Local-Based Information". The 19th edition of the Brazilian Conference on Automation - CBA 2012, 
%  Campina Grande, PB, Brazil (oral presentation), September 3, 2012. 
%
%  Copyright 2014 by Caroline Pacheco do E.Silva
%  If you have any problem, please feel free to contact Caroline Pacheco do E.Silva.
%  lolyne.pacheco@gmail.com
%%

existe=0;
[l,c] = size(canny);
trans = l / 2;
n = uint8(trans);
trans = c / 2;
m = uint8(trans);
jantesq = m;
jantdir = m + 1;
b_superior = n;
b_inferior = n + 1;

if (landcont==4) || (landcont==2)
    
    for i = 1:1:l
        for j = 1:1:c
            if canny(i,j)> 0 && j <= jantesq  % find the position of the point of interest on the left side of the mouth
                jantesq = j;
                E= [i,j];
            end
            
            if canny(i,j)> 0 && j >= jantdir  % find the position of the point of interest on the left of the right
                jantdir = j;
                D = [i,j];
                
            end
            
            if canny(i,j)> 0 && i <= b_superior  % find the positions of points of interest of the upper lip
                b_superior = i;
                S = [i,j];
            end
            
            if canny(i,j)> 0 && i >= b_inferior  % find the positions of points of interest of the lower lip
                b_inferior = i;
                I = [i,j];
            end
        end
    end
    
    if ((exist('D','var')) && (exist('E','var')) && (exist('S','var')) && (exist('I','var')))
        % Correction position of the upper and mouth
        col_middle = calDistance(D(2), E(2));
        find_middle = (col_middle+1)/2;
        novapos = E(2) + find_middle;
        newposS = [S(1),novapos];
        newposI = [I(1),novapos];
        
        existe = 1;
    end
    
    if (~exist('E','var'))
        E = [-1,-1];
    end
    
    if (~exist('D','var'))
        D =  [-1,-1];
    end
    
    if (~exist('S','var'))
        S =  [-1,-1];
    end
    
    if (~exist('I','var'))
        I =  [-1,-1];
    end
    
    if (~exist('newposI','var'))
        newposI = [-1,-1];
    end
    
    if (~exist('newposS','var'))
        newposS =  [-1,-1];
    end
    
    V = [E/resize;
        D/resize;
        S/resize;
        I/resize;
        newposI/resize;
        newposS/resize];
    CONT(1) = 0;
    CONT(2) = existe;
    CONT(3)= 0;
    
end

if (landcont == 5)
    
    for i = 1:1:l
        for j = 1:1:c
            if canny(i,j)> 0 && j <= jantesq  % find the position of the point of interest on the left side of the mouth
                jantesq = j;
                E= [i,j];
            end
            
            if canny(i,j)> 0 && j >= jantdir  % find the position of the point of interest on the left of the right
                jantdir = j;
                D = [i,j];
            end
            
            if canny(i,j)> 0 && i <= b_superior  % find the positions of points of interest of the upper lip
                b_superior = i;
                S = [i,j];
            end
            
            if canny(i,j)> 0 && i >= b_inferior  % find the positions of points of interest of the lower lip
                b_inferior = i;
                I = [i,j];
            end
        end
    end
    
    if ((exist('D','var')) && (exist('E','var')) && (exist('S','var')) && (exist('I','var')))
        % Correction position of the upper and mouth
        col_middle = calDistance(D(2), E(2));
        find_middle = (col_middle+1)/2;
        novapos = E(2) + find_middle;
        newposS = [S(1),novapos];
        newposI = [I(1),novapos];
        existe = 1;
    end
    
    if (~exist('E','var'))
        E = [-1,-1];
    end
    
    if (~exist('D','var'))
        D =  [-1,-1];
    end
    
    if (~exist('S','var'))
        S =  [-1,-1];
    end
    
    if (~exist('I','var'))
        I =  [-1,-1];
    end
    
    if (~exist('newposI','var'))
        newposI = [-1,-1];
    end
    
    if (~exist('newposS','var'))
        newposS =  [-1,-1];
    end
    
    if ((S(1)~=-1) && (S(2)~=-1) && (newposS(1)==-1) && (newposS(2)==-1)) && ((I(1)~=-1) && (I(2)~=-1) && (newposI(1)==-1) && (newposI(2)==-1))
        S_Euclidiana  = calDistance(S, I);
        dists = S_Euclidiana/2;
        de2 = dists/resize;
    end
    
    if ((S(1)~=-1) && (S(2)~=-1) && (newposS(1)~=--1) && (newposS(2)~=--1)) && ((I(1)~=-1) && (I(2)~=-1) && (newposI(1)~=-1) && (newposI(2)~=-1))
        S_Euclidiana  = calDistance(newposS, newposI);
        distseyeRight= S_Euclidiana/2;
        de2 = distseyeRight/resize;
    end
    
    V = [E/resize;
        D/resize;
        S/resize;
        I/resize;
        newposI/resize;
        newposS/resize
        ];
    CONT(1) = 0;
    CONT(2) = existe;
    if (exist('de2','var'))
        CONT(3)= de2;
    end
end

end