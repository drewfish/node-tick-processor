node-tick-processor
===================

easy-to-install processor for the v8 profiler log

This is little more than a repackaging of the "tick processor" that ships with the v8 source code.


## Installation
`$ npm install -g node-tick-processor`


## Usage
* Run your script with profiling enabled, to generate the `v8.log` file
    * `$ node --prof myscript.js`
* In the same directory, run this script
    * `$ node-tick-processor`

For help, add the `--help` flag.


## Contributing
* checkout your own copy of the source (or make a fork first)
* edit `header.js` as desired
* run `./rebuild.sh`
* submit changes in a github issue (or pull request)


## License
The parts of this project that are checked into the 
[node-tick-processor](http://github.com/drewfish/node-tick-processor.git)
git repository are released into the Public Domain by Drew Folta.

The parts of this project that come from the
[v8](http://github.com/v8/v8.git)
git repository are licensed according to the licensing agreement found in that repository.


