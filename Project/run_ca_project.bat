@echo off
cls
echo =============================================================
echo                   CA PROJECT EXECUTION
echo                    WINDOWS VERSION
echo =============================================================
echo.
echo NOTE: For Mac/Linux users, run: chmod +x cross_platform_demo.sh ^&^& ./cross_platform_demo.sh
echo.
echo Step 1: Generating Flight Graph (25 cities)...
echo --------------------------------------------
.\graphGen.exe 25

echo.
echo Step 2: Saving graph data to flight.txt...
echo ------------------------------------------
.\graphGen.exe 25 > flight.txt

echo.
echo Step 3: Displaying Adjacency Matrix...
echo -------------------------------------
echo 25 | .\WA.exe

echo.
echo Step 4: Testing All Route Search Algorithms...
echo ==============================================
echo.
echo TASK 1: Shortest Path with Connection Limit
echo -------------------------------------------
echo Testing route from Moscow to Tokyo:
.\routeSearch.exe 1 "Moscow, Russia" "Tokyo, Japan" 3

echo.
echo TASK 2: Route Through Specific Cities
echo -------------------------------------
echo Testing multi-waypoint route:
.\routeSearch.exe 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "Tokyo, Japan"

echo.
echo TASK 3: Optimal Meeting Point
echo -----------------------------
echo Finding optimal meeting city for three people:
.\routeSearch.exe 3 "Moscow, Russia" "London, United Kingdom" "Tokyo, Japan"

echo.
echo =============================================================
echo                   PROJECT EXECUTION COMPLETE
echo =============================================================
echo.
echo CROSS-PLATFORM RESOURCES:
echo - README.txt: Complete installation guide for all platforms
echo - compile_instructions.txt: Detailed compilation guide
echo - cross_platform_demo.sh: Mac/Linux version of this demo
echo - quick_reference.txt: Command reference card
echo.
pause
