wife(swarup_rani_nehru,motilal_nehru).
wife(kamala_nehru,jawaharlal_nehru).
wife(vijaya_lakshmi_pandit,ranjit_sitaram_pandit).
wife(krishna_hutheesing,gunottam_p_hutheesing).
wife(indira_gandhi,feroze_gandhi).
wife(helen_armstrong,ajit_hutheesing).
wife(sonia_gandhi,rajiv_gandhi).
wife(maneka_gandhi,sanjay_gandhi).
wife(priyanka_gandhi,robert_vadra).
son(jawaharlal_nehru,swarup_rani_nehru).
son(harsha_hutheesing,krishna_hutheesing).
son(ajit_hutheesing,krishna_hutheesing).
son(rajiv_gandhi,indira_gandhi).
son(sanjay_gandhi,indira_gandhi).
son(rahul_gandhi,sonia_gandhi).
son(varun_gandhi,maneka_gandhi).
son(ralhan_vadra,priyanka_gandhi).
daughter(vijaya_lakshmi_pandit,swarup_rani_nehru).
daughter(krishna_hutheesing,swarup_rani_nehru).
daughter(indira_gandhi,kamala_nehru).
daughter(nayantara_sahgal,vijaya_lakshmi_pandit).
daughter(priyanka_gandhi,sonia_gandhi).
daughter(miraya_vadra,priyanka_gandhi).

father(F,S):-son(S,M),wife(M,F);daughter(S,M),wife(M,F).
mother(M,S):-son(S,M);daughter(S,M).

sibling(S1,S2):-daughter(S1,M),son(S2,M);daughter(S2,M),son(S1,M);son(S1,M),son(S2,M),S1\=S2;daughter(S1,M),daughter(S2,M),S1\=S2.

cousin(C1,C2):-father(X,C1),father(Y,C2),sibling(X,Y);father(X,C1),mother(Y,C2),sibling(X,Y);mother(X,C1),father(Y,C2),sibling(X,Y);mother(X,C1),mother(Y,C2),sibling(X,Y).
