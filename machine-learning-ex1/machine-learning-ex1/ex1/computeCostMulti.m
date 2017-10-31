function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% 1. opcija za izraèun funkcije cene
% for i=1:m
%     J = J + (computeH(theta,X(i,:)') - y(i))^2;
% end
% 
% J = J*(1/(2*m));

% 2. opcija za izraèun funkcije cene (enaèba iz navodil)
J = 1/(2*m)*(X*theta - y)' * (X*theta - y);

% =========================================================================

% ovrednotenje hipoteze
function h = computeH(theta,x)
    h = theta'*x;
end

end
