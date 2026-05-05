import "./globals.css";
import Link from "next/link";
import React from "react";

export default function RootLayout({ children, modal }: {
    children: React.ReactNode;
    modal: React.ReactNode;
}) {
    return (
        <html lang="ru">
        <body>
        <header className="header">
            <div className="header-inner">
                <Link href="/">
                    <h1 className="logo">
                        Новостной сайт Вики
                    </h1>
                </Link>
            </div>
        </header>
        <main className="container py-6 sm:py-8">
            {children}
        </main>
        {modal}
        </body>
        </html>
    );
}
