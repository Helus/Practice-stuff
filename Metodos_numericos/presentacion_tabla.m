function presentacion_tabla(fid,x,y,err)
n = length(y);

% CABECERA
fprintf(fid,'|  Nodo   ||     x      ||   y_aprox  ||    Error   |');
fprintf(fid,'\n');
fprintf(fid,'-----------------------------------------------------');

fprintf(fid,'\n');

% DATOS
fprintf(fid,'| %5i   || %10.3e || %10.3e || %10.3e |',1,x(1),y(1),abs(err(1)));
    for i=2:n;
        fprintf(fid,'\r\n');
        fprintf(fid,'| %5i   |',i);
        fprintf(fid,'| %10.3e |',x(i));
        fprintf(fid,'| %10.3e |',y(i)); 
        fprintf(fid,'| %10.3e |',abs(err(i)));
    end

    
fprintf(fid,'\r\n');
fprintf(fid,'-----------------------------------------------------');
fprintf(fid,'\r\n');

end
