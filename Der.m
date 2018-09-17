function [dy,xc] = Der(F,x,varargin)
% D calculates the derivative of the function F(x) using one of three
% methods: forward difference, central difference, and expolated
% difference(take the two extreem or end pts)
% D(F,x,method) returns the x and y coordinate of the derivative function.
% Specify which method in the optional third argument as 'fd', 'cd', or
% 'ed'. If F is a numeric vector, it is treated as data and a simple
% derivative is calculated

if isempty(varargin) % @ --> annonymous functions before we have them too in python 
   % Default method
    varargin{1} = 'cd'; 
end
if ~isnumeric(x)
    error('Second input must be numeric vector')
end
if ~isa(F,'function_handle')
    if isnumeric(F)
      xc = x(1:end-1); % method for data depends on how you assign dy to xc %chop just chops off the very last part of x and returning the rest
      dy = diff(F)./diff(x); 
      varargin{1} = 'data';
    else
      error('First input must be a function handle or a numeric array')
    end
end

n=length(x);
dx = diff(x); %dx represents h in the orgignal form

switch varargin{1}
    case 'fd' 
        dy = (F(x(2:n)) - F(x(1:n-1)))./dx;
        xc = x(1:n-1);
    case 'bd'
        dy = (F(x(2:n)) - F(x(1:n-1)))./dx;
        xc = x(2:n);
    case 'cd'
        dy = (F(x(1:n-1)+0.5*dx) - F(x(1:n-1)-0.5*dx))./dx; 
        xc = x(1:n-1);
    case 'cd3'
        dy = ((1./24)*(F(x(1:n-1)-1.5*dx))-(27./24)*(F(x(1:n-1)-0.5*dx))+(27./24)*(F(x(1:n-1)+0.5*dx))-(1./24)*(F(x(1:n-1))+(1.5*dx)))./dx;
        xc = x(1:n-1);
        
    case 'ed'
        half = (F(x(1:n-1)+0.25*dx) - F(x(1:n-1)-0.25*dx))./(0.5*dx); 
        full = (F(x(1:n-1)+0.5*dx) - F(x(1:n-1)-0.5*dx))./dx;
        dy = (4/3).*half - (1/3).*full;
        xc = chop(x);
    case 'data'
        return;
    otherwise
        error('method not recognized');
end
end
