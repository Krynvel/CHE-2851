'initial general function structure; variables need revising'

function dQdx = stg1_Q(Q_f,Q_p,x,A,L_p,deltaP_r1,deltapi_0);
-dQdx = A * L_p * (deltaP_r1-(Q_f/Q_p)*deltapi_0);
end
