"use client";
import Image from "next/image";
import {
  BarChart,
  Bar,
  Rectangle,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";

const data = [
  {
    name: "Пн",
    Присутсвие: 60,
    Отсутствие: 40,
  },
  {
    name: "Вт",
    Присутсвие: 70,
    Отсутствие: 60,
  },
  {
    name: "Ср",
    Присутсвие: 90,
    Отсутствие: 75,
  },
  {
    name: "Чт",
    Присутсвие: 90,
    Отсутствие: 75,
  },
  {
    name: "Пт",
    Присутсвие: 65,
    Отсутствие: 55,
  },
];

const AttendanceChart = () => {
  return (
    <div className="bg-white rounded-lg p-4 h-full">
      <div className="flex justify-between items-center">
        <h1 className="text-lg font-semibold">Успеваемость</h1>
        <Image src="/moreDark.png" alt="" width={20} height={20} />
      </div>
      <ResponsiveContainer width="100%" height="90%">
        <BarChart width={500} height={300} data={data} barSize={20}>
          <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#ddd" />
          <XAxis
            dataKey="name"
            axisLine={false}
            tick={{ fill: "#9A9A9A" }}
            tickLine={false}
          />
          <YAxis axisLine={false} tick={{ fill: "#9A9A9A" }} tickLine={false} />
          <Tooltip
            contentStyle={{ borderRadius: "10px", borderColor: "lightgray" }}
          />
          <Legend
            align="left"
            verticalAlign="top"
            wrapperStyle={{ paddingTop: "20px", paddingBottom: "40px" }}
          />
          <Bar
            dataKey="Присутсвие"
            fill="#53AADF"
            legendType="circle"
            radius={[10, 10, 0, 0]}
          />
          <Bar
            dataKey="Отсутствие"
            fill="#122C53"
            legendType="circle"
            radius={[10, 10, 0, 0]}
          />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
};

export default AttendanceChart;