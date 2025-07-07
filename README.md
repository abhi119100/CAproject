===============================================================================
                        FLIGHT ROUTE ANALYSIS SYSTEM
                             CA PROJECT README
===============================================================================

TABLE OF CONTENTS:
1. Project Overview
2. System Requirements  
3. Installation Instructions
4. Quick Start Guide
5. Detailed Usage Examples
6. Cross-Platform Commands
7. Troubleshooting
8. Project Structure
9. Algorithm Documentation
10. Contact Information

===============================================================================
1. PROJECT OVERVIEW
===============================================================================

This project implements a comprehensive flight route analysis system that 
solves three complex routing problems using graph algorithms:

• Task 1: Find shortest route between two cities with connection limits
• Task 2: Find optimal route through specific intermediate cities
• Task 3: Find optimal meeting point for three people

ALGORITHMS USED:
- Breadth-First Search (BFS) for shortest path finding
- Graph theory with adjacency list representation
- Multi-source BFS for optimization problems

PROGRAMMING LANGUAGE: C++
SUPPORTED PLATFORMS: Windows, macOS, Linux

===============================================================================
2. SYSTEM REQUIREMENTS
===============================================================================

MINIMUM REQUIREMENTS:
• Operating System: Windows 10+, macOS 10.12+, or Linux (Ubuntu 18.04+)
• RAM: 512 MB (recommended: 1 GB+)
• Storage: 50 MB free space
• C++ Compiler (if compiling from source)

WINDOWS REQUIREMENTS:
• Visual Studio 2019+ Build Tools OR
• MinGW-w64 OR  
• Dev-C++ with GCC

MAC/LINUX REQUIREMENTS:
• GCC 7.0+ OR
• Clang 6.0+ OR
• Xcode Command Line Tools (macOS)

===============================================================================
3. INSTALLATION INSTRUCTIONS
===============================================================================

OPTION A: USE PRE-COMPILED EXECUTABLES (WINDOWS ONLY)
-------------------------------------------------------
1. Download the project folder
2. Navigate to the Project directory
3. Run the executables directly (see Quick Start Guide)

OPTION B: COMPILE FROM SOURCE (ALL PLATFORMS)
----------------------------------------------

WINDOWS (Visual Studio):
1. Install Visual Studio 2019+ with C++ development tools
2. Open Command Prompt or PowerShell
3. Navigate to project directory:
   cd "C:\path\to\CAproject\Project"
4. Compile the programs:
   cl /EHsc graphGen.cpp /Fe:graphGen.exe
   cl /EHsc WA.cpp /Fe:WA.exe
   cl /EHsc routeSearch.cpp /Fe:routeSearch.exe

WINDOWS (MinGW):
1. Install MinGW-w64 from https://www.mingw-w64.org/
2. Add MinGW to your PATH environment variable
3. Open Command Prompt and navigate to project directory
4. Compile the programs:
   g++ -o graphGen.exe graphGen.cpp
   g++ -o WA.exe WA.cpp
   g++ -o routeSearch.exe routeSearch.cpp

MAC/LINUX:
1. Install development tools:
   • macOS: xcode-select --install
   • Ubuntu/Debian: sudo apt update && sudo apt install build-essential
   • CentOS/RHEL: sudo yum groupinstall "Development Tools"
2. Navigate to project directory:
   cd /path/to/CAproject/Project
3. Compile the programs:
   g++ -o graphGen graphGen.cpp
   g++ -o WA WA.cpp
   g++ -o routeSearch routeSearch.cpp

===============================================================================
4. QUICK START GUIDE
===============================================================================

STEP 1: Generate a Flight Network
----------------------------------
WINDOWS:    .\graphGen.exe 25
MAC/LINUX:  ./graphGen 25

This creates a flight network with 25 cities and random connections.

STEP 2: View the Adjacency Matrix
----------------------------------
WINDOWS:    echo 25 | .\WA.exe
MAC/LINUX:  echo 25 | ./WA

This displays the graph as an adjacency matrix with city ID assignments.

STEP 3: Test Route Searching
-----------------------------
WINDOWS:    .\routeSearch.exe 1 "Moscow, Russia" "Tokyo, Japan" 3
MAC/LINUX:  ./routeSearch 1 "Moscow, Russia" "Tokyo, Japan" 3

