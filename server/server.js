var express = require('express');
var routes = require('./routes.js');
var cors = require('cors');
var Twitter = require('twitter');
var fs = require('fs');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var cron = require('node-cron');
var child_process = require('child_process');
var spawn = require('child_process').spawn;

var app = express();

app.use(cors());
app.use(bodyParser.json());
app.use(morgan('dev'));
app.use('/', routes);

app.use('/', express.static('HomepageClient'));
app.use('/dashboard', express.static('DashboardClient'));

app.listen(3000, function (req, res) {
	console.log('server is listening on 3000');
});

// var csvScheduler = cron.schedule('* * * * *', function() {
//   console.log('Update CSV running');
//   exec(__dirname + '/updateCSV.sh', function(error, stdout, stderr) {
//       console.log('stdout: ', stdout);
//       console.log('stderr: ', stderr);
//       if (error !== null) {
//           console.log('exec error: ', error);
//       }
//   });
// }, false);

// var fbScrape = cron.schedule('* * * * *', function() {
	// console.log('Facebook scraper is running!')
	// var process = child_process.spawn('python', ['./facebookScraper/fbScrape.py'])
	// process.stdout.on('data', 'utf8', function(data) {
	// 	console.log('IT WORKED!', data);
	// });
// }, false)


// var ls = spawn('python',['./server/facebookScraper/fbScrape.py']);	


// THIS SECTION IS WORKING!
// var fbScrape = cron.schedule('0 * * * *', function() {
// 	// console.log('Facebook scraper is running!')
//   var ls = spawn('python',['./server/facebookScraper/fbScrape.py']);	
// }, false)

var loadDatabase = cron.schedule('* * * * *', function() {
	console.log('Loading files into MySQL!')
	var loadCSV = spawn('sh', ['./server/updateCsv.sh']);
}, false)

// fbScrape.start();

var ls = spawn('python',['./server/facebookScraper/fbScrape.py']);	
loadDatabase.start();



// ls.stdout.on('data', function (data) {
//     console.log('stdout: ' + data);
// });

// ls.stderr.on('data', function (data) {
//     console.log('stderr: ' + data);
// });



// CRON SCHEDULE FOR EVERY 1 HR 15 MINUTES
// 15 * * * *
// CRON SCHEDULE FOR EVERY 1 HR 0 MINUTES 
// 0 * * * *


// runScraper.start();
// csvScheduler.start();
// facebookScrapeScheduler.start();

