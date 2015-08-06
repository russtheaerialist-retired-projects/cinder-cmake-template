This is a template project that gives you a quick setup for a Cinder app that uses cmake + ninja for the build system.  I prefer command line build tools over IDEs, and ninja is super fast and bad ass.  You can use blocks with this setup by installing the [cinderblock-to-cmake](https://github.com/RussTheAerialist/cinderblock-to-cmake) tool that I also wrote.  This is how the blocks/Cmake/cinder-kinect.cmake file was generated.

## To Build
2. install ninja and then cmake
3. Clone or download and unzip Cinder so it has the same parent directory as this project
3. Rename the cinder download (or symlink, that's what I do) so that the directory is named cinder-latest
3. run `./update.sh` which will generate the ninja files
3. run `./build.sh` which will build the project
3. run `./run.sh` which will run the project
