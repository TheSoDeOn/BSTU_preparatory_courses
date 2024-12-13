const { PrismaClient } = require('@prisma/client');
const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');
const axios = require('axios');

require('dotenv').config();

const prisma = new PrismaClient();
const DATABASE_URL = process.env.DATABASE_URL;

const YANDEX_DISK_TOKEN = process.env.YANDEX_DISK_TOKEN; // токен доступа к Яндекс Диску

async function backupDatabase(): Promise<string> {
    const date = new Date().toISOString().replace(/:/g, '-');
    const backupFile = path.join(__dirname, `backup-${date}.sql`);

    const command = `pg_dump ${DATABASE_URL}`;

    return new Promise<string>((resolve, reject) => {
        const output = fs.createWriteStream(backupFile);
        const pgDumpProcess = exec(command);

        pgDumpProcess.stdout.pipe(output);
        pgDumpProcess.on('error', (error: Error | null) => {
            reject(new Error(`Ошибка при создании бэкапа: ${error?.message}`));
        });

        output.on('finish', () => {
            console.log(`Бэкап базы данных создан: ${backupFile}`);
            resolve(backupFile);
        });
    });
}

async function uploadToYandexDisk(filePath: string): Promise<void> {
    const fileName = path.basename(filePath);
    console.log(`Начинаем отправку файла: ${filePath}`);

    // Получаем URL для загрузки файла
    const sendUrlResponse = await axios.get(`https://cloud-api.yandex.net:443/v1/disk/resources/upload/?path=app:/${fileName}&overwrite=true`, {
        headers: {
            'Authorization': `OAuth ${YANDEX_DISK_TOKEN}`,
            'Content-Type': 'application/octet-stream',
        }
    });

    const uploadUrl = sendUrlResponse.data.href; // Получаем ссылку для загрузки

    // Отправляем файл на Яндекс Диск
    const sendFileResponse = await axios.put(uploadUrl, fs.createReadStream(filePath), {
        headers: {
            'Content-Type': 'application/octet-stream',
            'Authorization': `OAuth ${YANDEX_DISK_TOKEN}`
        }
    });

    console.log(`Загрузка завершена. Файл загружен на Яндекс Диск: ${fileName}`);
}


async function main(): Promise<void> {
    try {
        const backupFilePath = await backupDatabase();
        await uploadToYandexDisk(backupFilePath);
    } catch (error) {
        console.error(error);
    } finally {
        await prisma.$disconnect();
    }
}

main();