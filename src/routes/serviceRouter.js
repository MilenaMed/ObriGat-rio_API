import { Router } from "express"
import { validateSchema } from "../middlewares/validateSchema.js"
import authMiddleware from "../middlewares/authMiddleware.js"
import { postAddService } from "../controllers/serviceController.js"
import { AddServiceSchema } from "../schema/serviceSchema.js"
import { getCats } from "../controllers/serviceController.js"

const serviceRouter = Router()

serviceRouter.post("/addService", validateSchema(AddServiceSchema), authMiddleware, postAddService)
serviceRouter.get("/home", getCats)

export default serviceRouter