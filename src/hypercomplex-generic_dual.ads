-- 
-- 
--    Dual numbers are numbers of the form a + bi where i^2 = 0 and i /= 0
--    
--    There primary application is in rigid motions and computation of derivatives
--    
--    Derivatives can be evaluated at point by extending the constants and variable to dual numbers 
--    and performing the same computations. Constants are extended by initialising a dual number
--    with zero, a variable initialises it with 1.       
--
--    Example  f(x) = x^2 - 27 to evaluate f(x) at 4 initialise x as Dual (4.0,1) and Dual(27.0,0.0)
--    and then perform the same calculations i.e x_dual^2 - 27_dual. The real and imaginary component
--    are then the evaluation of f(4) and f'(4) respectively. 
--
--    This library provides var_init which automatically assigns 1 to the imaginary component
--    As well as const_init which assigns 0 to the imaginary component


generic
    type T is digits <>;
package HyperComplex.Generic_Dual is

 type Dual is record
  Re, Ep : T;
 end record;
 
    --  Initialise from variable evaluation  i.e x = 2 used for evaluating function and derivative at point x
   function var_init (X: T) return Dual;
   
    --  Initialise from constant
   function const_init (X: T) return Dual;
   
    --  Add two Dual numbers
   function add (X, Y : Dual) return  Dual;
   
    --  Addition of two Dual number operator overload
   function "+" (X, Y : Dual) return Dual;
   
    --  Addition of Dual number and Float on the right hand side
   function "+" (X: Dual ; Y : T) return Dual;
   
    --  Addition of Dual number and Float on the left hand side
   function "+" (X: T ; Y : Dual) return Dual;
   
    -- Subtraction of two Dual numbers
   function sub (X, Y : Dual) return Dual;
   
    -- Subtraction of two Dual numbers operator overload
   function "-" (X, Y : Dual) return Dual;
   
   --  Subtraction of a Dual number with right-hand float
   function "-" (X : Dual ; Y: T) return Dual;
   
    --  Product of two Dual numbers
   function product (X, Y : Dual) return  Dual;
   
   --  Product of two Dual numbers operator overload
   function "*" (X, Y : Dual) return Dual;

   --  Product of Dual number with right-hand float
   function "*" (X : Dual ; Y : T) return Dual;
   
   --  Product of Dual number with left-hand float
   function "*" (X : T ; Y : Dual) return Dual;
   
   --  Division of two Dual numbers
   function div (X, Y : Dual) return Dual;
   
   --  Division of two Dual numbers operator overload
   function "/" (X, Y : Dual) return Dual;
   
   --  Square of a Dual number x*x
   function sqr (X: Dual) return Dual;
  
   -- Exponentiation of a Dual number  x^p
   function pow (X : Dual ; P: T) return  Dual;
   
   --  Exponentiation of a Dual number x^p operator overload
   function "**" (X : Dual ; P : T) return Dual;
   
   -- Exponential of Dual number
   function exp(X : Dual) return Dual;
   
   --  Square root of Dual number a*a = x 
   function sqrt(X : Dual) return Dual;

   --  Cosine of Dual number
   function cos (X : Dual) return  Dual;
  
   --  Sine of Dual number
   function sin (X : Dual) return  Dual;
  
   --  Tangent of Dual number
   function tan (X : Dual) return Dual;
   
   --  Inverse sine of Dual number
   function asin (X : Dual) return Dual;
  
   --  Inverse cosine of Dual number
   function acos (X : Dual) return Dual;
   
   --  Inverse tangent of Dual number
   function atan (X : Dual) return Dual;
  
   --  Hyperbolic sine of Dual number
   function sinh (X : Dual) return Dual;
  
   --  Hyperbolic cosine of Dual number
   function cosh (X : Dual) return Dual;
  
  --  Hyperbolic tangent of Dual number
   function tanh (X : Dual) return Dual;
  
  -- Natural logarithm of Dual number
   function ln (X : Dual) return  Dual;
   
     
   
end HyperComplex.Generic_Dual;