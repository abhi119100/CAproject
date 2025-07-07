// routeSearch.cpp
// Program to answer routing queries based on airline flight graph.
// Usage examples:
//   ./routeSearch 1 "Moscow, Russia" "Tokyo, Japan" 3
//   ./routeSearch 2 "Moscow, Russia" through "Hong Kong, SAR" and "Seoul, Republic of Korea" to "Tokyo, Japan"
//   ./routeSearch 3 "Moscow, Russia" "Hong Kong, SAR" "Tokyo, Japan"
//
// The program reads the files `city.name` and `flight.txt` from the working directory
// to build an in-memory directed graph.  All edge weights are 1 and we assume
// at most 140 cities (as provided by the template).
//
// Author: <your names>
// ---------------------------------------------------------------
#include <bits/stdc++.h>
using namespace std;

// --------------  Utility helpers  ------------------------------
static inline string trim(const string &s) {
    size_t first = s.find_first_not_of(" \t\r\n");
    if (first == string::npos) return "";
    size_t last  = s.find_last_not_of(" \t\r\n");
    return s.substr(first, last - first + 1);
}

// Reconstruct path from parent array (produced by BFS).
static vector<int> buildPath(int src, int dst, const vector<int> &parent) {
    vector<int> path;
    if (parent[dst] == -1 && src != dst) return path; // unreachable
    for (int v = dst; v != -1; v = parent[v]) path.push_back(v);
    reverse(path.begin(), path.end());
    return path;
}

// Breadth-first search returning distance + parent array.
static pair<vector<int>, vector<int>> bfs(const vector<vector<int>> &adj, int src) {
    const int n = (int)adj.size();
    vector<int> dist(n, INT_MAX), parent(n, -1);
    queue<int> q;
    dist[src] = 0; q.push(src);
    while (!q.empty()) {
        int u = q.front(); q.pop();
        for (int v : adj[u]) {
            if (dist[v] == INT_MAX) {
                dist[v] = dist[u] + 1;
                parent[v] = u;
                q.push(v);
            }
        }
    }
    return {dist, parent};
}

// Concatenate two paths that share a joint node (the last node of p1 = first of p2).
static vector<int> concatPaths(const vector<int> &p1, const vector<int> &p2) {
    if (p1.empty() || p2.empty()) return {};
    vector<int> res = p1;
    res.insert(res.end(), p2.begin() + 1, p2.end());
    return res;
}

