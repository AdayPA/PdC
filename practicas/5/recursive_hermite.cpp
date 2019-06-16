#include <iostream>

using namespace std;

double hermite(int n, float x){
  if (n==0) return 1;
  if (n==1) return 2*x;
  return 2*x*hermite(n-1,x)-2*(n-1)*hermite(n-2,x);
}

int main(void){

  int n=5;
  double x=3.6;
  cout<<hermite(n,x);


  return 0;
}

