import { z } from "zod";

export const subjectSchema = z.object({
  id: z.coerce.number().optional(),
  name: z.string().min(1, { message: "Введите название предмета!" }),
  teachers: z.array(z.string()),
});

export type SubjectSchema = z.infer<typeof subjectSchema>;

export const classSchema = z.object({
  id: z.coerce.number().optional(),
  name: z.string().min(1, { message: "Введите название группы подготовки!" }),
  capacity: z.coerce.number().min(1, { message: "Введите количество студентов!" }),
  gradeId: z.coerce.number().min(1, { message: "Введите класс!" }),
  supervisorId: z.coerce.string().optional(),
});

export type ClassSchema = z.infer<typeof classSchema>;

export const teacherSchema = z.object({
  id: z.string().optional(),
  username: z
    .string()
    .min(3, { message: "Имя пользователя должно содержать не менее 3 символов!" })
    .max(20, { message: "Имя пользователя должно содержать не более 20 символов!" }),
  password: z
    .string()
    .min(8, { message: "Пароль должен содержать не менее 8 символов!" })
    .optional()
    .or(z.literal("")),
  name: z.string().min(1, { message: "Введите имя!" }),
  surname: z.string().min(1, { message: "Введите фамилию!" }),
  patronymic: z.string().min(1, { message: "Введите отчество!" }),
  email: z
    .string()
    .email({ message: "Некорректный email-адрес!" })
    .optional()
    .or(z.literal("")),
  phone: z.string().min(8, {message: "Введите номер телефона!"}),
  address: z.string(),
  birthday: z.coerce.date({ message: "Введите дату рождения!" }),
  sex: z.enum(["MALE", "FEMALE"], { message: "Выберете пол!" }),
  subjects: z.array(z.string()),
});

export type TeacherSchema = z.infer<typeof teacherSchema>;

export const studentSchema = z.object({
  id: z.string().optional(),
  username: z
    .string()
    .min(3, { message: "Имя пользователя должно содержать не менее 3 символов!" })
    .max(20, { message: "Имя пользователя должно содержать не более 20 символов!" }),
  password: z
    .string()
    .min(8, { message: "Пароль должен содержать не менее 8 символов!" })
    .optional()
    .or(z.literal("")),
    name: z.string().min(1, { message: "Введите имя!" }),
    surname: z.string().min(1, { message: "Введите фамилию!" }),
    patronymic: z.string().min(1, { message: "Введите отчество!" }),
  email: z
    .string()
    .email({ message: "Некорректный email-адрес!" })
    .optional()
    .or(z.literal("")),
  phone: z.string(),
  address: z.string(),
  img: z.string().optional(),
  birthday: z.coerce.date({ message: "Введите дату рождения!" }),
  sex: z.enum(["MALE", "FEMALE"], { message: "Выберете пол!" }),
  discountPercent: z.coerce.number(),
  gradeId: z.coerce.number().min(1, { message: "Выберете уровень класса!" }),
  classId: z.coerce.number().min(1, { message: "Выберете класс!" }),
  parentId: z.string().min(1, { message: "Выберете родителей!" }),
});

export type StudentSchema = z.infer<typeof studentSchema>;

export const examSchema = z.object({
  id: z.coerce.number().optional(),
  title: z.string().min(1, { message: "Введите название экзамена!" }),
  startTime: z.coerce.date({ message: "Выберете время начала!" }),
  endTime: z.coerce.date({ message: "Выберете время конца!" }),
  lessonId: z.coerce.number({ message: "Выберете урок!" }),
});

export type ExamSchema = z.infer<typeof examSchema>;

export const parentSchema = z.object({
  id: z.string().optional(),
  username: z
    .string()
    .min(3, { message: "Имя пользователя должно содержать не менее 3 символов!" })
    .max(20, { message: "Имя пользователя должно содержать не более 20 символов!" }),
  password: z
    .string()
    .min(8, { message: "Пароль должен содержать не менее 8 символов!" })
    .optional()
    .or(z.literal("")),
  name: z.string().min(1, { message: "Введите имя!" }),
  surname: z.string().min(1, { message: "Введите фамилию!" }),
  patronymic: z.string().min(1, { message: "Введите отчество!" }),
  email: z
    .string()
    .email({ message: "Некорректный email-адрес!" })
    .optional()
    .or(z.literal("")),
  phone: z.string().min(8, {message: "Введите номер телефона!"}),
  address: z.string(),
});

export type ParentSchema = z.infer<typeof parentSchema>;

export const eventSchema = z.object({
  id: z.coerce.number().optional(),
  title: z.string().min(1, { message: "Введите заголовок события!" }),
  description: z.string().min(1, { message: "Введите описания события!" }),
  startTime: z.coerce.date({ message: "Выберете время начала!" }),
  endTime: z.coerce.date({ message: "Выберете время конца!" }),
  classId: z.coerce.number().optional(),
});

export type EventSchema = z.infer<typeof eventSchema>;


export const announcementSchema = z.object({
  id: z.coerce.number().optional(),
  title: z.string().min(1, { message: "Введите заголовок события!" }),
  description: z.string().min(1, { message: "Введите описания события!" }),
  date: z.coerce.date({ message: "Выберете дату события!" }),
  classId: z.coerce.number().optional(),
});

export type AnnouncementSchema = z.infer<typeof announcementSchema>;