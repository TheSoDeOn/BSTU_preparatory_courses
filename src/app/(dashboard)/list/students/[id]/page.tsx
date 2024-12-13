import Announcements from "@/components/Annoucements";
import BigCalendar from "@/components/BigCalendar";
import BigCalendarContainer from "@/components/BigCalendarContainer";
import FormContainer from "@/components/FormContainer";
import StudentAttendanceCard from "@/components/StudentAttendanceCard";
import prisma from "@/lib/prisma";
import { auth } from "@clerk/nextjs/server";
import { Class, Student } from "@prisma/client";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Suspense } from "react";

const SingleStudentPage = async ({
  params: { id },
}: {
  params: { id: string };
}) => {
  const { sessionClaims } = await auth();
  const role = (sessionClaims?.metadata as { role?: string })?.role;

  const student:
    | (Student & {
        class: Class & { _count: { lessons: number } };
      })
    | null = await prisma.student.findUnique({
    where: { id },
    include: {
      class: { include: { _count: { select: { lessons: true } } } },
    },
  });

  if (!student) {
    return notFound();
  }

  return (
    <div className="flex-1 p-4 flex flex-col gap-4 xl:flex-row">
      {/* Левая панель */}
      <div className="w-full xl:w-2/3">
        {/* ВВЕРХ */}
        <div className="flex flex-col lg:flex-row gap-4">
          {/* КАРТОЧКА ЮЗЕРА*/}
          <div className="bg-skyBlueBSTU py-6 px-4 rounded-md flex-1 flex gap-4">
            <div className="w-1/3">
              <Image
                src={student.img}
                alt=""
                width={144}
                height={144}
                className="w-36 h-36 rounded-full object-cover"
              />
            </div>
            <div className="w-2/3 flex flex-col justify-between gap-4">
            <div className="flex items-center gap-4">
              <h1 className="text-xl font-semibold text-white">
              {student.name + " " + student.surname}
              </h1>
              {role === "admin" && (
                  <FormContainer table="student" type="update" data={student} />
                )}
              </div>
              <div className="flex items-center justify-between gap-2 flex-wrap text-xs font-medium text-gray-100">
                <div className="w-full md^w-1/3 flex items-center  gap-2">
                  <Image src="/mail.png" alt="" width={18} height={18} />
                  <span>{student.email || "-"}</span>
                </div>
                <div className="w-full md^w-1/3 flex items-center  gap-2">
                  <Image src="/phone.png" alt="" width={18} height={18} />
                  <span>{student.phone}</span>
                </div>
              </div>
            </div>
          </div>
          {/* Мини-карточки*/}
          <div className="flex-1 flex gap-4 justify-between flex-wrap">
            {/* Карточка */}
            <div className="bg-white p-4 rounded-md flex-gap w-full md:w-[48%] xl:w-[45%] 2xl:w-[48%]">
              <Image
                src="/singleAttendance.png"
                alt=""
                width={25}
                height={25}
                className="w-6 h-6"
              />
              <Suspense fallback="Загрузка...">
                <StudentAttendanceCard id={student.id} />
              </Suspense>
              </div>
            {/* Карточка */}
            <div className="bg-white p-4 rounded-md flex-gap w-full md:w-[48%] xl:w-[45%] 2xl:w-[48%]">
              <Image
                src="/singleBranch.png"
                alt=""
                width={25}
                height={25}
                className="w-6 h-6"
              />
              <div className="">
                <h1 className="text xl font-semibold">{student.discountPercent}</h1>
                <span className="text-sm text-gray-400">Процент скидки</span>
              </div>
            </div>
            {/* Карточка */}
            <div className="bg-white p-4 rounded-md flex-gap w-full md:w-[48%] xl:w-[45%] 2xl:w-[48%]">
              <Image
                src="/singleLesson.png"
                alt=""
                width={25}
                height={25}
                className="w-6 h-6"
              />
              <div className="">
                <h1 className="text xl font-semibold">{student.class._count.lessons}</h1>
                <span className="text-sm text-gray-400">Занятий</span>
              </div>
            </div>
            {/* Карточка */}
            <div className="bg-white p-4 rounded-md flex-gap w-full md:w-[48%] xl:w-[45%] 2xl:w-[48%]">
              <Image
                src="/singleClass.png"
                alt=""
                width={25}
                height={25}
                className="w-6 h-6"
              />
              <div className="">
                <h1 className="text xl font-semibold">{student.class.name}</h1>
                <span className="text-sm text-gray-400">Группа подготовки</span>
              </div>
            </div>
          </div>
        </div>
        {/* НИЗ */}
        <div className="mt-4 bg-white rounded-md p-4 h-[800px]">
            <h1>Расписание</h1>
            <BigCalendarContainer type="classId" id={student.class.id} />
        </div>
      </div>
      {/* Правая панель*/}
      <div className="w-full xl:w-1/3">
        <div className="bg-white p-4 rounded-md">
            <h1 className="text-xl font-semibold">Ссылки</h1>
            <div className="mt-4 flex gap-4 flex-wrap text-xs text-gray-500">
                <Link className="p-3 rounded-md bg-verySkyBlue" href={`/list/lessons?classid=${student.class.id}`}>Занятия</Link>
                <Link className="p-3 rounded-md bg-verySkyBlue" href={`/list/teachers?classid=${student.class.id}`}>Преподаватели</Link>
                <Link className="p-3 rounded-md bg-verySkyBlue" href={`/list/results?classid=${student.class.id}`}>Результаты</Link>
                <Link className="p-3 rounded-md bg-verySkyBlue" href={`/list/exams?classid=${student.class.id}`}>Экзамены</Link>
                <Link className="p-3 rounded-md bg-verySkyBlue" href={`/list/assignments?studentid=${student.id}`}>Задания</Link>
            </div>
        </div>
        <Announcements/>
      </div>
    </div>
  );
};

export default SingleStudentPage;
