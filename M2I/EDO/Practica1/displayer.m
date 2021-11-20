% dfreq: display frequency (in order not to display too many lines,
% the results are displayed only for the first node, the last node, and
% when the number of the node is a multiple of dfreq).
%
% ex: it indicates whether the exact solution is known (ex = 1) or not (otherwise).
%
% ofi: it is a file identifier for the output file.
%
indexes = 1:N;
idx = find(indexes == 1 | mod(indexes,dfreq) == 0 | indexes == N);
xdisp = x(idx);
yhdisp = yh(idx,:);
Ndisp = length(idx);
if (ex == 1)
    for i = 1:Ndisp
        fprintf(ofi,'\n\nStep \t\t Node \t\t\t\t Approximate solution \t\t Exact solution \t\t Error (2-norm)\n');
        exa = exact(xdisp(i));
        error = norm(exa-yhdisp(i,:));
        fprintf(ofi,'%-i \t\t %-.4E \t\t\t %-.6E \t\t\t\t %-.6E \t\t\t %-.6E',idx(i),xdisp(i),yhdisp(i,1),exa(1),error);
        for j = 2:m
            fprintf(ofi,'\n \t\t\t\t\t\t\t\t %-.6E \t\t\t\t %-.6E',yhdisp(i,j),exa(j));
        end
    end
else
    for i = 1:Ndisp
        fprintf(ofi,'\n\nStep \t\t Node \t\t\t Approximate solution\n');
        fprintf(ofi,'%-i \t\t %-.4E \t\t\t %-.6E',idx(i),xdisp(i),yhdisp(i,1));
        for j=2:m
            fprintf(ofi,'\n \t\t\t\t\t\t\t\t %-.6E',yhdisp(i,j));
        end
    end
end