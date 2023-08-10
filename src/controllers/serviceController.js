import { db } from "../database/database.conection.js"

//POST- addService
export async function postAddService (request, response) {
    const { catName, datadescription, photo, available } = request.body
    try {
        await db.query(`INSERT INTO cat ("catName", datadescription, photo, available) VALUES ($1, $2, $3, $4);`, [catName, datadescription, photo, available])
        return response.status(201).send("Usuário Cadastrado!")
    } catch (err) {
        return response.status(500).send(err.message)
    }
};