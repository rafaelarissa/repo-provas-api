import { Users } from "@prisma/client";
import dotenv from "dotenv";
import bcrypt from "bcrypt";
import userRepository from "../repositories/userRepository";
dotenv.config();

export type CreateUserData = Omit<Users, "id">;
async function insert(createUserData: CreateUserData) {
  const existingUser = await userRepository.findByEmail(createUserData.email);
  if (existingUser)
    throw { type: "conflict", message: "Users must have unique emails" };

  const hashedPassword = bcrypt.hashSync(createUserData.password, 12);

  await userRepository.insert({ ...createUserData, password: hashedPassword });
}

export default {
  insert,
};
