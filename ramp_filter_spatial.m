function img = ramp_filter_spatial(proj)
    [proj_len, num_angles] = size(proj);
    
    % two method to create Ram-Lak filter in spatial domain
    
    % Method 1
    % Ram-Lak filter in spatial doamin
    % h(n) = 1/4 for n = 0
    % h(n) = 0 for n is even
    % h(n) = - 1 / (n^2 * pi^2) for n is odd
    % note that matlab indexing starts with 1 so n=0 is h[1] in matlab
    
%     n = 0:proj_len/2;
%  
%     ramp_filter = zeros(1, proj_len/2); % h(n) = 0 for n is even
%     ramp_filter(1) = 0.25;  % h(n) = 1/4 for n = 0
%     ramp_filter(2:2:end) = - 1./(pi^2.*n(2:2:end).*n(2:2:end)); % h(n) = - 1 / (n^2 * pi^2) for n is odd
% 
%     ramp_filter = [ramp_filter(end:-1:2),ramp_filter];
    
    % Method 2
    % Ram-Lak filter in freq doamin
    % H(v) = abs(v)
    freqs = linspace(-1, 1, proj_len).';
    ramp_filt = abs(freqs);

    % inverse ft of H(v) to get Ram-Lak filter in spatial doamin
    ramp_filt = real(ifftshift(ifft(ramp_filt)))./-2;
    ramp_filt(363) = -ramp_filt(363);
    
    % filter in spatial domain
    filtered = zeros([proj_len, num_angles]);
    
    for idx = 1:num_angles
        filtered(: ,idx) = conv(proj(: ,idx), ramp_filt, 'same');
    end
    img = filtered;
     
end