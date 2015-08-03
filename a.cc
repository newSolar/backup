/*************************************************************************

       Author:            newSolar
       Created Time :     Tue 28 Jul 2015 01:27:27 PM CST

       File Name:         a.cc
       Description:       new style, new life

************************************************************************/

#include <set>
#include <map>
#include <list>
#include <queue>
#include <stack>
#include <cmath>
#include <string>
#include <cstdio>
#include <vector>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <algorithm>

using namespace std;

#define PB              push_back
#define SIZE(x)         (int)x.size()
#define clr(x,y)        memset(x,y,sizeof(x))
#define MP(x,y)         make_pair(x,y)
#define RS(n)           scanf ("%s", n)
#define ALL(t)          (t).begin(),(t).end()
#define FOR(i,n,m)      for (int i = n; i <= m; i ++)
#define ROF(i,n,m)      for (int i = n; i >= m; i --)
#define IT              iterator
#define FF              first
#define SS              second

typedef long long               ll;
typedef unsigned int            uint;
typedef unsigned long long      ull;
typedef vector<int>             vint;
typedef vector<string>          vstring;
typedef pair<int, int>          PII;

void RI (int& x){
    x = 0;
    char c = getchar ();
    while (c == ' '||c == '\n')	c = getchar ();
    bool flag = 1;
    if (c == '-'){
        flag = 0;
        c = getchar ();
    }
    while (c >= '0' && c <= '9'){
        x = x * 10 + c - '0';
        c = getchar ();
    }
    if (!flag)	x = -x;
}
void RII (int& x, int& y){RI (x), RI (y);}
void RIII (int& x, int& y, int& z){RI (x), RI (y), RI (z);}

/**************************************END define***************************************/

const ll mod = 1e9+7;
const ll LINF = 1e18;
const int INF = 1e9;
const double EPS = 1e-8;

int a[1000005];
int b[1000005][8];
int ttt[8];

int gcd (int a, int b){
    return b == 0 ? a : gcd (b, a%b);
}

int main (){
    int ans = 0;
    FOR (i, 2, 1000000){
        if (!a[i]){
            for (int j = i; j <= 1000000; j += i){
                a[j] ++;
            }
        }
        b[i][a[i]] ++;
    }
    FOR (i, 3, 1000000){
        FOR (j, 1, 7){
            b[i][j] += b[i-1][j];
        }
    }
    int T;
    scanf ("%d", &T);
    while (T --){
        int L, R;
        scanf ("%d%d", &L, &R);
        int ans = 1;
        FOR (i, 1, 7){
            ttt[i] = b[R][i] - b[L-1][i];
        }
        FOR (i, 1, 7){
            if (ttt[i] >= 2){
                ans = max (ans, i);
            }
        }
        FOR (i, 1, 7){
            FOR (j, i+1, 7){
                if (ttt[i] && ttt[j]){
                    ans = max (ans, gcd (i, j));
                }
            }
        }
        printf ("%d\n", ans);
    }
}
