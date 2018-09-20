#include<cuda.h>
#include<bits/stdc++.h>
using namespace std;
__global__void addint(int *a,int *b)
{
a[0]=a[0]+b[0];
}
int main()
{
int a=5;
int b=9;
int *d_a,*d_b;
cudaMalloc(&d_a,sizeof(int));
cudaMalloc(&d_b,sizeof(int));
cudaMemcpy(d_a,&a,sizeof(int),cudaMemcpyHostToDevice);
cudaMemcpy(d_b,&b,sizeof(int),cudaMemcpyHostToDevice);
addint<<<1,1>>>(d_a,d_b);
cudaMemcpy(&a,d_a,sizeof(int),cudaMemcpyDeviceToHost);
cout<a;
return 0;
}
