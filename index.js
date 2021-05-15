const express=require("express");
const bodyParser=require("body-parser");
const {Pool}=require('pg');
const ejs=require('ejs');


const  port=process.env.PORT || 3000;

require('dotenv').config();
// set production variable. This will be called when deployed to a live host
const isProduction = process.env.NODE_ENV === 'production';
const connectionString = `postgresql://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_DATABASE}`;

const pool = new Pool({
    connectionString: isProduction ? process.env.DATABASE_URL : connectionString,
    ssl: isProduction,
  });
const app=express();
app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static("public"));
app.set('view engine','ejs');
app.set('views', 'public/views');
app.get("/",function(req,res)
{
    res.sendFile(__dirname+ "/index.html");
});

app.get("/home",function(req,res)
{
res.sendFile(__dirname+"/home.html");
});
app.get("/details",function(req,res)
{
   
   pool.query(`select * from customers`,(err,result)=>
   {
       if(!err)
       {
           res.render("details",{ set:result.rows});
       }
       else
       console.log(err);

       
   })
   
        
        
});
app.get("/history",function(req,res)
{
    pool.query(`select * from transcation_tb`,(err,result)=>
   {
     if(!err)
       {
        res.render("history",{ set:result.rows});
       }
       else
       console.log(err);
})
});
app.get("/transfer",function(req,res)
{
    res.sendFile(__dirname+ "/transfer.html");
 
});


    app.post('/transfer', (req, res)=>
    {
        var dcid=req.body.dcid;
        var dname=req.body.dname;
        var i=0;
        pool.query(`insert into depositor (customer_id,cust_name,time_date,amount) values ($1,$2::text,NOW(),$3::money) `,[dcid,dname,req.body.depositmoney])
        .then(pool.query(`insert into receiver (transcation_id,customer_id,cust_name,amount,time_date) values ($1,$2,$3::text,$4::money,NOW())`, 
              [i++,req.body.rcid,req.body.rname,req.body.depositmoney] ))
             .then( pool.query('update customers set balance=balance+$1::money  where customer_id=$2 ',[req.body.depositmoney,req.body.rcid]))
             .then( pool.query('update customers set balance=balance-$1::money  where customer_id=$2 ',[req.body.depositmoney,req.body.dcid])) 
             .then(pool.query(`insert into transcation_tb (sender,receiver,amount,time_date) values ($1::text,$2::text,$3::money,NOW())`, 
              [req.body.dname,req.body.rname,req.body.depositmoney] ))
             .then( res.sendFile(__dirname+ "/modal.html"))
             .catch((err) => {
               console.log(err)
              })
});

 


app.listen(port,function()
{
    console.log(`Server is running on port ${port}`);
});
