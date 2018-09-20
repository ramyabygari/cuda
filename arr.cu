#include<iostream>
#include<cuda.h>
#include<stdlib.h>
#include<ctime>

using namespace std;

__global__ void addarr(int *d_a,int *d_b)
{
int id=threadIdx.x+(blockIdx.x*blockDim.x)

if(id<count)
{
d_a[id]=d_a[id]+d_b[id];
}
}


int main()
{
srand(time(NULL));
int count=100;
int *h_a=new int[count];
int *h_b=new int[count];
for(int i=0;i<count;i++){
h_a[i]=rand()%1000;
h_b[i]=rand()%1000;}
cout<<"Before addition\n";
for(int i=0;i<5;i++)
cout<<h_a[i]<<" "<<h_b[i];

int *d_a,d_b;
cudaMalloc(&d_a,sizeof(int)*count);
cudaMalloc(&d_b,sizeof(int)*count);
cudaMemcpy(d_a,&h_a,sizeof(int)*count,cudaMemcpyHostToDevice);
cudaMemcpy(d_b,&h_b,sizeof(int)*count,cudaMemcpyHostToDevice);
addarr<<<count/256+1,256>>>(d_a,d_b,count);
cudaMemcpy(&h_a,d_a,sizeof(int)*count,cudaMemcpyDeviceToHost);
for(i=0;i<5;i++)
cout<h_a[i]<<" ";

}
