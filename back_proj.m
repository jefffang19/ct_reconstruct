function img = back_proj(proj, degree)
    [proj_len, num_angles] = size(proj);
    
    pad_len = sqrt(512^2+512^2);
    reconstruct = zeros(cast(pad_len, 'int32'), cast(pad_len, 'int32'));
    
    % perform at each angle
    for i=1:num_angles 
        
        backproj = zeros(cast(pad_len, 'int32'), cast(pad_len, 'int32'));
        
        % perform back projection
        for j=1:proj_len
            backproj(:, j) = backproj(:, j) + proj(:, i);
        end

        %  rotate
        backproj = imrotate(backproj,(i-1)*degree,'bilinear','crop');
        
        reconstruct = reconstruct + backproj;
    end
    
    reconstruct = reconstruct * pi / (2*num_angles);
    
    % crop image
    img = imcrop(reconstruct, [106 106 511 511]);
    
    img = flip(img, 2);

end