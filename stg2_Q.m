'initial general function structure; variables need revising'

function dQdx = stg2_Q(Q_f,Q_p,x,A,L_p,deltaP_r1,deltapi_0);
-dQdx = (A/2) * L_p * (deltaP_r1-(Q_f/Q_p)*deltapi_0);
end
