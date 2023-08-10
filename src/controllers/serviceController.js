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

//GET - Services
export async function getCats(request, response) {
    try {
        const { rows: cats } = await db.query(`
    SELECT cat."catName", cat.datadescription, cat.photo, cat."ongContact", cat."forAdoption"
    FROM cat
    WHERE available = $1;
`, [true]);

        return response.send(cats);
    } catch (err) {
        response.status(500).send(err)
    }
};

//GET - availability
export async function getMyCats(request, response) {
    const { ongId } = response.locals
    try {
        const { rows: cats } = await db.query(`
        SELECT cat."catName", cat.photo, cat.available, cat."ongContact", cat.datadescription
        FROM cat
        WHERE cat."ongId"=$1
    `, [ongId]);

        return response.status(200).send(cats)

    } catch (err) {
        response.status(500).send(err)
    }
};


//UPDATE - availability:id
export async function updateAvailability(request, response) {
    const { id } = request.params
    const { ongId } = response.locals

    try {
        const chosenCat = await db.query(`SELECT "ongId", available FROM cat WHERE id=$1;`, [id]);
        if (chosenCat.rowCount === 0) {
            return response.status(404).send("Gato não encontrado")
        }
        if (chosenCat.rows[0].ongId !== ongId) {
            return response.status(404).send("Você não pode editar esse dado")
        }
        if (chosenCat.rows[0].available === true) {
            await db.query(`UPDATE cat SET available = false WHERE "id" = $1;`, [id])
        }
        if (chosenCat.rows[0].available === false) {
            await db.query(`UPDATE cat SET available = true WHERE "id" = $1;`, [id])
        }

        return response.status(200).send("Disponibilidade ajustada");

    } catch (err) {
        response.status(500).send(err)
    }
};