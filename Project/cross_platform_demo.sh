#!/bin/bash

clear
echo "============================================================="
echo "           FLIGHT ROUTE ANALYSIS - CROSS PLATFORM DEMO"
echo "============================================================="
echo
echo "This demo works on Mac/Linux. For Windows, see commands below."
echo

# Check if executables exist and have execute permissions
if [ ! -x "./graphGen" ]; then
    echo "Setting execute permissions for Mac/Linux..."
    chmod +x graphGen WA routeSearch 2>/dev/null || true
fi

echo "============================================================="
echo "                    MAC/LINUX COMMANDS"
echo "============================================================="
echo

echo "STEP 1: Generate Flight Network"
echo "--------------------------------"
echo "Command: ./graphGen 25"
./graphGen 25
echo

echo "STEP 2: Save Graph Data"
echo "-----------------------"
echo "Command: ./graphGen 25 > flight.txt"
./graphGen 25 > flight.txt
echo "Graph data saved to flight.txt"
echo

echo "STEP 3: Display Adjacency Matrix"
echo "--------------------------------"
echo "Command: echo 25 | ./WA"
echo 25 | ./WA
echo

echo "STEP 4: Test Route Search Algorithms"
echo "====================================="
echo

echo "TASK 1: Shortest Path with Connection Limit"
echo "-------------------------------------------"
echo "Command: ./routeSearch 1 \"Moscow, Russia\" \"Tokyo, Japan\" 3"
./routeSearch 1 "Moscow, Russia" "Tokyo, Japan" 3
echo

echo "TASK 2: Route Through Specific Cities"
echo "-------------------------------------"
echo "Command: ./routeSearch 2 \"Moscow, Russia\" through \"London, United Kingdom\" and \"Paris, France\" to \"Tokyo, Japan\""
./routeSearch 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "Tokyo, Japan"
echo

echo "TASK 3: Optimal Meeting Point"
echo "-----------------------------"
echo "Command: ./routeSearch 3 \"Moscow, Russia\" \"London, United Kingdom\" \"Tokyo, Japan\""
./routeSearch 3 "Moscow, Russia" "London, United Kingdom" "Tokyo, Japan"
echo

echo "============================================================="
echo "                    WINDOWS EQUIVALENT COMMANDS"
echo "============================================================="
echo
echo "The same operations on Windows would use these commands:"
echo
echo "STEP 1: .\\graphGen.exe 25"
echo "STEP 2: .\\graphGen.exe 25 > flight.txt"
echo "STEP 3: echo 25 | .\\WA.exe"
echo "STEP 4: .\\routeSearch.exe 1 \"Moscow, Russia\" \"Tokyo, Japan\" 3"
echo "        .\\routeSearch.exe 2 \"Moscow, Russia\" through \"London, United Kingdom\" and \"Paris, France\" to \"Tokyo, Japan\""
echo "        .\\routeSearch.exe 3 \"Moscow, Russia\" \"London, United Kingdom\" \"Tokyo, Japan\""
echo
echo "NOTE: Windows uses .exe extensions and backslash prefixes"
echo

echo "============================================================="
echo "                    DEMO COMPLETE"
echo "============================================================="
echo
echo "AVAILABLE FILES:"
echo "- README.txt: Complete installation and usage guide"
echo "- project_summary.txt: Technical documentation"
echo "- Source code: graphGen.cpp, WA.cpp, routeSearch.cpp"
echo
echo "FOR COMPILATION:"
echo "Mac/Linux: Use g++ or clang (see README.txt)"
echo "Windows: Use Visual Studio or MinGW (see README.txt)"
echo
echo "COMPILATION EXAMPLES:"
echo "g++ -o graphGen graphGen.cpp"
echo "g++ -o WA WA.cpp"
echo "g++ -o routeSearch routeSearch.cpp"
echo
read -p "Press Enter to exit..." 