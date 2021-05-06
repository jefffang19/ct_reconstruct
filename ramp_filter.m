function img = ramp_filter(proj)
    [proj_len, num_angles] = size(proj);
    
    % Ram-Lak filter
    freqs = linspace(-1, 1, proj_len).';
    ramp_filt = abs(freqs);
    ramp_filt = repmat(ramp_filt, [1 num_angles]);
    
    % FT
    ft_proj = fftshift(fft(proj,[],1),1);
    % filter in FT domain
    filtered_proj = ft_proj .* ramp_filt;
    filtered_proj = ifftshift(filtered_proj,1);
    ift_proj = real(ifft(filtered_proj,[],1));
    
    img = ift_proj;
    
end