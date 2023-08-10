import { db } from "../database/database.conection.js"

//POST- addService
export async function postAddService(request, response) {
    const { ongId } = response.locals
    const { catName, datadescription, photo, available } = request.body
    const contact = await db.query(`SELECT * FROM ong WHERE id=$1;`, [ongId]);


    try {
        console.log(contact.rows[0].contact)
        await db.query(`INSERT INTO cat ("catName", datadescription, photo, "ongId", available, "ongContact") VALUES ($1, $2, $3, $4, $5, $6);`, [catName, datadescription, photo, ongId, available, contact.rows[0].contact])
        return response.status(201).send("Gato cadastrado!")
    } catch (err) {
        return response.status(500).send(err.message)
    }
};