// Initialisierung Express
const express = require('express');
const app = express();

// Initialisierung body-parser
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: true}));

// Initialisierung EJS
app.engine('.ejs', require('ejs').__express);
app.set('view engine', 'ejs');

// Initialisierung sqlite Datenbank
const DATABASE = "kalender.db";
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database(DATABASE);

// Server starten
app.listen(3000, function(){
    console.log("listening on 3000");
});

app.get("/termine", function(req,res){
    db.all(`
    SELECT 
        benutzer.benutzername AS benutzer_name,
        datum.name AS datum,
        termine.eintrag AS eintrag    
    FROM
        datum, termine, benutzer
    WHERE
        benutzer.id = termine.benutzer_id
    AND 
        datum.id = termine.datum
    `,
    function(err,rows) {
        console.log(err);
        console.log(rows);
        res.render("terminliste", {"terminliste":rows});
    }
    );
});



/* Anzeige aller Termine
app.get("/terminliste", function(req, res){
    db.all(
        `SELECT * FROM termine`, 
        function(err, rows){
            console.log(rows);
            res.render("terminliste", {"termine": rows});
        }
    );
});

// Formular zum Hinzufügen eines Termines
app.get("/create", function(req, res){
    res.sendFile(__dirname + "/views/create.html");
});

//Löschen eines Termines
app.post("/delete/:id", function(req, res){
    db.run(
        `DELETE FROM produkte WHERE id=${req.params.id}`,
        function(err){
            res.redirect("/produktliste");
        }
    );
});

//Formular zum Bearbeiten eines Termines
app.post("/update/:id", function (req, res){
    // nach Datensatz mit id suchen und Werte an Formular übergeben
    db.all(
        `SELECT * FROM termine WHERE id = ${req.params.id}`,
        function(err, rows){
            res.render("update", rows[0]);
        }
    );
});


app.post("/onupdate/:id", function(req, res){
    const param_name = req.body.terminname;
    const param_preis = req.body.termindatum;
    const param_id = req.params.id;

    db.run(
        `UPDATE produkte SET name="${param_name}", datum=${param_preis} WHERE id=${param_id}`,
        function(err){
            res.redirect("/terminliste");
        }
    );
});*/

