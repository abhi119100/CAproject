@echo off
echo ============================================
echo       CA PROJECT - COMPLETE DEMO
echo ============================================
echo.

echo Step 1: Generating 25-city flight graph...
echo --------------------------------------------
.\graphGen.exe 25

echo.
echo Step 2: Saving graph data...
echo ---------------------------
.\graphGen.exe 25 > flight.txt

echo.
echo Step 3: Displaying adjacency matrix...
echo -------------------------------------
echo 25 | .\WA.exe

echo.
echo Step 4: Testing route searches...
echo --------------------------------
echo Testing Moscow to Seoul:
.\routeSearch.exe 1 "Moscow, Russia" "Seoul, South Korea" 3

echo.
echo Testing Hong Kong to Geneva:
.\routeSearch.exe 1 "Hong Kong, SAR" "Geneva, Switzerland" 3

echo.
echo ============================================
echo       CA PROJECT DEMO COMPLETE
echo ============================================
echo.
echo Available commands:
echo   .\graphGen.exe [num_cities]
echo   echo [num_cities] ^| .\WA.exe
echo   .\routeSearch.exe 1 "City1" "City2" [max_conn]
echo.
pause
