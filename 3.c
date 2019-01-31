#include<stdio.h>
void main()
{
register int fact;
register int k;
register int i,j;
i=1;
j=1;
while(i<=100)
{
fact=0;
while(j<=100)
{
if(i%j==0)
fact++;
j++;
}
if(fact==2)
k=i;
i++;
}
}















