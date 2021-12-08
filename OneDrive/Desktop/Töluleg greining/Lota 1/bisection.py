# gert ráð fyrir að búið se að skilgreina f(x) fyrir utan t.d.
def f(x):
    return(x**2-2)

def bisection(a,b,tol):
    
    if f(a)*f(b) >= 0:
        print("Bisection method fails.")
        return None
    else:
        fa=f(a)
        while (b-a)/2>tol:
            c=(a+b)/2
            fc=f(c)
            if fc==0:break
            if fc*fa<0:
                b=c
            else:
                a=c
                fa=fc
    return((a+b)/2)
