/**
 * Created by nikolai on 7/8/17.
 */
var MongoClient = require('mongodb').MongoClient;
var util = require('util');
// var url = "mongodb://localhost:27017/mydb";
var url = util.format('mongodb://%s:%s/%s', process.env.MONGO_HOST, process.env.MONGO_PORT, process.env.MONGO_DB);

MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    console.log("Database created!");

    db.createCollection("customers", function(err, res) {
        if (err) throw err;
        console.log("Table created!");

        var myobj = { name: "Company Inc", address: "Highway 37" };
        db.collection("customers").insertOne(myobj, function(err, res) {
            if (err) throw err;
            console.log("1 record inserted");

            var cursor = db.collection("customers").find();
            cursor.each(function (err, item) {
                if(item == null){
                    db.close();
                    return;
                }
                console.log(item);
            });
        });
    });
});