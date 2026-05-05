"use client";

import { use } from "react";
import { useRouter } from "next/navigation";
import { getNewsById } from "@/lib/data";

export default function Modal({ params }: {
    params: Promise<{ id: string }>;
}) {
    const router = useRouter();
    const { id } = use(params);
    const news = getNewsById(Number(id));
    if (!news) return null;
    const image = news.attachments?.[0]?.image?.src;

    return (
        <div
            className="modal-overlay animate-fadeIn"
            onClick={() => router.back()}
        >
            <div
                className="modal-content animate-scaleIn"
                onClick={(e) => e.stopPropagation()}
            >
                <button
                    className="modal-close"
                    onClick={() => router.back()}
                >
                    X
                </button>
                {image && (
                    <img src={image} alt="" className="page-image" />
                )}
                <h2 className="page-title">
                    {news.text}
                </h2>
                <p className="page-date">
                    {new Date(news.date * 1000).toLocaleString()}
                </p>
            </div>
        </div>
    );
}
