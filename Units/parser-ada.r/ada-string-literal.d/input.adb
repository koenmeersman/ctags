-- Make sure to commit Ada-code that compiles.
-- Run compiler as:
--    gcc -c -gnatc input.adb
with Ada.Text_IO;
procedure Input is

  type String_T is new String;
  function "+" (Left : String) return String_T is (String_T(Left));
  function "+" (Left : String_T; Right : String) return String_T is (String_T(String (Left) & Right));

  procedure String_Literals (S : String) is
  begin
    -- Examples below taken from ARM 2.6(8)
    Ada.Text_IO.Put_Line ("Message of the day:");
    declare
      type String_Literal_1_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
    Ada.Text_IO.Put_Line (" ");
    declare
      type String_Literal_2_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
    Ada.Text_IO.Put_Line ("A");
    declare
      type String_Literal_3_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
    Ada.Text_IO.Put_Line ("""");
    declare
      type String_Literal_4_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
    Ada.Text_IO.Put_Line ("Characters such as $, %, and } are allowed in string literals");
    declare
      type String_Literal_5_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
    Ada.Text_IO.Put_Line ("Volume of cylinder (πr²h) = ");
    declare
      type String_Literal_6_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
    Ada.Text_IO.Put_Line ("bad input for 'Value: """ & S & '"');
    declare
      type String_Literal_7_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
    Ada.Text_IO.Put_Line ("A multi line string """ & ASCII.CR
      & ASCII.CR
      & "   ");
    declare
      type String_Literal_8_T is new String;
      -- Assume when not creating tag above when incorrectly processing string literal.
    begin
      null;
    end;
  end String_Literals;

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

  package body Impl is
    package Generic1 is new Generic_G (Description => +"; " +":");
    procedure Go renames Generic1.Go;
  end Impl;

begin
  Impl.Go;
end Input;
