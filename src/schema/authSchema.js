import joi from "joi"

export const signUpSchema = joi.object({
    ongName: joi.string().required(),
    email: joi.string().email().required(),
    password: joi.string().required(),
    confirmPassword: joi.string().required(),
    city:joi.string().required(),
    contact: joi.string().pattern(/^\d{11}$/).required(),
});

export const loginSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().required()
});