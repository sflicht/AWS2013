## -*- encoding: utf-8 -*-
## This file (jared.sagetex.sage) was *autogenerated* from jared.tex with sagetex.sty version 2012/01/16 v2.3.3-69dcb0eb93de.
import sagetex
_st_ = sagetex.SageTeXProcessor('jared', version='2012/01/16 v2.3.3-69dcb0eb93de', version_check=True)
_st_.blockbegin()
try:
 q = 2
 Fq.<a> = GF(q)
 Fqx = Fq.list()[:]; Fqx.remove(0)
except:
 _st_.goboom(17)
_st_.blockend()
_st_.blockbegin()
try:
 bound = 10
except:
 _st_.goboom(22)
_st_.blockend()
_st_.blockbegin()
try:
 vars = ["t"] + ["t_"+str(i) for i in range(1,bound+1)]
 R0 = PolynomialRing(Fq,vars)
 I = R0.ideal([R0(vars[i])^q-R0(vars[i-1]) for i in range(1,bound+1)])
 R = R0.quo(I)
except:
 _st_.goboom(29)
_st_.blockend()
_st_.blockbegin()
try:
 t = R.gens()[0]
 t_1,t_2,t_3,t_4 = var("t_1,t_2,t_3,t_4")
 [t_1,t_2,t_3,t_4] = R.gens()[1:5]
except:
 _st_.goboom(35)
_st_.blockend()
try:
 _st_.inline(0, latex(t_4^(q^4)-t))
except:
 _st_.goboom(36)
try:
 _st_.inline(1, latex(t*t_1==t_1^(q+1)))
except:
 _st_.goboom(37)
try:
 _st_.inline(2, latex(5/q^2))
except:
 _st_.goboom(41)
_st_.blockbegin()
try:
 def v(r):
     S.<x> = PolynomialRing(Fq)
     phi = R0.hom([x]+[0 for i in range(bound)],S)
     s0 = (r^(q^bound)).lift() # lift r to a polynomial
     s = phi(s0)
     return s.valuation() / (q^bound)
except:
 _st_.goboom(50)
_st_.blockend()
_st_.blockbegin()
try:
 print "Defining v(r)"
 def v(r):
     if r == 0:
         return Infinity
     r1 = r/r.lc()
     mvs = []
     d = zip(R.variable_names(),
                  ["("+str(q^(-i))+")" for i in range(len(R.variable_names()))])
     #       probably should build this dict once and store it,
     #       rather than creating it every time v(r) is called
     d.append(("*","+"))
     d.append(("^","*"))
     while r1 != 0:
         r1 = r1/r1.lc()
         #print r1.lift()
         m = r1.lm() # get the normalized leading monomial
         ms = str(m) # turn this into a string
         for dd in d:
             ms = ms.replace(dd[0],dd[1])
         mv = QQ(sage.calculus.calculus.symbolic_expression_from_string(ms))
        # mv is the valuation of the leading monomial of r1
         mvs.append(mv)
         r1 = r1 - m
     return min(mvs)
except:
 _st_.goboom(79)
_st_.blockend()
_st_.blockbegin()
try:
 r = var("r")
 r = t_2^5 + t_4^(q^10)
except:
 _st_.goboom(86)
_st_.blockend()
try:
 _st_.inline(3, latex(v(r)))
except:
 _st_.goboom(87)
_st_.blockbegin()
try:
 def A(n):
     return map(flatten, CartesianProduct(Fqx,map(list,VectorSpace(Fq,n-1).list())))
except:
 _st_.goboom(97)
_st_.blockend()
_st_.blockbegin()
try:
 def pi(n):
     t_n = R.gens()[n]
     return prod([sum([a[i]*t_n^(q^i) for i in range(n)]) for a in A(n)])
except:
 _st_.goboom(106)
_st_.blockend()
_st_.blockbegin()
try:
 print pi(1)
 print pi(2)
 print pi(3)
 def prettyPrint(r):
     d = zip(map(str,R.gens()),vars)
     s = str(r)
     for dd in d:
         s = s.replace(dd[0],dd[1])
     r.rename(s)
     return r
except:
 _st_.goboom(119)
_st_.blockend()
_st_.blockbegin()
try:
 pi_1 = pi(1)
 print 1
 pi_2 = pi(2)
 print 2
 pi_3 = pi(3)
 print 3
 pi_4 = pi(4)
 print 4
 pi_5 = pi(5)
 #print 5
 pi_6 = pi(6)
 #print 6
 #pi_7 = pi(7)
 #print 7
 #pi_8 = pi(8)
 #print 8
 #pi_9 = pi(9)
 #print 9
except:
 _st_.goboom(141)
_st_.blockend()
try:
 _st_.inline(4, latex(pi_1.lift()))
except:
 _st_.goboom(144)
try:
 _st_.inline(5, latex(pi_2.lift()))
except:
 _st_.goboom(145)
try:
 _st_.inline(6, latex(pi_3.lift()))
except:
 _st_.goboom(146)
try:
 _st_.inline(7, latex(v(pi_2-pi_1)))
except:
 _st_.goboom(151)
try:
 _st_.inline(8, latex(v(pi_3-pi_2)))
except:
 _st_.goboom(152)
try:
 _st_.inline(9, latex(v(pi_4-pi_3)))
except:
 _st_.goboom(153)
try:
 _st_.inline(10, latex(v(pi_5-pi_4)))
except:
 _st_.goboom(154)
try:
 _st_.inline(11, latex(v(pi_6-pi_5)))
except:
 _st_.goboom(155)
_st_.endofdoc()
