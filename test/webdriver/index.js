var assert = require('chai').assert;
var webdriver = require('selenium-webdriver'),
    By = require('selenium-webdriver').By;

describe('Webdriver tests', function () {
    this.timeout(5000);
    it('should ensure that Hello World is displayed', function (done) {
        var driver = new webdriver.Builder()
            .forBrowser('phantomjs')
            .build();
        driver.get('http://localhost:3000');
        driver.findElement(By.id('hello')).getText().then(function (text) {
            assert(text === 'Hello Team', 'Expected page to display Hello World');
            done();
        });
        driver.quit();
    });
});


