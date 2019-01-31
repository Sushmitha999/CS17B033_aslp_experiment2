int prime(int n)
{
    if(n==2)
        return 1;
    for(int i=2;i<=n/2;i++)
    {
        if(n%i==0)
            return 0;
    }
    return 1;
}
int even(int n)
{
    if(n%2==0)
        return 1;
    return 0;
}
int main()
{
int n;
int k,l;
int m;
int i,j;
//scanf("%d",&n);
if(n==2)
    m=0;
if(even(n))
    m=1;
if(prime(n))
    m=2;
if(!prime(n)&&n%2==1)
   m=3;
    switch(m)
    {
        case 0:
        {
        k=3;
        //printf("%d\n",k);
        }
        case 1:
        {
        k=n+1;
        //printf("%d\n",k);
        break;
        }
        case 2:
        {
        int t=n+1;
        while(!even(t))
        {
            t++;
        }
        k=t;
        //printf("%d\n",k);
        int g=n+1;
        while(!prime(g))
        {
            g++;
        }
        l=g;
        //printf("%d\n",l);
        break;
        }
        case 3:
        {
            int j=n+1;
        while(!prime(j))
        {
            j++;
        }
        k=j;
        //printf("%d",k);
        break;
        }

	default:
	break;
	     }
}










