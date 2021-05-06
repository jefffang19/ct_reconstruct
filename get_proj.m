function proj = get_proj(img, degree)
    pad_len = sqrt(512^2+512^2);
    % 1d projection collect
    proj_collect = zeros(cast(pad_len, 'int32'), 180/degree+1);


    freq_i = 1;
    for i=0:degree:180
        J = imrotate(img,i,'bilinear','crop'); 
        % projection
        projection = sum(J, 2);

        proj_collect(:, freq_i) = projection;

        freq_i = freq_i + 1;

    end
    
    proj = proj_collect;
end