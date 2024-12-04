import FormModal from "@/components/FormModal";
import Pagination from "@/components/Pagination";
import Table from "@/components/Table";
import TableSearch from "@/components/TableSearch";
import {
  assignmentsData,
  role,
} from "@/lib/data";
import Image from "next/image";

type Assignment = {
  id: number;
  subject: string;
  class: string;
  teacher: string;
  dueDate: string;
};

const columns = [
  {
    header: "Предмет",
    accessor: "name",
  },
  {
    header: "Класс",
    accessor: "class",
  },
  {
    header: "Преподаватель",
    accessor: "teacher",
    className: "hidden md:table-cell",
  },
  {
    header: "Деадлайн",
    accessor: "dueDate",
    className: "hidden md:table-cell",
  },
  {
    header: "Действия",
    accessor: "action",
  },
];

const AssignmentListPage = () => {
  const renderRow = (item: Assignment) => (
    <tr
      key={item.id}
      className="border-b border-gray-200 even:bg-slate-50 text-sm hover:bg-verySkyBlue"
    >
      <td className="flex items-center gap-4 p-4">{item.subject}</td>
      <td>{item.class}</td>
      <td className="hidden md:table-cell">{item.teacher}</td>
      <td className="hidden md:table-cell">{item.dueDate}</td>
      <td>
        <div className="flex items-center gap-2">
          {(role === "admin" || role === "teacher") && (
            <>
              <FormModal table="assignment" type="update" data={item} />
              <FormModal table="assignment" type="delete" id={item.id} />
            </>
          )}
        </div>
      </td>
    </tr>
  );

  return (
    <div className="bg-white p-4 rounded-md flex-1 m-4 mt-0">
      {/* ВВЕРХ */}
      <div className="flex items-center justify-between">
        <h1 className="hidden md:block text-lg font-semibold">Задания</h1>
        <div className="flex flex-col md:flex-row items-center gap-4 w-full md:w-auto">
          <TableSearch />
          <div className="flex items-center gap-4 self-end">
            <button className="w-8 h-8 flex items-center justify-center rounded-full bg-blueBSTU">
              <Image src="/filter.png" alt="" width={14} height={14} />
            </button>
            <button className="w-8 h-8 flex items-center justify-center rounded-full bg-blueBSTU">
              <Image src="/sort.png" alt="" width={14} height={14} />
            </button>
            {(role === "admin" || role === "teacher") && <FormModal table="assignment" type="create" />}
          </div>
        </div>
      </div>
      {/* Таблица */}
      <Table columns={columns} renderRow={renderRow} data={assignmentsData} />
      {/* управление страницами таблицы */}
      <Pagination />
    </div>
  );
};

export default AssignmentListPage;