import { db } from "../database/database.conection.js"

export async function authMiddleware(request, response, next) {
    const { authorization } = request.headers
    const token = authorization?.replace('Bearer ', '')
    try {
        if (!token) {
            return response.status(401).send("necessário um token para prosseguir")
        }
        const isLoged = await db.query(`SELECT * FROM session WHERE token = $1;`, [token])
        if (isLoged.rowCount === 0) {
            return response.status(401).send("Usuário não está logado")
        }


        response.locals.ongId = isLoged.rows[0].ongId
        next()

    } catch (err) {
        response.status(500).send(err)
    }
}
export default authMiddleware;