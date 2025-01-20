local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local ri = function (insert_node_id)
    return f(function (args) return args[1][1] end, insert_node_id)
end

return {
  s("cpsingle", fmt([==[
#include <bits/stdc++.h>
using namespace std;

#define fi first
#define se second
#define si(x) int(x.size())
#define all(x) (x).begin(),(x).end()
#define rall(x) (x).rbegin(),(x).rend()
#define rep(i,n) for(int i = 0; i < (int)(n); i++)
#define rrep(i,n) for(int i = (int)(n) - 1; i >= 0; i--)
template <class T, class U> inline bool chmax(T &a, U b) {{ return (a < b ? a = b, 1 : 0); }}
template <class T, class U> inline bool chmin(T &a, U b) {{ return (b < a ? a = b, 1 : 0); }}
template <class T> istream &operator>>(istream &is, vector<T> &v) {{ for (auto &x : v) is >> x; return is; }}
template <class T> ostream &operator<<(ostream &os, const vector<T> &v) {{ rep(i, si(v)) os << (i ? " " : "") << v[i]; return os; }}
using ll = long long;
constexpr int inf = 1001001001;
constexpr long long infll = 4004004004004004004LL;

int main() {{
  ios::sync_with_stdio(false);
  cin.tie(0);

  {1}
}}
  ]==], { i(1) })),

  s("cpmulti", fmt([==[
#include <bits/stdc++.h>
using namespace std;

#define fi first
#define se second
#define si(x) int(x.size())
#define all(x) (x).begin(),(x).end()
#define rall(x) (x).rbegin(),(x).rend()
#define rep(i,n) for(int i = 0; i < (int)(n); i++)
#define rrep(i,n) for(int i = (int)(n) - 1; i >= 0; i--)
template <class T, class U> inline bool chmax(T &a, U b) {{ return (a < b ? a = b, 1 : 0); }}
template <class T, class U> inline bool chmin(T &a, U b) {{ return (b < a ? a = b, 1 : 0); }}
template <class T> istream &operator>>(istream &is, vector<T> &v) {{ for (auto &x : v) is >> x; return is; }}
template <class T> ostream &operator<<(ostream &os, const vector<T> &v) {{ rep(i, si(v)) os << (i ? " " : "") << v[i]; return os; }}
using ll = long long;
constexpr int inf = 1001001001;
constexpr long long infll = 4004004004004004004LL;

void solve() {{
  {1}
}}

int main() {{
  ios::sync_with_stdio(false);
  cin.tie(0);

  int tests;
  cin >> tests;
  while (tests--) {{
    solve();
  }}
}}
  ]==], { i(1) })),

  s("cpyesno", fmt([==[
#include <bits/stdc++.h>
using namespace std;

#define fi first
#define se second
#define si(x) int(x.size())
#define all(x) (x).begin(),(x).end()
#define rall(x) (x).rbegin(),(x).rend()
#define rep(i,n) for(int i = 0; i < (int)(n); i++)
#define rrep(i,n) for(int i = (int)(n) - 1; i >= 0; i--)
template <class T, class U> inline bool chmax(T &a, U b) {{ return (a < b ? a = b, 1 : 0); }}
template <class T, class U> inline bool chmin(T &a, U b) {{ return (b < a ? a = b, 1 : 0); }}
template <class T> istream &operator>>(istream &is, vector<T> &v) {{ for (auto &x : v) is >> x; return is; }}
template <class T> ostream &operator<<(ostream &os, const vector<T> &v) {{ rep(i, si(v)) os << (i ? " " : "") << v[i]; return os; }}
using ll = long long;
constexpr int inf = 1001001001;
constexpr long long infll = 4004004004004004004LL;

bool solve() {{
  {1}
}}

int main() {{
  ios::sync_with_stdio(false);
  cin.tie(0);

  int tests;
  cin >> tests;
  while (tests--) {{
    cout << (solve() ? "Yes\n" : "No\n");
  }}
}}
  ]==], { i(1) })),

  s("cpmint", fmt([==[
template <class T>
constexpr T power(T a, long long b) {{
  T res = 1;
  while (b) {{
    if (b & 1) res *= a;
    a *= a;
    b >>= 1;
  }}
  return res;
}}

template <int mod>
struct ModInt {{
  int x;
  constexpr ModInt() : x{{}} {{}}
  constexpr ModInt(long long x) : x{{norm(x % mod)}} {{}}

  constexpr int norm(int x) const {{
    if (x < 0) {{
      x += mod;
    }}
    if (x >= mod) {{
      x -= mod;
    }}
    return x;
  }}
  constexpr int val() const {{
    return x;
  }}
  constexpr ModInt inv() const {{
    assert(x != 0);
    return power(*this, mod - 2);
  }}
  explicit constexpr operator int() const {{
    return x;
  }}
  constexpr ModInt operator-() const {{
    ModInt res;
    res.x = norm(mod - x);
    return res;
  }}
  constexpr ModInt& operator+=(ModInt rhs) {{
    x = norm(x + rhs.x);
    return *this;
  }}
  constexpr ModInt& operator-=(ModInt rhs) {{
    x = norm(x - rhs.x);
    return *this;
  }}
  constexpr ModInt& operator++() {{
    return *this += 1;
  }}
  constexpr ModInt& operator--() {{
    return *this -= 1;
  }}
  constexpr ModInt operator++(int) {{
    ModInt res(*this);
    *this += 1;
    return res;
  }}
  constexpr ModInt operator--(int) {{
    ModInt res(*this);
    *this -= 1;
    return res;
  }}
  constexpr ModInt& operator*=(ModInt rhs) {{
    x = 1LL * x * rhs.x % mod;
    return *this;
  }}
  constexpr ModInt& operator/=(ModInt rhs) {{
    return *this *= rhs.inv();
  }}
  friend constexpr ModInt operator+(ModInt lhs, ModInt rhs) {{
    ModInt res = lhs;
    res += rhs;
    return res;
  }}
  friend constexpr ModInt operator-(ModInt lhs, ModInt rhs) {{
    ModInt res = lhs;
    res -= rhs;
    return res;
  }}
  friend constexpr ModInt operator*(ModInt lhs, ModInt rhs) {{
    ModInt res = lhs;
    res *= rhs;
    return res;
  }}
  friend constexpr ModInt operator/(ModInt lhs, ModInt rhs) {{
    ModInt res = lhs;
    res /= rhs;
    return res;
  }}
  friend constexpr std::istream& operator>>(std::istream& is, ModInt& a) {{
    long long v{{}};
    is >> v;
    a = ModInt(v);
    return is;
  }}
  friend constexpr std::ostream& operator<<(std::ostream& os, const ModInt& a) {{
    return os << a.val();
  }}
  friend constexpr bool operator==(ModInt lhs, ModInt rhs) {{
    return lhs.val() == rhs.val();
  }}
  friend constexpr bool operator!=(ModInt lhs, ModInt rhs) {{
    return lhs.val() != rhs.val();
  }}
}};

template <int num, int mod>
constexpr ModInt<mod> CInv = ModInt<mod>(num).inv();

constexpr int mod = 998244353;
using mint = ModInt<mod>;

  ]==], {})),

  s("cpcomb", fmt([==[
struct Binomial {{
  int n;
  std::vector<mint> _fac;
  std::vector<mint> _invfac;
  std::vector<mint> _inv;

  Binomial() : n{{0}}, _fac{{1}}, _invfac{{1}}, _inv{{0}} {{}}
  Binomial(int n) : Binomial() {{
    init(n);
  }}

  void init(int m) {{
    if (m <= n) return;
    _fac.resize(m + 1);
    _invfac.resize(m + 1);
    _inv.resize(m + 1);

    for (int i = n + 1; i <= m; i++) {{
      _fac[i] = _fac[i - 1] * i;
    }}
    _invfac[m] = _fac[m].inv();
    for (int i = m; i > n; i--) {{
      _invfac[i - 1] = _invfac[i] * i;
      _inv[i] = _invfac[i] * _fac[i - 1];
    }}
    n = m;
  }}

  mint fac(int m) {{
    if (m > n) init(2 * m);
    return _fac[m];
  }}
  mint invfac(int m) {{
    if (m > n) init(2 * m);
    return _invfac[m];
  }}
  mint inv(int m) {{
    if (m > n) init(2 * m);
    return _inv[m];
  }}
  mint C(int n, int r) {{
    if (n < 0 || r < 0 || n < r) return 0;
    return fac(n) * invfac(r) * invfac(n - r);
  }}
  mint P(int n, int r) {{
    if (n < 0 || r < 0 || n < r) return 0;
    return fac(n) * invfac(n - r);
  }}
}} comb;

  ]==], {})),

  s("cpbit", fmt([==[
template <typename T>
struct BIT {{
  int N;
  std::vector<T> data;

  BIT(int size = 0) {{
    init(size);
  }}

  void init(int size) {{
    N = size + 2;
    data.assign(N + 1, T{{}});
  }}

  // get sum of [0,k]
  T sum(int k) const {{
    if (k < 0) return T{{}};  // return 0 if k < 0
    T ret{{}};
    for (int i = k + 1; i > 0; i -= i & -i) ret += data[i];
    return ret;
  }}

  // get sum of [l,r]
  T sum(int l, int r) const {{ return sum(r) - sum(l - 1); }}

  // get value of k
  T operator[](int k) const {{ return sum(k) - sum(k - 1); }}

  // data[k] += x
  void add(int k, T x) {{
    for (int i = k + 1; i < N; i += i & -i) data[i] += x;
  }}

  // range add x to [l, r]
  void imos(int l, int r, T x) {{
    add(l, x);
    add(r + 1, -x);
  }}

  // get kth smallest, starts from 1
  int kth(T k) {{
    int x = 0;
    for (int i = 1 << __lg(N); i > 0; i >>= 1) {{
      if (x + i < N && data[x + i] < k) {{
        x += i;
        k -= data[x];
      }}
    }}
    return x;
  }}
}};

  ]==], {})),

  s("cpdsu", fmt([==[
struct DSU {{
  vector<int> par, sz;
  DSU(int n = 0) : par(n), sz(n, 1) {{ iota(par.begin(), par.end(), 0); }}
  int get(int x) {{
    return x == par[x] ? x : par[x] = get(par[x]);
  }}
  bool same(int x, int y) {{ return get(x) == get(y); }}
  bool unite(int x, int y) {{
    x = get(x);
    y = get(y);
    if (x == y) return false;
    sz[x] += sz[y];
    par[y] = x;
    return true;
  }}
  int size(int x) {{ return sz[get(x)]; }}
}};

  ]==], {})),

  s("cphash", fmt([==[
struct custom_hash {{
  static uint64_t splitmix64(uint64_t x) {{
    // http://xorshift.di.unimi.it/splitmix64.c
    x += 0x9e3779b97f4a7c15;
    x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9;
    x = (x ^ (x >> 27)) * 0x94d049bb133111eb;
    return x ^ (x >> 31);
  }}

  size_t operator()(uint64_t x) const {{
    static const uint64_t FIXED_RANDOM = chrono::steady_clock::now().time_since_epoch().count();
    return splitmix64(x + FIXED_RANDOM);
  }}
}};

#include <ext/pb_ds/assoc_container.hpp>
using namespace __gnu_pbds;

template <typename T, typename U, typename Hash = custom_hash>
using hmap = gp_hash_table<T, U, Hash>;

template <typename T, typename Hash = custom_hash>
using hset = hmap<T, null_type, Hash>;

  ]==], {})),

  s("cpseg", fmt([==[
template <typename T, typename F>
struct SegmentTree {{
  int N;
  int size;
  vector<T> data;
  const F f;
  const T I;

  SegmentTree(int _N, F _f, const T &_I) : f(_f), I(_I) {{ init(_N); }}

  SegmentTree(const vector<T> &v, F _f, T _I) : f(_f), I(_I) {{
    init(v.size());
    for (int i = 0; i < (int)v.size(); i++) {{
      data[i + size] = v[i];
    }}
    build();
  }}

  void init(int _N) {{
    N = _N;
    size = 1;
    while (size < N) size <<= 1;
    data.assign(2 * size, I);
  }}

  void set(int k, T x) {{ data[k + size] = x; }}

  void build() {{
    for (int k = size - 1; k > 0; k--) {{
      data[k] = f(data[2 * k], data[2 * k + 1]);
    }}
  }}

  void update(int k, T x) {{
    k += size;
    data[k] = x;
    while (k >>= 1) {{
      data[k] = f(data[2 * k], data[2 * k + 1]);
    }}
  }}

  void add(int k, T x) {{
    k += size;
    data[k] += x;
    while (k >>= 1) {{
      data[k] = f(data[2 * k], data[2 * k + 1]);
    }}
  }}

  // query to [a, b)
  T query(int a, int b) {{
    T L = I, R = I;
    for (a += size, b += size; a < b; a >>= 1, b >>= 1) {{
      if (a & 1) L = f(L, data[a++]);
      if (b & 1) R = f(data[--b], R);
    }}
    return f(L, R);
  }}

  T &operator[](const int &k) {{ return data[k + size]; }}

  // check(a[l] * ...  * a[r-1]) が true となる最大の r
  // (右端まですべて true なら N を返す)
  template <class C>
  int max_right(int l, C check) {{
    assert(0 <= l && l <= N);
    assert(check(I) == true);
    if (l == N) return N;
    l += size;
    T sm = I;
    do {{
      while (l % 2 == 0) l >>= 1;
      if (!check(f(sm, data[l]))) {{
        while (l < size) {{
          l = (2 * l);
          if (check(f(sm, data[l]))) {{
            sm = f(sm, data[l]);
            l++;
          }}
        }}
        return l - size;
      }}
      sm = f(sm, data[l]);
      l++;
    }} while ((l & -l) != l);
    return N;
  }}

  // check(a[l] * ... * a[r-1]) が true となる最小の l
  // (左端まで true なら 0 を返す)
  template <typename C>
  int min_left(int r, C check) {{
    assert(0 <= r && r <= N);
    assert(check(I) == true);
    if (r == 0) return 0;
    r += size;
    T sm = I;
    do {{
      r--;
      while (r > 1 && (r % 2)) r >>= 1;
      if (!check(f(data[r], sm))) {{
        while (r < size) {{
          r = (2 * r + 1);
          if (check(f(data[r], sm))) {{
            sm = f(data[r], sm);
            r--;
          }}
        }}
        return r + 1 - size;
      }}
      sm = f(data[r], sm);
    }} while ((r & -r) != r);
    return 0;
  }}
}};

template <typename T, typename F>
SegmentTree<T, F> get_segment_tree(int N, F f, const T &I) {{
  return SegmentTree(N, f, I);
}}

template <typename T, typename F>
SegmentTree<T, F> get_segment_tree(const vector<T> &v, F f, T I) {{
  return SegmentTree(v, f, I);
}}

  ]==], {})),

  s("usaco", fmt([==[
freopen("{}.in", "r", stdin);
freopen("{}.out", "w", stdout);
  ]==], { i(1), ri(1) })),
}
