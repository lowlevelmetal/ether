# How to build
I've included build instructions for other libraries for convenience. Please build all projects in the same directory
## GLEW
Install msys64 and launch the mingw version of msys. Then run the code generator
```
make extensions
```
Then build glew with visual studio
## Ether
I build this in a powershell environment. I installed my tools through winget (cmake, ninja, git)
```
mkdir build
cd build
cmake -G ninja ..
ninja
```