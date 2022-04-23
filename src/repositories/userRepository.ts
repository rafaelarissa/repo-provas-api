import { prisma } from "../database.js";
import { CreateUserData } from "../services/userService.js";

async function findByEmail(email: string) {
  return prisma.users.findUnique({
    where: {
      email,
    },
  });
}

async function findById(id: number) {
  return prisma.users.findUnique({
    where: {
      id,
    },
  });
}

async function insert(createUserData: CreateUserData) {
  await prisma.users.create({
    data: createUserData,
  });
}

export default {
  findByEmail,
  insert,
  findById,
};
