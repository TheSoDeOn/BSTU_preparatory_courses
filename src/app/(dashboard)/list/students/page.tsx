import DownloadButton from "@/components/DownloadButton";
import DownloadButtonJson from "@/components/DownloadButtonJson";
import FormContainer from "@/components/FormContainer";
import FormModal from "@/components/FormModal";
import Pagination from "@/components/Pagination";
import Table from "@/components/Table";
import TableSearch from "@/components/TableSearch";
import prisma from "@/lib/prisma";
import { ITEMS_PER_PAGE } from "@/lib/settings";
import { auth } from "@clerk/nextjs/server";
import { Prisma, Student, Class } from "@prisma/client";
import Image from "next/image";
import Link from "next/link";

type StudentList = Student & { class: Class };

const StudentListPage = async ({
  searchParams,
}: {
  searchParams: { [key: string]: string | undefined };
}) => {
  const { page, ...queryParams } = searchParams;

  const { userId, sessionClaims } = await auth();
  const role = (sessionClaims?.metadata as { role?: string })?.role;

  const p = page ? parseInt(page) : 1;

  const columns = [
    {
      header: "Информация",
      accessor: "info",
    },
    {
      header: "Имя пользователя",
      accessor: "studentId",
      className: "hidden md:table-cell",
    },
    {
      header: "Группа подготовки",
      accessor: "grade",
      className: "hidden md:table-cell",
    },
    {
      header: "Телефон",
      accessor: "phone",
      className: "hidden lg:table-cell",
    },
    {
      header: "Адрес",
      accessor: "address",
      className: "hidden lg:table-cell",
    },
    ...(role === "admin"
      ? [
          {
            header: "Действия",
            accessor: "action",
          },
        ]
      : []),
  ];
  
  const renderRow = (item: StudentList) => (
    <tr
      key={item.id}
      className="border-b border-gray-200 even:bg-slate-50 text-sm hover:bg-verySkyBlue"
    >
      <td className="flex items-center gap-4 p-4">
        <Image
          src={item.img}
          alt=""
          width={40}
          height={40}
          className="md:hidden xl:block w-10 h-10 rounded-full object-cover"
        />
        <div className="flex flex-col">
          <h3 className="font-semibold">
            {`${item.surname} ${item.name} ${item.patronymic}`}
          </h3>
          <p className="text-xs text-gray-500">{item.class.name}</p>
        </div>
      </td>
      <td className="hidden md:table-cell">{item.username}</td>
      <td className="hidden md:table-cell">{item.class.name}</td>
      <td className="hidden md:table-cell">{item.phone}</td>
      <td className="hidden md:table-cell">{item.address}</td>
      <td>
        <div className="flex items-center gap-2">
          <Link href={`/list/students/${item.id}`}>
            <button className="w-7 h-7 flex items-center justify-center rounded-full bg-skyBlueBSTU">
              <Image src="/view.png" alt="" width={16} height={16} />
            </button>
          </Link>
          {role === "admin" && (
            <FormContainer table="student" type="delete" id={item.id} />
          )}
        </div>
      </td>
    </tr>
  );


  // URL-параметры

  const query: Prisma.StudentWhereInput = {};

  if (queryParams) {
    for (const [key, value] of Object.entries(queryParams)) {
      if (value !== undefined) {
        switch (key) {
          case "teacherid":
            query.class = {
              lessons: {
                some: {
                  teacherId: value,
                },
              },
            };
            break;
          case "search":
            query.surname = { contains: value, mode: "insensitive" };
            break;
          case "classId":
            query.classId = parseInt(value);
            break;
        }
      }
    }
  }

  const [data, count] = await prisma.$transaction([
    prisma.student.findMany({
      where: query,
      include: {
        class: true,
      },
      take: ITEMS_PER_PAGE,
      skip: ITEMS_PER_PAGE * (p - 1),
    }),
    prisma.student.count({ where: query }),
  ]);

  const excelData = await prisma.student.findMany({
    where: query,
    include: {
      class: true,
      parent: true,
    }});

  return (
    <div className="bg-white p-4 rounded-md flex-1 m-4 mt-0">
      {/* ВВЕРХ */}
      <div className="flex items-center justify-between">
        <h1 className="hidden md:block text-lg font-semibold">Студенты</h1>
        <div className="flex flex-col md:flex-row items-center gap-4 w-full md:w-auto">
          <TableSearch />
          <div className="flex items-center gap-4 self-end">
            <button className="w-8 h-8 flex items-center justify-center rounded-full bg-blueBSTU">
              <Image src="/filter.png" alt="" width={17} height={17} />
            </button>
            <button className="w-8 h-8 flex items-center justify-center rounded-full bg-blueBSTU">
              <Image src="/sort.png" alt="" width={17} height={17} />
            </button>
            {role === "admin" && <FormContainer table="student" type="create" />}
            <DownloadButton data={excelData} />
            <DownloadButtonJson data={excelData} />
          </div>
        </div>
      </div>
      {/* таблица */}
      <Table columns={columns} renderRow={renderRow} data={data} />
      {/* управление страницами таблицы */}
      <Pagination page={p} count={count} />
    </div>
  );
};

export default StudentListPage;
