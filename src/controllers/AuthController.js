import { v4 as uuid } from "uuid"
import bcrypt from "bcrypt"
import { db } from "../database/database.conection.js";

//POST - signup
export async function postSignUp (request, response) {
    const { ongName, password, confirmPassword, email, city, contact } = request.body;
    const encryptedPassword = bcrypt.hashSync(password, 10);
    const existingUser = await db.query(`SELECT * FROM ong WHERE email=$1;`, [email])
    const existingNumber = await db.query(`SELECT * FROM ong WHERE contact=$1;`, [contact])

    if (existingUser.rowCount !== 0 || existingNumber.rowCount !== 0) {
        return response.status(409).send("Este email ou telefone já está cadastrado")
    }
    if (password !== confirmPassword) {
        return response.status(422).send("Senhas diferentes")
    }

    try {
        await db.query(`INSERT INTO ong ("ongName", email, password, city, contact) VALUES ($1, $2, $3, $4, $5);`, [ongName, email, encryptedPassword, city, contact])
        return response.status(201).send("Usuário Cadastrado!")
    } catch (err) {
        return response.status(500).send(err.message)
    }
};

//POST - signin
export async function postLogin (request, response){
    const token = uuid()
    const { email, password } = request.body
    const existingUser = await db.query(`SELECT * FROM ong WHERE email=$1;`, [email])
    
    if (existingUser.rowCount === 0) {
        return response.status(401).send("usuário não cadastrado")
    }

    const correctPassword = bcrypt.compareSync(password, existingUser.rows[0].password)
    if (!correctPassword) {
        return response.status(401).send("senha incorreta")
    }

    try {
        await db.query(`INSERT INTO session ("ongId", token) VALUES ($1, $2);`, [existingUser.rows[0].id, token])
        response.status(200).send({ token: token })
    } catch (err) {
        response.status(500).send(err)
    }
}