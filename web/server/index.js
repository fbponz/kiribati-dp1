const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db")

app.use(cors());
app.use(express.json());

app.post("/api/kbClient", async(req, res)=> {
    try{
     const newClient = await pool.query("INSERT INTO client (names, surname, age, gender, email, job, city) VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *", [req.body.names, req.body.surname, req.body.age, req.body.gender, req.body.email, req.body.job, req.body.city]); 
     res.json(newClient.rows[0]);
    }catch(error) {
        
        console.error(err.message);
    }
});

app.post("/api/kbQuery", async(req, res)=> {
    try{
     const newClient = await pool.query("INSERT INTO query (id_client, salary, qty_rent, like_beach, like_montain, like_hot, like_cold, cost_of_living, health_insurance, outdoor_activities, criminality_preference) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *", [req.body.id_client, req.body.salary, req.body.qty_rent, req.body.like_beach, req.body.like_montain, req.body.like_hot, req.body.like_cold, req.body.cost_of_living, req.body.health_insurance, req.body.outdoor_activities, req.body.criminality_preference]); 
     res.json(newClient.rows[0]);
    }catch(error) {
        
        console.error(err.message);
    }
});

app.post("/api/kbResults", async(req, res)=> {
    try{
     const newClient = await pool.query("INSERT INTO results (id_query, result) VALUES($1, $2) RETURNING *", [req.body.id_query, req.body.result]); 
     res.json(newClient.rows[0]);
    }catch(error) {
        
        console.error(err.message);
    }
});
app.get("/api/kbResults/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const todo = await pool.query("SELECT * FROM results WHERE id_query = $1", [
        id
      ]);
  
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
  });

app.post("/api/kbFeedbackResult", async(req, res)=> {
    try{
        const newClient = await pool.query("INSERT INTO feedback_results (id_result, feedback) VALUES($1, $2) RETURNING *", [req.body.id_result, req.body.feedback]); 
        res.json(newClient.rows[0]);
       }catch(error) {
           
           console.error(err.message);
       }
});

app.get("/api/kbDataset/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const todo = await pool.query("SELECT * FROM kiribati_dataset WHERE id_city = $1", [
        id
      ]);
  
      res.json(todo.rows[0]);
    } catch (err) {
      console.error(err.message);
    }
});

app.get("/api/kbDataset", async(req, res) => {
    try {
        const allTodos = await pool.query("SELECT * FROM kiribati_dataset")
        res.json(allTodos.rows);
    } catch(err){
        console.error(err.message)
    }
});
  

app.listen(5000, ()=> {
    console.log("server has started on port 5000");
});