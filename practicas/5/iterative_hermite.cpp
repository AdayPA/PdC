#include <iostream>

using namespace std;

double hermite(int n, double x){
    double Hn, Hn_1, Hn_2;
    Hn_2=1;
    Hn_1=2*x;
    if (n==0) return Hn_2;
    if (n==1) return Hn_1;
    else{
      int i=2;
      do{
        Hn = 2*x*Hn_1-2*(i-1)*Hn_2;
        Hn_2= Hn_1;
        Hn_1=Hn;
        i++;
      }while (i<=n);
      return(Hn);
    }
}



int main(void){

  int n=1;
  double x=3.6;
  double a=hermite(n,x);  

  cout<<a;
  return 0;
}

