% pad to 724x724 (=sqrt(512^2+512^2))
function img = pad_img(img)
    % pad image
    pad_len = sqrt(512^2+512^2);
    p = cast(cast((pad_len - 512)/2, 'int32'), 'double');
    img = padarray(img,[p p],0,'both');
end
