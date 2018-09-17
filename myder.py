# -*- coding: utf-8 -*-
"""
Created on Sun Sep  9 16:50:22 2018

@author: Tom K
"""
import numpy as np
from numpy import array

def forwardiff(f,a,b,N): #forward has four inputs and one 
    h = (b-a)/N # a is the min and b is max and the difference divided by N, number of total steps give h, the size of the step
    g=[]
    for k in range(1,N):
        slop = (f(a+k*h)-f(a+(k-1)*h))/h #k is however many steps or the position of step 
        g.append(slop)
    return array(g)
    
def backwardiff(f,a,b,N):
    h = (b-a)/N
    g=[]
    for k in range(0,N-1): #in Python this syntax means it incruments or adds one to each step 
        slop = (f(a+(k+1)*h)-f(a+k*h))/h
        g.append(slop)
    return array(g)

def centraldiff(f,a,b,N):
    h = (b-a)/N
    g=[]
    for k in range(0,N):
        slop = (f(a+(k+1/2)*h)-f(a+(k-1/2)*h))/h
        g.append(slop)
    return array(g)
def centraldiff3 (f,a,b,N):
    h = (b-a)/N
    g=[]
    for k in range(0,N):
        slop = ((1/24)*f(a+(k-3/2)*h)-(27/24)*f(a+(k-1/2)*h)+(27/24)*f(a+(k+1/2)*h)-(1/24)*f(a+(k+3/2)))/h
        g.append(slop)
    return array(g)
    
