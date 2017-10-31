function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% izra�un regularizirane funkcije cene
cost = zeros(m,1);
costReg = zeros(length(theta),1);
for i = 1:m
    cost(i) = y(i)*log(sigmoid(X(i,:)*theta))+(1-y(i))*log(1-sigmoid(X(i,:)*theta));
    for j=1:length(theta)
        %izra�un gradientov (odvodov J po parametrih theta)
        grad(j) = grad(j) + 1/m*(sigmoid(theta'*X(i,:)')-y(i))*X(i,j);
    end
end

% regularizacija gradienta
for j = 1:length(theta)
    % regulizacijski del za J
    costReg(j) = theta(j)^2;
    grad(j) = grad(j) + lambda/m*theta(j);
end
% za theta0 se ne izvaja regularizacije
grad(1) = grad(1) - lambda/m*theta(1);

% funkcija cene
J = -1/m*sum(cost) + lambda/(2*m)*sum(costReg(2:end));

% =============================================================

end
