#include <iostream>
#include <bits/stdc++.h>
int arr[10000];
using namespace std;
int main(void){
	int count,q,x,t,size=0,odd,even;
	unsigned int Xor;
	cin>>t;
	bool flag = false;
	set<unsigned int> pset;
	set<unsigned int> :: iterator pitr1;
	set<unsigned int> :: iterator pitr2;
	while(t--){
		cin>>q;
		count =0;
		while(q--){
		odd =0;
		even =0;
		cin>>x;
		if(count == 0){
			pset.insert(x);
			count++;
		}
		if(!pset.count(x)){
			size =0;
			for(pitr1 = pset.begin();pitr1 != pset.end();++pitr1){
				Xor = (*pitr1)xor(x);
				arr[size++] = Xor;
			}
			pset.insert(x);
			flag = true;
		}
		if(flag == true)
		for(int i=0;i!=size;i++){
			if(!pset.count(arr[i])){
				pset.insert(arr[i]);
			}
			else{ 
				i++;
			}
		}
		for(pitr2 = pset.begin();pitr2 != pset.end();++pitr2){
			if((__builtin_popcount(*pitr2))%2 ==0)
				even++;
			else 
				odd++;
		}
		cout<<even<<" "<<odd<<endl;
		}
		pset.erase(pset.begin(),pset.end());
	}
}


