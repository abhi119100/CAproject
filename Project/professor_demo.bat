@echo off
cls
echo =============================================================
echo                  CA PROJECT DEMONSTRATION
echo                     Flight Route Analysis
echo =============================================================
echo Student: [Your Name]
echo Course: [Course Code]
echo Date: %date%
echo =============================================================
echo.

echo PHASE 1: GRAPH GENERATION
echo -------------------------
echo Generating flight network with 25 cities...
.\graphGen.exe 25
echo.
echo Saving graph data to flight.txt for analysis...
.\graphGen.exe 25 > flight.txt
echo Data saved successfully!
echo.

echo PHASE 2: ADJACENCY MATRIX DISPLAY  
echo ---------------------------------
echo Displaying graph as adjacency matrix representation...
echo 25 | .\WA.exe
echo.

echo PHASE 3: ALGORITHM DEMONSTRATIONS
echo =================================
echo.

echo TASK 1: Shortest Path with Connection Limit
echo -------------------------------------------
echo Testing: Moscow to Geneva with max 2 connections
.\routeSearch.exe 1 "Moscow, Russia" "Geneva, Switzerland" 2
echo.
echo Testing: Seoul to Tokyo with max 3 connections  
.\routeSearch.exe 1 "Seoul, South Korea" "Tokyo, Japan" 3
echo.

echo TASK 2: Route Through Specific Cities
echo -------------------------------------
echo Testing: Moscow through Seoul and Geneva to Tokyo
.\routeSearch.exe 2 "Moscow, Russia" through "Seoul, South Korea" and "Geneva, Switzerland" to "Tokyo, Japan"
echo.

echo TASK 3: Optimal Meeting Point
echo -----------------------------
echo Testing: Finding meeting point for Moscow, Seoul, and Tokyo
.\routeSearch.exe 3 "Moscow, Russia" "Seoul, South Korea" "Tokyo, Japan"
echo.

echo =============================================================
echo                    DEMONSTRATION COMPLETE
echo =============================================================
echo.
echo PROJECT COMPONENTS:
echo - graphGen.exe: Random flight network generator
echo - WA.exe: Adjacency matrix display  
echo - routeSearch.exe: Three routing algorithms
echo.
echo ALGORITHMS IMPLEMENTED:
echo 1. BFS shortest path with connection limits
echo 2. Multi-waypoint optimal routing
echo 3. Optimal meeting point calculation
echo.
echo DATA STRUCTURES USED:
echo - Adjacency list graph representation
echo - Hash map for city name lookups
echo - BFS with parent tracking for path reconstruction
echo =============================================================
pause 