var express = require('express');
var request = require('request');
var bodyParser = require('body-parser');

var app = express();

app.use(express.static('assets'));
app.use(bodyParser.urlencoded({ extended: false }));


var braintree = require("braintree");

var gateway = braintree.connect({
  environment: braintree.Environment.Sandbox,
  merchantId: "ffdkybmfrh2gkhvs",
  publicKey: "jsx9dmc6kjnc3ng3",
  privateKey: "6fe0af112496b4af016889b474cd9866"
});


app.get("/client_token", function (req, res) {
  gateway.clientToken.generate({}, function (err, response) {
    res.send(response.clientToken);
    //console.log("Sent the token");
  });
});


app.get("/savings/:user", function (req, res) {
  var url = 'http://134.213.221.48/users/' + req.params.user + '/transactions';
  request(url, function(err, response, body) {
    var data = JSON.parse(body);
    var returnData = parseData(data);
    res.json(returnData);
  });
});

function parseData(data) {
  var counter = 0;
  var savedSum = 0;
  data.forEach(function(line) {
    if (line.pocketCcy !== line.partyCcy) {
      savedSum += (Math.abs(line.amount)) * 0.05;
      counter++;
    }
  });
  var ret = {
    totalSavings: savedSum,
    totalEarnings: savedSum * 1.1,
    averageSave: savedSum / counter
  }
  return ret;  
}


app.post("/checkout", function (req, res) {
  var nonce = req.body.payment_method_nonce;
  // console.log(req.body.amount);
  gateway.transaction.sale({
    amount: req.body.amount,
    paymentMethodNonce: nonce,
  }, function (err, result) {
    if (!err) {
      console.log("successful");
      res.send('index.html');  
    } else {
      console.log("error");
    }
  });
});


app.get('/', function (req, res) {
  res.send('index.html');
});

var users = ["56241a14de4bf40b17112dbd", "56241a14de4bf40b17112dca", 
"56241a14de4bf40b17112dcb", "56241a14de4bf40b17112dbc", 
"56241a14de4bf40b17112dbb", "56241a14de4bf40b17112dba"];

function makeTransaction(to, from, sum, resp) {
  var postData = {
    "medium": "balance",
    "payee_id": from,
    "amount": sum,
    "transaction_date": "2015-12-12",
    "status": "pending",
    "description": "string"
  };
  console.log(postData);
  request({
    url: 'http://api.reimaginebanking.com/accounts/' + to + '/transfers?key=c1b8b3094ebc402ba35af8c1b8e3aa1a', //URL to hit
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    },
    json: postData
  }, function (error, response, body) {
    if (error) {
      console.log(error);
    } else {
      console.log(response);
      //resp.send(response);
    }
  });
}

app.get('/create', function (req, res) {
  
  users.forEach(function(senderId) {
    users.forEach(function(receiverId) {
      makeTransaction(senderId, receiverId, Math.floor((Math.random() * 3000)), res);
    });
  });
  res.send("done");
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});