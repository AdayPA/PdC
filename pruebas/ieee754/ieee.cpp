/* 
Author: Aday Padilla Amaya
Date: 2/03/2019
Last Update: 2/03/2019
Description: Basic program to convert decimal numbers to IEEE-754
*/

#include <iostream>
#include <cassert>
#include <bits/stdc++.h>

using namespace std;
class ieee_t{
	private:
		int sign_;
		int* exp_;
		int* mant_;
	public:
		ieee_t():
		exp_(NULL),
		mant_(NULL){
		exp_=new int [8];
		mant_= new int [23];

		}
		~ieee_t(){
		delete[] exp_;
		delete[] mant_;
		}
		
		int get_sign(void) const{
			return sign_;
		}
		


};

class num_t{
	private:
		int dec_right_;
		int dec_left_;
		int bin_right_;
		int* bin_left_;
	public:
		num_t(void){
			dec_right_=0;
			dec_left_=0;
			bin_right_=0;
			bin_left_=NULL;
		}
		~num_t(void){}
		
		void set_dec_right(int a){
			dec_right_=a;
		}
		void set_dec_left(int a){
			dec_left_=a;
		}
		int& get_dec_right(void){ //porque si devuelvo una la referencia
			return dec_right_;     // la funcion no puede tener el const
		}
		int& get_dec_left(void){
			return dec_left_;
		}

		void set_bin_right(int a){
		}
		
		int get_bin_right(void){
			return bin_right_;
		}
		
};

int main (void){
/*	int n;
	cout << "# Decimal: "; cin >> n; cout << endl;


	bitset<8>binary(n);
cout << endl << "# Binary: " << binary << endl;



num_t a;
int x;
cout<<"mete el decimal: ";cin>>x; cout<<endl;
a.set_dec_left(x);
cout<<a.get_dec_left()<<endl;
*/
	char a[4]={'a','b','c','d'};
	char* ap=&a[0];
	char* last=&a[1010];
	cout<<"a[0]: "<<a[0]<<endl;
	cout<<"a: "<<a<<endl;
	cout<<"ap: "<<ap<<endl;
	cout<<"*ap: "<<*ap<<endl;
	cout<<"last: "<<&last<<endl;
	cout<<"&ap: "<<&ap<<endl;
	*ap='x';
	cout<<"cambio: "<<a[0]<<endl;
return 0;
}

