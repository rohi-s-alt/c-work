% Mahabharata Family Tree
wife(kauhshalya,dashrath).
wife(kaikeyi, dashrath).
wife(sumitra, dashrath).
mother(kaushalya,ram).
mother(kaikeyi,bharat).
mother(sumitra,lakshman, shatrughan).
wife(sita,ram).
wife(mandvi,bharat).
wife(urmila,lakshman).
wife(shrutikeerti,shatrughan).
mother(sita,lov,kush).
mother(mandvi,taksha,pushkala).
mother(urmila,angada,chandraketu).
mother(shrutikeerti,subahu,shatrughati).
% ; or/ifelse
% , and
mother(P,Q):-mother(P,Q,R);mother(P,R,Q).
father(F,S):-wife(W,F),mother(W,S).
husband(H,WW):-wife(WW,H).
%son(SS,PP):-father(PP,SS);mother(PP,SS).
son(SS,PP,MM):-father(PP,SS),mother(MM,SS).
fatherinlaw(FIL,DD):-wife(DD,HH),father(FIL,HH).
%motherinlaw(MIL,DD):-fatherinlaw(FF,DD),wife(MIL,FF).
motherinlaw(MIL,DD):-wife(DD,HH),mother(MIL,HH).
