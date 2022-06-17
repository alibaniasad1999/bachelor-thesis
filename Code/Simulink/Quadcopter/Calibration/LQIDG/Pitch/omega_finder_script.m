%% get omega %%
load('omega.mat')
omega = zeros(4, 751);
for i = 0:4003
    omega(mod(i, 4)+1, floor(i/4)+1) = out.simout(1, i+1);
end
omega = omega';