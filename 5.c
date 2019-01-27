int main()
{
register int n;
n=3;
int a[n][n];
int b[n][n];
int c[n][n];
int i,j;
for(i=0;i<n;i++)
{
for(j=0;j<n;j++)
{
c[i][j]=a[i][j]+b[i][j];
}
}
}

