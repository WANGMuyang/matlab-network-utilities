% Computes Diameter of a network. 
% Updated to use faster Dijkstra method from Matlab Central by Joseph Kirk.
% only calls Dijkstra method if dij not provided. 
% The longest shortest path between any two nodes nodes in the network
% INPUTs: 	adj: adjacency matrix N X N
%			dij (optional): distance from each node i to each node j from a shortest path algo N x N
% OUTPUTS: network diameter, diam
% Note: works for directed/undirected networks
% Jesse Blocher, Dec 2009. 


function diam = apl_diam_fast(adj, dij)
if nargin < 2
    dij = sparse(all_shortest_paths(adj));
end;
if ~isconnected(adj)
	%if graph is not connected distance from i to j can be Inf and blow up this calc.
	dij = removeInf(dij);
end;
diam = max(max(dij));