// ---------------------------------------------------------------
int main(int argc, char *argv[]) {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    if (argc < 2) {
        cerr << "usage: routeSearch <task(1-3)> ...\n";
        return 1;
    }
    const int task = atoi(argv[1]);

    // -------------------  Load city names  ---------------------
    vector<string> idToCity;
    unordered_map<string,int> cityToId;
    {
        ifstream cityFile("city.name");
        if (!cityFile) {
            cerr << "Cannot open city.name\n"; return 1; }
        string line;
        while (getline(cityFile, line)) {
            line = trim(line);
            if (line.empty()) continue;
            int id = (int)idToCity.size();
            idToCity.push_back(line);
            cityToId[line] = id;
        }
    }
    const int N = (int)idToCity.size();

    // -------------------  Build graph  -------------------------
    vector<vector<int>> adj(N);
    {
        ifstream flightFile("flight.txt");
        if (!flightFile) {
            cerr << "Cannot open flight.txt\n"; return 1; }
        string raw;
        int from = -1;
        while (getline(flightFile, raw)) {
            string line = trim(raw);
            if (line.empty()) continue;
            if (line.rfind("From:", 0) == 0) {
                string city = trim(line.substr(5)); // after "From:"
                city = trim(city);
                if (cityToId.count(city)) from = cityToId[city]; else from = -1;
            } else if (line.rfind("To", 0) == 0 || raw[0] == ' ' || raw[0]=='\t') {
                if (from == -1) continue;
                size_t colon = line.find(":"); // handle first "To  :"
                string city = (colon != string::npos) ? trim(line.substr(colon+1)) : trim(line);
                if (city.empty()) continue;
                auto it = cityToId.find(city);
                if (it != cityToId.end()) {
                    adj[from].push_back(it->second);
                }
            }
        }
    }

    auto cityId = [&](const string &name) -> int {
        auto it = cityToId.find(name);
        if (it == cityToId.end()) return -1;
        return it->second;
    };
    auto cityName = [&](int id) -> const string& { return idToCity[id]; };

    // ---------------------  Task 1  ----------------------------
    if (task == 1) {
        if (argc < 5) {
            cerr << "usage: routeSearch 1 <city_A> <city_B> <max_conn>\n"; return 1; }
        string A = argv[2];
        string B = argv[3];
        int maxConn = atoi(argv[4]);
        int s = cityId(A), t = cityId(B);
        if (s == -1 || t == -1) { cerr << "Unknown city name\n"; return 1; }
        auto [dist, parent] = bfs(adj, s);
        if (dist[t] == INT_MAX || dist[t] > maxConn) {
            cout << "No route found within " << maxConn << " connections." << endl;
            return 0;
        }
        vector<int> path = buildPath(s, t, parent);
        for (size_t i=0;i<path.size();++i) {
            if (i) cout << " to ";
            cout << cityName(path[i]);
        }
        cout << "\n\ntotal connection: " << dist[t] << "\n";
        return 0;
    }

    // ---------------------  Task 2  ----------------------------
    if (task == 2) {
        if (argc < 9) {
            cerr << "usage: routeSearch 2 <city_A> through <city_B> and <city_C> to <city_D>\n"; return 1; }
        if (string(argv[3]) != "through" || string(argv[5]) != "and" || string(argv[7]) != "to") {
            cerr << "usage: routeSearch 2 <city_A> through <city_B> and <city_C> to <city_D>\n"; return 1; }
        string A = argv[2], B = argv[4], C = argv[6], D = argv[8];
        int a = cityId(A), b = cityId(B), c = cityId(C), d = cityId(D);
        if (a==-1||b==-1||c==-1||d==-1) { cerr << "Unknown city name\n"; return 1; }

        // precompute BFS from A, B, C, D (optimal: only 4 BFS calls total)
        auto [distA, parA] = bfs(adj, a);
        auto [distB, parB] = bfs(adj, b);
        auto [distC, parC] = bfs(adj, c);
        auto [distD, parD] = bfs(adj, d);

        long best = LONG_MAX;
        vector<int> bestPath;
        // order1: A->B->C->D
        if (distA[b]!=INT_MAX && distB[c]!=INT_MAX && distC[d]!=INT_MAX) {
            long tot = distA[b]+distB[c]+distC[d];
            if (tot < best) {
                best = tot;
                vector<int> p1 = buildPath(a,b,parA);
                vector<int> p2 = buildPath(b,c,parB);
                vector<int> p3 = buildPath(c,d,parC);
                bestPath = concatPaths(concatPaths(p1,p2), p3);
            }
        }
        // order2: A->C->B->D
        if (distA[c]!=INT_MAX && distC[b]!=INT_MAX && distB[d]!=INT_MAX) {
            long tot = distA[c]+distC[b]+distB[d];
            if (tot < best) {
                best = tot;
                vector<int> p1 = buildPath(a,c,parA);
                vector<int> p2 = buildPath(c,b,parC);
                vector<int> p3 = buildPath(b,d,parB);
                bestPath = concatPaths(concatPaths(p1,p2), p3);
            }
        }
        if (best == LONG_MAX) {
            cout << "No such route." << endl; return 0; }

        for (size_t i=0;i<bestPath.size();++i) {
            if (i) cout << " to ";
            cout << cityName(bestPath[i]);
        }
        cout << "\nsmallest number of connection: " << best << "\n";
        return 0;
    }

    // ---------------------  Task 3  ----------------------------
    if (task == 3) {
        if (argc < 5) {
            cerr << "usage: routeSearch 3 <city_A> <city_B> <city_C>\n"; return 1; }
        string A = argv[2], B = argv[3], C = argv[4];
        int a = cityId(A), b = cityId(B), c = cityId(C);
        if (a==-1||b==-1||c==-1) { cerr << "Unknown city name\n"; return 1; }

        auto [distA, parA] = bfs(adj, a);
        auto [distB, parB] = bfs(adj, b);
        auto [distC, parC] = bfs(adj, c);

        long bestSum = LONG_MAX;
        int meet = -1;
        for (int v=0; v<N; ++v) {
            if (v==a||v==b||v==c) continue;
            long s1 = distA[v], s2 = distB[v], s3 = distC[v];
            if (s1==INT_MAX||s2==INT_MAX||s3==INT_MAX) continue;
            long sum = s1+s2+s3;
            if (sum < bestSum) { bestSum = sum; meet = v; }
        }
        if (meet == -1) {
            cout << "There is no such city." << endl; return 0; }

        cout << "You three should meet at " << cityName(meet) << "\n";
        vector<int> pathA = buildPath(a, meet, parA);
        vector<int> pathB = buildPath(b, meet, parB);
        vector<int> pathC = buildPath(c, meet, parC);
        auto printRoute = [&](const string &label, const vector<int>& path) {
            cout << label;
            for (size_t i=0;i<path.size();++i) {
                if (i) cout << " to ";
                cout << cityName(path[i]);
            }
            cout << " (" << (path.size()-1) << " connections)\n";
        };
        printRoute("Route for first person: ", pathA);
        printRoute("Route for second person: ", pathB);
        printRoute("Route for third person: ", pathC);
        cout << "Total number of connection: " << bestSum << "\n";
        return 0;
    }

    cerr << "Invalid task number. Use 1, 2, or 3.\n";
    return 1;
} 