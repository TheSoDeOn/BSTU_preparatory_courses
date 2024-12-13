import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { ClerkProvider } from "@clerk/nextjs";
import { ruRU } from '@clerk/localizations'
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css"

const inter = Inter({ subsets: ["latin", "cyrillic"] });

export const metadata: Metadata = {
  title: "БГТУ Подкурсы",
  description: "Подготовительные курсы БГТУ им. В.Г. Шухова",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <ClerkProvider localization={ruRU}>
      <html lang="ru">
        <body className={inter.className}>{children} <ToastContainer position="bottom-right"/></body>
      </html>
    </ClerkProvider>
  );
}
