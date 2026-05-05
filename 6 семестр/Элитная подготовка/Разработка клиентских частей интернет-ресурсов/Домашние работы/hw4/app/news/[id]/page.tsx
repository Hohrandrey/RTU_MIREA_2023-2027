import { notFound } from "next/navigation";
import { getAllNews, getNewsById } from "@/lib/data";

export const dynamicParams = false;
export function generateStaticParams() {
    const news = getAllNews();

    return news.map((item) => ({
        id: item.id.toString(),
    }));
}

export default async function NewsPage({ params }: {
    params: Promise<{ id: string }>;
}) {
    const { id } = await params;
    const news = getNewsById(Number(id));
    if (!news) return notFound();
    const image = news.attachments?.[0]?.image?.src;

    return (
        <div className="page-container">
            <div className="page-card">
                {image && (
                    <img src={image} alt="" className="page-image" />
                )}
                <h1 className="page-title">
                    {news.text}
                </h1>
                <p className="page-date">
                    {new Date(news.date * 1000).toLocaleString()}
                </p>
            </div>
        </div>
    );
}
