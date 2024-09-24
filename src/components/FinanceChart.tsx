"use client";

import Image from "next/image";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";

const data = [
  {
    name: "Январь",
    Доходы: 4000,
    Расходы: 2400,
  },
  {
    name: "Февраль",
    Доходы: 3000,
    Расходы: 1398,
  },
  {
    name: "Март",
    Доходы: 2000,
    Расходы: 9800,
  },
  {
    name: "Апрель",
    Доходы: 2780,
    Расходы: 3908,
  },
  {
    name: "Май",
    Доходы: 1890,
    Расходы: 4800,
  },
  {
    name: "Июнь",
    Доходы: 2390,
    Расходы: 3800,
  },
  {
    name: "Июль",
    Доходы: 3490,
    Расходы: 4300,
  },
  {
    name: "Август",
    Доходы: 3490,
    Расходы: 4300,
  },
  {
    name: "Сентябрь",
    Доходы: 3490,
    Расходы: 4300,
  },
  {
    name: "Октябрь",
    Доходы: 3490,
    Расходы: 4300,
  },
  {
    name: "Ноябрь",
    Доходы: 3490,
    Расходы: 4300,
  },
  {
    name: "Декабрь",
    Доходы: 3490,
    Расходы: 4300,
  },
];

const FinanceChart = () => {
  return (
    <div className="bg-white rounded-xl w-full h-full p-4">
      <div className="flex justify-between items-center">
        <h1 className="text-lg font-semibold">Прибыль</h1>
        <Image src="/moreDark.png" alt="" width={20} height={20} />
      </div>
      <ResponsiveContainer width="100%" height="90%">
        <LineChart
          width={500}
          height={300}
          data={data}
          margin={{
            top: 5,
            right: 30,
            left: 20,
            bottom: 5,
          }}
        >
          <CartesianGrid strokeDasharray="3 3" stroke="#ddd" />
          <XAxis
            dataKey="name"
            axisLine={false}
            tick={{ fill: "#9A9A9A" }}
            tickLine={false}
            tickMargin={10}
          />
          <YAxis axisLine={false} tick={{ fill: "#9A9A9A" }} tickLine={false}  tickMargin={20}/>
          <Tooltip />
          <Legend
            align="center"
            verticalAlign="top"
            wrapperStyle={{ paddingTop: "10px", paddingBottom: "30px" }}
          />
          <Line
            type="monotone"
            dataKey="Доходы"
            stroke="#53AADF"
            strokeWidth={5}
          />
          <Line type="monotone" dataKey="Расходы" stroke="#122C53" strokeWidth={5}/>
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
};

export default FinanceChart;