with Ada.Numerics.Generic_Complex_Types;

generic
    type T is range <>;

package HyperComplex.Generic_Complex_Integer is 

 
   type Gaussian_Integer is record
       Re : T;
	   Im : T;
   end record;
 
   function is_prime (X : Gaussian_Integer) return Boolean;

end HyperComplex.Generic_Complex_Integer;