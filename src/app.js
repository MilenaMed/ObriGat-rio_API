import express from "express";
import router from "./routes/indexRouter.js";
import dotenv from "dotenv";
import cors from "cors";

const app = express();

//Ferramentas
app.use(express.json())
app.use(router)
dotenv.config()
app.use(cors())



//Porta
const port = process.env.PORT || 5000
app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`)
})