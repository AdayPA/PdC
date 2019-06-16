/* 
Author: Aday Padilla Amaya
Date: 07/02/2019
Last Update: 2/03/2019
Description: Basic program to convert decimal numbers to binary, C1/C2 or IEEE-754
Update: This program convert between binary-octal-hexadecimal-decimal bases.
*/
#include <iostream>
#include <string>
#include<math.h>
using namespace std;

int dig_num(int number){
	int counter=0;
	while(number){
		++counter;
		number/=10;
	}
	return counter;
}

void dec_to_bin(int a){
	int size=ceil(log2(a+1));
	int vector[size]={};
	if (a==0){
		cout<<0;
	}else{
		for(int i=size-1;i>=0;i--){
			vector[i]=a%2;
			a=a/2;
		}
		for(int i=0;i<size;i++){
			cout<<vector[i];
		}
	}
	cout<<endl;
}

int oct_to_bin(int a){
	int exp=0;
	int result;
	if((a==8)||(a==9)){
		cout<<"Numero erroneo"<<endl;
	}else{
		while(a){
			result=result+(a%10)*pow(8,exp);
			a/=10;
			exp++;
		}

	}
	dec_to_bin(result);
	return result;
}

void dec_to_hex(unsigned long int a){
	//This is not a cheat.
	cout<<hex<<a<<endl;
}	

int bin_to_dec(unsigned long int a){
	int module;
	int pos=0;
	int result=0;
	int vector[]={1,2,4,8,16,32,64,128,256,512,1024,2048,4096};
	while (a>0){
		module=a%10;
		if(module==1){
			result=result+vector[pos];
		}
		pos++;
		a=a/10;
	}
	return result;
}

int bin_to_oct(unsigned long int a){
	int module;
	int pos=0;
	int result=0;
	int vector[]={1,2,4,8,16,32,64,128,256,512,1024,2048,4096};
	while(a>0){
		module=a%3;
		if (module==1){
			result=result+vector[pos];
		}
		pos++;
		a=a/3;
	}
	cout<<result<<endl;
	return result;
}

void bin_to_hex(unsigned long int a){
	unsigned long int b=bin_to_dec(a);
	dec_to_hex(b);
	
}


void hex_to_bin(string a){
	string result;
	for (std::string::iterator it=a.begin(); it!=a.end();++it){
		//http://www.cplusplus.com/reference/string/string/end/
		if(*it=='0'){
			result=result+"0000";	
		}else if(*it=='1'){
			result=result+"0001";
		}else if (*it=='2'){
			result=result+"0010";
		}else if (*it=='3'){
			result=result+"0011";
		}else if (*it=='4'){
			result=result+"0100";
		}else if (*it=='5'){
			result=result+"0101";
		}else if (*it=='6'){
			result=result+"0110";
		}else if (*it=='7'){
			result=result+"0111";
		}else if (*it=='8'){
			result=result+"1000";
		}else if (*it=='9'){
			result=result+"1001";
		}else if (*it=='a'){
			result=result+"1010";
		}else if (*it=='b'){
			result=result+"1011";
		}else if (*it=='c'){
			result=result+"1100";
		}else if (*it=='d'){
			result=result+"1101";
		}else if (*it=='e'){
			result=result+"1110";
		}else if (*it=='f'){
			result=result+"1111";
		}else if ((*it>9)||(*it<0)){
			cout<<"numero erroneo";
		}
	}
	cout<<result<<endl;
}

BYTE* bin_to_c1(long int a){
	return 0;
de base, decida base de entrada" <<endl;
	cout<<"Binaria: 0"<<endl;
	cout<<"Octal: 8"<<endl;
	cout<<"Decimal: :10"<<endl;
	cout<<"Hexadecimal: 16"<<endl;
	cout<<"Base: "<<endl;
	int b_in;
	unsigned long int number;
	cin>>b_in;
	int a,b;
	switch (b_in){
		case 0:cout<<"Introduzca binario: ";
		       cin>>number;
		       cout<<"Base octal: ";
		       bin_to_oct(number);
		       cout<<"Base decimal: "<<bin_to_dec(number)<<endl;
		       cout<<"Base hexadecimal: ";
		       bin_to_oct(number);

			break;
		case 8:cout<<"Introduzca octal: ";
		       cin>>number;
		       cout<<"Base binaria: ";
		       a=oct_to_bin(number);
		       cout<<"Base decimal: ";
		       cout<<a<<endl;
		       cout<<"Base hexadecimal: ";
		       b=oct_to_bin(number);
		       cout<<bin_to_hex(b)<<endl;
			break;
	case 10: break;
	case 16: break;
	default: cout<<"Elija una opcion correcta"<<endl;
	}


}
