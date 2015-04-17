var assert = require('chai').assert;
var data = require('../../message');

describe('Unit tests', function(){
    it('should return Hello World', function(done){
        var result = data.getMessage();
        assert(result === 'Hello Agile Team', 'Data mismatch');
        done();
    });
});