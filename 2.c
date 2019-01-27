
#include<stdio.h>
int main(int argv,char* argc[])
{
register int n=5;
register int m=3;
int a[]={1,2,3,4,5};
for(int i=0;i<n;i++)
{
a[i]=a[i]+m;
}
}
