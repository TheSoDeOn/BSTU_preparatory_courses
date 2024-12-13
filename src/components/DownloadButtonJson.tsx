"use client"

import Image from "next/image";

interface StudentData {
  surname: string;
  name: string;
  patronymic: string | null;
  username: string;
  class: {
    name: string;
  };
  parent: {
    surname: string;
    name: string;
    patronymic: string | null;
  };
  phone: string;
  address: string;
  birthday: Date; // Дата рождения
  sex: string; // Пол
  discountPercent: number; // Процент скидки
}

interface DownloadButtonProps {
  data: StudentData[];
}

const DownloadButton = ({ data }: DownloadButtonProps) => {
  const downloadJsonFile = () => {
    const jsonData = JSON.stringify(data, null, 2); // Преобразуем данные в строку JSON с отступами

    const blob = new Blob([jsonData], {
      type: "application/json", // Указываем MIME-тип файла
    });

    const link = document.createElement("a"); // Создаем элемент <a>
    link.href = URL.createObjectURL(blob); // Создаем временный URL для Blob
    link.download = "студенты.json"; // Имя файла для скачивания
    link.click(); // Имитируем клик для скачивания
  };

  return (
    <button onClick={downloadJsonFile} className="w-8 h-8 flex items-center justify-center rounded-full bg-blueBSTU">
      <Image src="/json.png" alt="" width={20} height={20} />
    </button>
  );
};

export default DownloadButton;
