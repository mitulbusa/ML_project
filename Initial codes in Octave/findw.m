## Copyright (C) 2021 DJS
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} findw (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: DJS <DJS@LAPTOP-8GQP2RQF>
## Created: 2021-04-04

function retval = findw (x,y)
  k = randperm(size(x,1));
  xtrain = x(k(1:ceil(0.8*size(x,1))),:);
  ytrain = y(k(1:ceil(0.8*size(x,1))),:);  
  xtest = x(k(ceil(0.8*size(x,1))+1:end),:);
  ytest = y(k(ceil(0.8*size(x,1))+1:end),:);
  
  retval= pinv(xtrain'*xtrain)*xtrain'*ytrain;
  err = sum(abs(xtest*retval - ytest))/size(ytest,1);
  avg = sum(ytest)/size(ytest,1);
  disp(err);
  disp(avg);
  disp(err*100/avg);
  
  

endfunction
