% The results are plotted only for the first node, the last node, and
%when the number of the node is a multiple of plfreq.
indexes = 1:N;
idx = find(indexes == 1 | mod(indexes,plfreq) == 0 | indexes == N);
xpl = x(idx);
yhpl = yh(idx,:);
if (ex == 1)
    exapl = exact(xpl.');
end
for k = 1:m
    figure
    hold on
    plot(xpl,yhpl(:,k),'*r')
    str = sprintf('APPROXIMATE SOLUTION (explicit Euler), component %i',k);
    legend(str)
    if (ex == 1)
        plot(xpl,exapl(:,k),'ob')
        str1 = sprintf('APPROXIMATE SOLUTION (explicit Euler), component %i',k);
        str2 = sprintf('EXACT SOLUTION, component %i',k);
        legend(str1,str2)
    end
end