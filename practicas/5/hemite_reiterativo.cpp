#include<iostream>

using namespace std;

int fact(int n)
{
	return (n == 0 ? 1:n*fact(n-1));
}

double potencia(double base, double exp)
{
	return (exp == 0 ? 1 :base*potencia(base,exp-1));
}
int main(void){
	
int orden; //n
double punto; //x

cout << "Orden: ";
cin >> orden;
cout << "Punto: ";
cin >> punto;

if(orden < 0)
{
	cout << "\nNo se admiten orden negativo.\n";
}

else
{
	int numerador = orden*(orden-1),denominador;
	double hermite = potencia(2*punto,orden);
	cout << "\nNum1: " << numerador << endl;
	cout << "\nHermite1= : " << hermite << endl;
	double fracc;
	int j=2,k=1;
	do
	{
		numerador *= -1;
		fracc =  numerador/fact(k);
		cout << "\nFracc1= : " << fracc << endl;
		fracc *= potencia(2*punto,orden-j);
		cout << "\nFracc2= : " << fracc << endl;
		hermite += fracc;
		for(int i=j ; i<j+2 ; i++)
		{
  			numerador*=orden-i;
		}
	cout<<"\nNum2: "<<numerador<<endl;
	j+=2;
	k++;
	cout<<"\norden -j: "<<orden - j<<endl;
	cout<<"\nk: "<<k<<endl;


}while(orden-j>=0);

cout<<endl<<"Hermite: "<<hermite<<endl;
}


  return 0;
}
