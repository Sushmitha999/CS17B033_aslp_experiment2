int main()
{
register int n;
register int k;
register int m; 
register int i,j;
switch(m)
{
case 1:
{
if(n%2==0)
{
k=n+1;
}
break;
}
case 2:
{


for(int i=2;i<=n/2;i++)

{

if(n%i==0)	 
{
if(n==2)
{

k=n+2;
}


else 
k=n+1;

}
break;
}
break;
}
case 3:
{
if(n%2==1)
{


for(i=n+1;;i++)
{
for(j=2;j<i;j++)
{
if(i%j==0)
{
break;
}
}
if(j==i)
k=i;
} 
break;
}
}
}

}










