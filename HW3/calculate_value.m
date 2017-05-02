function value=calculate_value(target_macroblock,reference_macroblock,size)
    
    value = 0 ;
    for i=1:size
        for j=1:size
            value=value+abs(target_macroblock(i,j)-reference_macroblock(i,j));
        end   
    end
end