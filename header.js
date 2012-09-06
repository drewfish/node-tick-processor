var libfs = require('fs'),
    arguments,
    v8_log_lines;

function print() {
    console.log.apply(console, arguments);
}

function quit(code) {
    process.exit(code || 0);
}

function read(filename) {
    return libfs.readFileSync(filename, 'utf-8');
}

function readline() {
    // TODO: really should read from process.stdin instead
    if (!v8_log_lines.length) {
        return;
    }
    return v8_log_lines.shift();
}

arguments = process.argv.slice(2);
if ('darwin' === process.platform) {
    arguments.push('--mac');
    arguments.push('--nm=mac-nm');
}


v8_log_lines = read('v8.log').split('\n');

