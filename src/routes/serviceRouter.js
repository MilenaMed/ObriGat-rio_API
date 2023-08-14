import { Router } from "express"
import { validateSchema } from "../middlewares/validateSchema.js"
import authMiddleware from "../middlewares/authMiddleware.js"
import { postAddService, updateAvailability, getCats, getMyCats } from "../controllers/serviceController.js"
import { AddServiceSchema } from "../schema/serviceSchema.js"

const serviceRouter = Router()

serviceRouter.post("/addService", validateSchema(AddServiceSchema), authMiddleware, postAddService)
serviceRouter.get("/home", authMiddleware, getCats)
serviceRouter.get("/myCats", authMiddleware, getMyCats)
serviceRouter.post("/myCats/:id", authMiddleware, updateAvailability)

export default serviceRouter