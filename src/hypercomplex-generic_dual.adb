with Ada.Numerics; use Ada.Numerics;
with Ada.Numerics.Generic_Elementary_Functions;


package body HyperComplex.Generic_Dual is

package Elementary_Functions is new Ada.Numerics.Generic_Elementary_Functions(T);
use Elementary_Functions;

   function var_init(X : T) return Dual is
       Res: Dual;
	  begin
        Res := (X,1.0);	  
	  return Res; 
   end var_init;


   function const_init (X : T) return Dual is
       Res : Dual;
	  begin
       Res := (X,0.0);
       return Res;	   
   end const_init;

   function conj (X: Dual) return Dual is
      Res: Dual;
	 begin
      Res := (X.Re,-X.Ep);
      return Res;	  
   end conj;
   
   
   function add (X, Y : Dual) return Dual is
      Res : Dual;
   begin
     Res := (X.Re+Y.Re,X.Ep+Y.Ep);
   return Res;
   end add;

   
   function "+" (X,Y : Dual) return Dual is
      begin
       return add(X,Y);
   end "+";

   
   function "+" (X : Dual ; Y : T) return Dual is
      Res : Dual;
   begin
     Res := (X.Re+Y,X.Ep);
   return Res;
   end "+";
   
   function "+" (X : T ; Y : Dual) return Dual is
      Res : Dual;
   begin
     Res := (Y.Re+X,Y.Ep);
   return Res;
   end "+";
   
   function sub (X, Y : Dual) return Dual is
      Res : Dual;
	 begin
      Res := (X.Re-Y.Re,X.Ep-Y.Ep);
     return Res;
    end sub;	 
      
   
   function "-" (X,Y : Dual) return Dual is
      begin
       return sub(X,Y);
   end "-";


   function "-" (X: Dual; Y: T ) return Dual is
      Res : Dual;
      begin
	   Res := (X.Re-Y,X.Ep);
	   return Res; 
	end "-";
	
   function product (X, Y : Dual) return Dual is 
      Res: Dual;
	begin
     Res := (X.Re * Y.Re,X.Re*Y.Ep + X.Ep*Y.Re);
   return Res;
   end product;
   
   function "*" (X, Y : Dual) return Dual is
      Res : Dual;
	 begin
      Res := product(X,Y);
      return Res;
   end "*";
   
   function "*" (X : Dual ; Y : T) return Dual is
      Res : Dual;
	 begin
      Res := (X.Re*Y,X.Ep*Y);
      return Res;
   end "*";
   
   function "*" (X : T ; Y : Dual) return Dual is
      Res : Dual;
	 begin
      Res := (Y.Re*X,Y.Ep*X);
      return Res;
   end "*";
   
   function sqr (X : Dual) return Dual is
      Res : Dual;
	  begin
        Res := (X.Re * X.Re, 2.0*X.Re*X.Ep);
       return Res;
   end sqr;
   
   function div (X , Y : Dual) return Dual is
      Res : Dual;
	 begin
      Res := (X.Re/Y.Re, (X.Ep*Y.Re - Y.Ep*X.Re)/ Y.Re*Y.Re);
     return Res;	  
   end div;
   
   function "/" (X, Y : Dual) return Dual is
      Res : Dual;
	 begin
      Res := div(X,Y);
     return Res;	  
   end "/";
   
   function pow (X : Dual ; P: T) return Dual is
      Res : Dual;
   begin
      Res := (X.Re**P,X.Ep*P*(X.Re**(P-1.0)));
   return Res;
   end pow;
   
   function "**" (X : Dual ; P : T) return Dual is
      begin
	   return pow(X,P);
   end "**";
   
   function exp ( X : Dual) return Dual is
      Res: Dual;
	  begin
	   Res := (e**X.Re,X.Ep*e**X.Re);
	  return Res;
    end exp;

   function sqrt (X: Dual) return Dual is
      Res: Dual;
	  begin
	   Res := (sqrt(X.Re),X.Ep/2.0*sqrt(X.Re));
	   return Res;
   end sqrt;

   function cos (X: Dual ) return Dual is
     Res : Dual;
	begin
     Res := (cos (X.Re), X.Ep * (-sin(X.Re)));
    return Res;	 
   end cos;
   
   function sin (X : Dual)  return Dual is 
      Res : Dual;	  
	begin 
      Res := (sin (X.Re), X.Ep*(cos(X.Re)) );
    return Res;	  
   end sin;
   
   function  tan (X : Dual)  return Dual is 
      Res : Dual;
	  Cosx : T;
	begin
	  Cosx := Cos (X.Re);
      Res := ( tan(X.Re), X.Ep*(1.0/Cosx*Cosx) );
    return Res;
    end tan;
	
   function asin (X: Dual) return Dual is 
      Res : Dual;
     begin 
       Res := (arcsin (X.Re), X.Ep*( 1.0/sqrt ( 1.0 - X.Re*X.Re) ) );
	 return Res;  
   end asin;

   function acos (X: Dual) return Dual is
      Res : Dual;
     begin
       Res := (arccos (X.Re), X.Ep*( -1.0/sqrt ( 1.0 - X.Re*X.Re) ) );
	 return Res;
   end acos;
   

   function atan (X: Dual) return Dual is
       Res : Dual;
	  begin
	   Res := ( arctan (X.Re), 1.0/(1.0+ X.Re*X.Re) );
	  return Res; 
   end atan;

   
   function cosh (X: Dual) return Dual is
       Res : Dual;
      begin
       Res := (cosh (X.Re),X.Ep*sinh(X.Re));
      return Res;	   
   end cosh;


   function sinh (X: Dual) return Dual is
       Res : Dual;
      begin
       Res := (sinh (X.Re),X.Ep*cosh(X.Re));
      return Res;	   
   end sinh;
   

   function tanh (X: Dual) return Dual is
       Res : Dual;
      begin
       Res := (tanh (X.Re),X.Ep*(1.0/(cosh(X.Re)*cosh(X.Re))));
      return Res;	   
   end tanh;
   
     function ln (X: Dual) return Dual is
       Res: Dual;
	  begin
        Res := (log (X.Re), X.Ep*(1.0/X.Re));
      return Res;		
     end ln;
   
end HyperComplex.Generic_Dual;