This finds the shortest route from Moscow to Tokyo with max 3 connections.

===============================================================================
5. DETAILED USAGE EXAMPLES
===============================================================================

GRAPH GENERATION:
-----------------
Generate different sized networks:

WINDOWS:
  .\graphGen.exe 10     # Small network (10 cities)
  .\graphGen.exe 50     # Large network (50 cities)
  .\graphGen.exe 100    # Very large network (100 cities)

MAC/LINUX:
  ./graphGen 10         # Small network (10 cities)  
  ./graphGen 50         # Large network (50 cities)
  ./graphGen 100        # Very large network (100 cities)

Save output to file:
WINDOWS:    .\graphGen.exe 30 > flight.txt
MAC/LINUX:  ./graphGen 30 > flight.txt

ADJACENCY MATRIX DISPLAY:
--------------------------
WINDOWS:    echo 30 | .\WA.exe
MAC/LINUX:  echo 30 | ./WA

ROUTE SEARCH EXAMPLES:
----------------------

TASK 1: Shortest Path with Connection Limit
WINDOWS:
  .\routeSearch.exe 1 "Moscow, Russia" "London, United Kingdom" 3
  .\routeSearch.exe 1 "Tokyo, Japan" "New York City, United States" 5

MAC/LINUX:
  ./routeSearch 1 "Moscow, Russia" "London, United Kingdom" 3
  ./routeSearch 1 "Tokyo, Japan" "New York City, United States" 5

TASK 2: Route Through Specific Cities
WINDOWS:
  .\routeSearch.exe 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "New York City, United States"

MAC/LINUX:
  ./routeSearch 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "New York City, United States"

TASK 3: Optimal Meeting Point
WINDOWS:
  .\routeSearch.exe 3 "Moscow, Russia" "Tokyo, Japan" "London, United Kingdom"

MAC/LINUX:
  ./routeSearch 3 "Moscow, Russia" "Tokyo, Japan" "London, United Kingdom"

===============================================================================
6. CROSS-PLATFORM COMMANDS
===============================================================================

COMPLETE WORKFLOW (COPY AND PASTE):

WINDOWS (PowerShell/CMD):
-------------------------
cd "C:\path\to\CAproject\Project"
echo "=== GENERATING FLIGHT NETWORK ==="
.\graphGen.exe 25
echo "=== SAVING GRAPH DATA ==="  
.\graphGen.exe 25 > flight.txt
echo "=== DISPLAYING ADJACENCY MATRIX ==="
echo 25 | .\WA.exe
echo "=== TESTING ROUTE SEARCH ==="
.\routeSearch.exe 1 "Moscow, Russia" "Tokyo, Japan" 3

MAC/LINUX (Terminal):
----------------------
cd "/path/to/CAproject/Project"
echo "=== GENERATING FLIGHT NETWORK ==="
./graphGen 25
echo "=== SAVING GRAPH DATA ==="
./graphGen 25 > flight.txt  
echo "=== DISPLAYING ADJACENCY MATRIX ==="
echo 25 | ./WA
echo "=== TESTING ROUTE SEARCH ==="
./routeSearch 1 "Moscow, Russia" "Tokyo, Japan" 3

BATCH TESTING SCRIPT:

WINDOWS (save as test_all.bat):
-------------------------------
@echo off
echo Testing all three tasks...
.\graphGen.exe 20 > flight.txt
echo 20 | .\WA.exe
.\routeSearch.exe 1 "Moscow, Russia" "Tokyo, Japan" 3
.\routeSearch.exe 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "Tokyo, Japan" 
.\routeSearch.exe 3 "Moscow, Russia" "London, United Kingdom" "Tokyo, Japan"
echo All tests completed!

MAC/LINUX (save as test_all.sh):
---------------------------------
#!/bin/bash
echo "Testing all three tasks..."
./graphGen 20 > flight.txt
echo 20 | ./WA
./routeSearch 1 "Moscow, Russia" "Tokyo, Japan" 3
./routeSearch 2 "Moscow, Russia" through "London, United Kingdom" and "Paris, France" to "Tokyo, Japan"
./routeSearch 3 "Moscow, Russia" "London, United Kingdom" "Tokyo, Japan"
echo "All tests completed!"

Run with: chmod +x test_all.sh && ./test_all.sh

