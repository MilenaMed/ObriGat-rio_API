import joi from "joi"

export const AddServiceSchema = joi.object({
    catName: joi.string().required(),
    datadescription: joi.string().required(),
    photo: joi.string().uri().required(),
    available: joi.boolean().required(),
});