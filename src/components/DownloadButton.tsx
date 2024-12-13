"use client"

import ExcelJS from "exceljs";
import Image from "next/image";

interface StudentData {
  surname: string;
  name: string;
  patronymic: string | null;
  username: string;
  class: {
    name: string;
  };
  parent : {
    surname: string;
    name: string;
    patronymic: string | null;
  };
  phone: string;
  address: string;
  birthday: Date; // Добавляем дату рождения
  sex: string; // Пол
  discountPercent: number; // Процент скидки
}

interface DownloadButtonProps {
  data: StudentData[];
}

const DownloadButton = ({ data }: DownloadButtonProps) => {
  const downloadExcelTable = async () => {
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("Студенты");

    // Добавляем заголовки в таблицу
    worksheet.addRow([
      "Фамилия",
      "Имя",
      "Отчество",
      "Имя пользователя",
      "Группа подготовки",
      "Телефон",
      "Адрес",
      "Дата рождения",
      "ФИО родителя",
      "Пол",
      "Процент скидки",
    ]);

    data.forEach((item) => {
      worksheet.addRow([
        item.surname,
        item.name,
        item.patronymic,
        item.username,
        item.class.name,
        item.phone,
        item.address,
        item.birthday.toISOString().substring(0, 10), // Форматируем дату в ISO
        item.parent.surname + " " + item.parent.name + " " + item.parent.patronymic,
        item.sex,
        item.discountPercent,
      ]);
    });

    const buffer = await workbook.xlsx.writeBuffer();
    const blob = new Blob([buffer], {
      type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "студенты.xlsx";
    link.click();
  };

  return (
    <button onClick={downloadExcelTable} className="w-8 h-8 flex items-center justify-center rounded-full bg-blueBSTU">
      <Image src="/excel.png" alt="" width={20} height={20} />
    </button>
  );
};

export default DownloadButton;