===============================================================================
7. TROUBLESHOOTING
===============================================================================

COMMON ISSUES AND SOLUTIONS:

ISSUE: "Command not found" or "not recognized"
SOLUTION: 
• Windows: Use .\ prefix (.\graphGen.exe)
• Mac/Linux: Use ./ prefix (./graphGen) and ensure execute permissions

ISSUE: "Permission denied" (Mac/Linux)
SOLUTION: Make files executable:
  chmod +x graphGen WA routeSearch

ISSUE: "No route found" 
SOLUTION: 
• Try larger connection limits (increase last number)
• Generate new graph data (some graphs may be disconnected)
• Verify city names match exactly (case-sensitive)

ISSUE: Compilation errors
SOLUTION:
• Ensure C++ compiler is installed and in PATH
• Use correct compiler flags for your system
• Check that all source files are present

ISSUE: "Cannot open city.name" or "Cannot open flight.txt"
SOLUTION:
• Ensure you're in the correct directory
• Run graphGen first to create flight.txt
• Verify city.name file exists in the same directory

CITY NAME FORMAT:
• Use exact names from city.name file
• Names are case-sensitive
• Include full country/region designation
• Examples: "Moscow, Russia", "New York City, United States"

===============================================================================
8. PROJECT STRUCTURE
===============================================================================

CAproject/
├── Project/
│   ├── city.name              # List of 140 world cities
│   ├── flight.txt             # Generated flight connections
│   ├── graphGen.cpp           # Graph generator source code
│   ├── graphGen.exe           # Graph generator (Windows)
│   ├── graphGen               # Graph generator (Mac/Linux)
│   ├── WA.cpp                 # Adjacency matrix source code
│   ├── WA.exe                 # Adjacency matrix display (Windows)
│   ├── WA                     # Adjacency matrix display (Mac/Linux)
│   ├── routeSearch.cpp        # Main routing algorithms
│   ├── routeSearch.exe        # Route search program (Windows)
│   ├── routeSearch            # Route search program (Mac/Linux)
│   ├── README.txt             # This file
│   ├── professor_demo.bat     # Demo script for Windows
│   ├── professor_demo.sh      # Demo script for Mac/Linux
│   └── project_summary.txt    # Technical documentation

===============================================================================
9. ALGORITHM DOCUMENTATION
===============================================================================

TASK 1: SHORTEST PATH WITH CONNECTION LIMIT
Algorithm: Breadth-First Search (BFS)
Time Complexity: O(V + E)
Space Complexity: O(V)

Process:
1. Parse city names and convert to integer IDs
2. Build adjacency list from flight data
3. Run BFS from source city
4. Check if destination reachable within limit
5. Reconstruct and display optimal path

TASK 2: MULTI-WAYPOINT ROUTING
Algorithm: Multiple BFS with path optimization
Time Complexity: O(V + E)  
Space Complexity: O(V)

Process:
1. Run BFS from all four cities (A, B, C, D)
2. Test both possible orders: A→B→C→D and A→C→B→D
3. Choose order with minimum total connections
4. Concatenate optimal sub-paths
5. Display complete route

TASK 3: OPTIMAL MEETING POINT
Algorithm: BFS from multiple sources with global optimization
Time Complexity: O(V + E)
Space Complexity: O(V)

Process:
1. Run BFS from each person's starting city
2. For each potential meeting city:
   - Calculate total connections from all three people
   - Track minimum total found so far
3. Output optimal meeting city and individual routes

DATA STRUCTURES:
• Graph: Adjacency list (vector<vector<int>>)
• City mapping: Hash map (unordered_map<string, int>)
• Path reconstruction: Parent array (vector<int>)

===============================================================================
10. CONTACT INFORMATION
===============================================================================

PROJECT: Flight Route Analysis System
COURSE: [Your Course Code]
STUDENT: [Your Name]
EMAIL: [Your Email]
DATE: [Current Date]

For questions about:
• Algorithm implementation: See project_summary.txt
• Compilation issues: Check Section 7 (Troubleshooting)
• Usage examples: See Section 5 (Detailed Usage Examples)

ACADEMIC INTEGRITY NOTICE:
This project was completed independently following all course guidelines.
All algorithms and implementations are original work.

===============================================================================
END OF README
===============================================================================
