-- Make sure to commit Ada-code that compiles.
-- Run compiler as:
--    gcc -c -gnatc input.adb
with Ada.Text_IO;
procedure Input is

  type String_T is new String;
  function "+" (Left : String) return String_T is (String_T(Left));
  function "+" (Left : String_T; Right : String) return String_T is (String_T(String (Left) & Right));

  generic
    Description : String_T;
  package Generic_G is
    procedure Go;
  end Generic_G;

  package body Generic_G is
    procedure Go is
    begin
      Ada.Text_IO.Put_Line (String (Description));
    end Go;
  end Generic_G;

  package Impl is
    procedure Go;
  end Impl;

  procedure Bad_Value (S : String) is
  begin
    raise Constraint_Error with "bad input for 'Value: """ & S & '"';
  end Bad_Value;
 
  package body Impl is
    package Generic1 is new Generic_G (Description => +"; " +":");
    -- String litrals below taken from ARM 2.6(8)
    package Generic2 is new Generic_G (Description => +"Message of the day:"
                        		              +" "
						      +"A"
				  		      +" """
				  		      +""""
				  		      +"Characters such as $, %, and } are allowed in string literals"
				  		      +"A multi line string """ & ASCII.CR
				  		      +""" ");
    procedure Go renames Generic1.Go;
  end Impl;

begin
  Impl.Go;
end Input;
