#include<stdio.h>
int main()
{
    int a,b,d;
    char c;
    scanf("%d %d%*c%c",&a,&b,&c);
    if(c=='+')
        d=a+b;
    else if(c=='-')
        d=a-b;
    else if(c=='*')
        d=a*b;
    else
        d=a/b;
    printf("%d",d);
}
