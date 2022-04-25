import { Request, Response } from "express";
import userService, { CreateUserData } from "../services/userService.js";

export async function signUp(req: Request, res: Response) {
  const user: CreateUserData = req.body;

  await userService.insert(user);

  res.sendStatus(201);
}

export async function signIn(req: Request, res: Response) {
  const user: CreateUserData = req.body;

  const token = await userService.signIn(user);

  res.send(token);
}

async function signIn({ email, password }: CreateUserData) {
  const user = await userRepository.findByEmail(email);
  if (!user) throw { type: "unauthorized", message: "Invalid credentials" };

  const isPasswordValid = bcrypt.compareSync(password, user.password);
  if (!isPasswordValid)
    throw { type: "unauthorized", message: "Invalid credentials" };

  const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET);
  return token;
}
