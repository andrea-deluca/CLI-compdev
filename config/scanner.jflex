/*--------------------------------------------------------------------
 * File Name:           scanner.jflex
 * Purpose:             A scanner for....
 * Last modified Date:  YYYY-MM-DD
 * Last Version:        V1.00
 *
 * Note(s):             ...
 *--------------------------------------------------------------------
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 * Copyright (c) YYYY ??
 * All rights reserved.
 *--------------------------------------------------------------------*/

/* Code Section ------------------------------------------------------*/

import java_cup.runtime.*;

%%

/* Declarations Section ----------------------------------------------*/

%{
    /* To disable debugging, i.e., printing of recogized token 
    by means of the scanner set the constant _DEBUG to false */
    private static final boolean _DEBUG = true;

    private void print(String sym){
        System.out.print(sym + " ");
    }

    private void print(String sym, String value){
        System.out.print(sym + ":" + value + " "); 
    }

    private void scannerError(){
        System.out.println("\n");
        System.out.println(
            "SCANNER ERROR unexpected token in line " 
            + (yyline + 1)
            + ":" 
            + (yycolumn + 1)
            + ": " 
            + yytext() 
        );
        System.out.println();
    }

    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol Symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

/* Generate a Java class without the main method. */
%class Scanner

/* Allow the combined use of Jflex and Cup */
%cup

/* Allow using the yyline and yycolumn values. */
%line
%column

/* Regular Definitions ------------*/

/* New line definitions in UNIX, MacOS and Windows systems */
nl          =   \n|\r|\r\n

/* White space and tab definitions */
ws          =   [ \t]

integer     =   [1-9][0-9]*
                |[0-9]

decimal     =   [1-9][0-9]*\.[0-9]*
                |\.[0-9]+
                |0\.[0-9]*

id          =   [_a-zA-Z][_a-zA-Z0-9]

// your regular definition here

any         =   .

%%

/* Rules Section -----------------------------------------------------*/

// your rules here

/* Identifiers */
{id}        { if (_DEBUG) print("ID", yytext()); return symbol(sym.ID); }

/* New line and whitespace */
{nl}|{ws}   { ; /* do nothing */ }

/* Any other illegal character */
{any}       { scannerError(); }