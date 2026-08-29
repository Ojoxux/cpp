#include <bits/stdc++.h>
using namespace std;
#if __has_include(<atcoder/all>)
#include <atcoder/all>
using namespace atcoder;
#endif

struct Init { Init() { ios::sync_with_stdio(0); cin.tie(0); } }init;

typedef long long ll;
typedef pair<int,int> pii;
typedef pair<ll,ll> pll;

using ull = unsigned long long;
using ll = long long;
using vi = vector<int>;
using vl = vector<long>;
using vll = vector<long long>;
using vvi = vector<vi>;
using vvl = vector<vl>;
using vvll = vector<vll>;
using vs = vector<string>;
using pii = pair<int, int>;

#define reps(i, a, n) for (ll i = (a); i < (ll)(n); ++i)
#define rep(i, x, limit) for (int i = (int)x; i < (int)limit; i++)
#define REP(i, x, limit) for (int i = (int)x; i <= (int)limit; i++)
#define repd(i,n) for(ll i=n-1;i>=0;i--)
#define rrepd(i,n) for(ll i=n;i>=1;i--)

#define el '\n'
#define spa " "
#define pb push_back
#define mp make_pair
#define all(x) x.begin(), x.end()
#define rall(x) x.rbegin(), x.rend()
#define YESNO(bool) if(bool){cout<<"YES"<<endl;}else{cout<<"NO"<<endl;}
#define yesno(bool) if(bool){cout<<"yes"<<endl;}else{cout<<"no"<<endl;}
#define YesNo(bool) if(bool){cout<<"Yes"<<endl;}else{cout<<"No"<<endl;}
#define YES cout << "Yes" << el
#define NO cout << "No" << el

const double pi = 3.141592653589793238;
const int inf = 1073741823;
const ll infl = 1LL << 60;

using P = pair<int,int>;
using Graph = vector<vector<int>>;
//using mint = modint1000000007;

//配列の要素を空白区切りで出力(デバッグ用)
template<class T> inline void print_vec(const vector<T>& v) {
    for (int i = 0; i < v.size(); i++) {
        if(v[i]==inf || v[i]==infl) cout << 'o' << spa;
        else cout << v[i] << spa;
    }
    cout << endl;
}

// 第一引数と第二引数を比較し、第一引数(a)をより大きい/小さい値に上書き
template <typename T> inline bool chmin(T& a, const T& b) {bool compare = a > b; if (a > b) a = b; return compare;}
template <typename T> inline bool chmax(T& a, const T& b) {bool compare = a < b; if (a < b) a = b; return compare;}
// clang-format on

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int n,k;
    cin>>n>>k;
    vi A(11,0),s(11,0);
    for(A[1]=0;(1<n?s[0]+1*A[1]<=k:A[1]==0);A[1]++){ s[1]=s[0]+1*A[1];
    for(A[2]=0;(2<n?s[1]+2*A[2]<=k:A[2]==0);A[2]++){ s[2]=s[1]+2*A[2];
    for(A[3]=0;(3<n?s[2]+3*A[3]<=k:A[3]==0);A[3]++){ s[3]=s[2]+3*A[3];
    for(A[4]=0;(4<n?s[3]+4*A[4]<=k:A[4]==0);A[4]++){ s[4]=s[3]+4*A[4];
    for(A[5]=0;(5<n?s[4]+5*A[5]<=k:A[5]==0);A[5]++){ s[5]=s[4]+5*A[5];
    for(A[6]=0;(6<n?s[5]+6*A[6]<=k:A[6]==0);A[6]++){ s[6]=s[5]+6*A[6];
    for(A[7]=0;(7<n?s[6]+7*A[7]<=k:A[7]==0);A[7]++){ s[7]=s[6]+7*A[7];
    for(A[8]=0;(8<n?s[7]+8*A[8]<=k:A[8]==0);A[8]++){ s[8]=s[7]+8*A[8];
    for(A[9]=0;(9<n?s[8]+9*A[9]<=k:A[9]==0);A[9]++){ s[9]=s[8]+9*A[9];
        if((k-s[9])%n==0){
            A[n]=(k-s[9])/n;
            rep(i,1,n+1) cout<<A[i]<<(i==n?'\n':' ');
        }
    }}}}}}}}}
}
