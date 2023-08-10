import { Router } from "express"
import { postLogin, postSignUp } from "../controllers/AuthController.js"
import { loginSchema, signUpSchema } from "../schema/authSchema.js"
import { validateSchema } from "../middlewares/validateSchema.js"

const authRouter = Router()

authRouter.post("/signup", validateSchema(signUpSchema), postSignUp)
authRouter.post("/signin", validateSchema(loginSchema), postLogin)

export default authRouter