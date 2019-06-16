#include <iostream>
#include <cmath>

using namespace std;

int main(void){

  int iter =1;
  float serie=1.0;
  float num=1.0, den=1.0;
  float error=0.0;
  float temp=0.0;
  cout<<"Introduzca el error maximo permitido:  "<<endl;
  cin>>error;
  do{
    den+=2;
    num=-num;
    temp=num/den;
    serie+=temp;
    iter++;
  }while(error<abs(temp));

  cout<<"Serie de Leibniz: "<<serie<<endl;
  cout<<"Terminos calculados:  "<<iter<<endl;

  return 0;
}

