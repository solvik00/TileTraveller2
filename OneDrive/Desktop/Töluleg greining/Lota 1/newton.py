
def newton(x0,tol):
    oldx=x0+2*tol
    x=x0
    while abs(oldx-x)>tol:
        oldx=x
        x=x-f(x)/Df(x)
    return(x)
