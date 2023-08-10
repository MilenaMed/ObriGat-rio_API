import { Router } from "express"
import authRouter from "./authRouter.js"
import serviceRouter from "./serviceRouter.js"

const router = Router()

router.use(authRouter)
router.use(serviceRouter)

export default router