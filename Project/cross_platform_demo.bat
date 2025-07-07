@echo off
cls
echo =============================================================
echo           FLIGHT ROUTE ANALYSIS - CROSS PLATFORM DEMO
echo =============================================================
echo.
echo This demo works on Windows. For Mac/Linux, see commands below.
echo.
echo =============================================================
echo                    WINDOWS COMMANDS
echo =============================================================
echo.

echo STEP 1: Generate Flight Network
echo --------------------------------
echo Command: .\graphGen.exe 25
.\graphGen.exe 25
echo.

echo STEP 2: Save Graph Data  
echo -----------------------
echo Command: .\graphGen.exe 25 ^> flight.txt
.\graphGen.exe 25 > flight.txt
echo Graph data saved to flight.txt
echo.

echo STEP 3: Display Adjacency Matrix
echo --------------------------------
echo Command: echo 25 ^| .\WA.exe
echo 25 | .\WA.exe
echo.

echo STEP 4: Test Route Search Algorithms
echo ====================================
echo.

echo TASK 1: Shortest Path with Connection Limit
echo -------------------------------------------
echo Command: .\routeSearch.exe 1 "Moscow, Russia" "Tokyo, Japan" 3
.\routeSearch.exe 1 "Moscow, Russia" "Tokyo, Japan" 3
echo.

echo TASK 2: Route Through Specific Cities
echo -------------------------------------
echo Command: .\routeSearch.exe 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "Tokyo, Japan"
.\routeSearch.exe 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "Tokyo, Japan"
echo.

echo TASK 3: Optimal Meeting Point
echo -----------------------------
echo Command: .\routeSearch.exe 3 "Moscow, Russia" "London, United Kingdom" "Tokyo, Japan"
.\routeSearch.exe 3 "Moscow, Russia" "London, United Kingdom" "Tokyo, Japan"
echo.

echo =============================================================
echo                    MAC/LINUX EQUIVALENT COMMANDS
echo =============================================================
echo.
echo The same operations on Mac/Linux would use these commands:
echo.
echo STEP 1: ./graphGen 25
echo STEP 2: ./graphGen 25 ^> flight.txt
echo STEP 3: echo 25 ^| ./WA
echo STEP 4: ./routeSearch 1 "Moscow, Russia" "Tokyo, Japan" 3
echo         ./routeSearch 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "Tokyo, Japan"
echo         ./routeSearch 3 "Moscow, Russia" "London, United Kingdom" "Tokyo, Japan"
echo.
echo NOTE: On Mac/Linux, you may need to set execute permissions:
echo       chmod +x graphGen WA routeSearch
echo.

echo =============================================================
echo                    DEMO COMPLETE
echo =============================================================
echo.
echo AVAILABLE FILES:
echo - README.txt: Complete installation and usage guide
echo - project_summary.txt: Technical documentation
echo - Source code: graphGen.cpp, WA.cpp, routeSearch.cpp
echo.
echo FOR COMPILATION:
echo Windows: Use Visual Studio or MinGW (see README.txt)
echo Mac/Linux: Use g++ or clang (see README.txt)
echo.
pause 