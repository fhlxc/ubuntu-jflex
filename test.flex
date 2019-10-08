import java_cup.runtime.*;

%%
//参数设置和声明段 
%class Lexer
%line 
%column 
%standalone
%unicode

%{
    public static void init(){}/**//* Just为了兼容手写版*/
    private Symbol symbol(int type){
        return new Symbol(type,yyline,yycolumn); 
    }
    private Symbol symbol(int type,Object value){
        return new Symbol(type,yyline,yycolumn,value);
    }
%}
digit=[0-9]
number={digit}+
LineTerminator=\r|\n|\r\n
WhiteSpace={LineTerminator}|[ \t\f]

%%

<YYINITIAL>{
    ";" { System.out.println("这是分号"); }
    "+" { System.out.println("这是加号"); }
    "-" { System.out.println("这是减号"); }
    "=" { System.out.println("这是等号"); }
    "*" { System.out.println("这是乘号"); }
    "/" { System.out.println("这是除号"); }
    "%" { System.out.println("这是百分号"); }
    "(" { System.out.println("这是左括号"); }
    ")" { System.out.println("这是右括号"); }
    {number} { System.out.println("这是数字"); }
    {WhiteSpace} { System.out.println("这是空白部分"); }
    
}
. { 
    System.out.println("Error:"+yytext()+" is illegal!"); 
}
