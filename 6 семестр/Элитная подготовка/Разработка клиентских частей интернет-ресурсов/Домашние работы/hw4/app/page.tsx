import Link from "next/link";
import { getAllNews } from "@/lib/data";

export default function Home() {
    const news = getAllNews();

    // throw Error(); // для проверки error.tsx

    return (
        <>
            <h1 className="text-3xl font-bold mb-8 text-center">
                Последние новости
            </h1>
            <div className="news-grid">
                {news.map((item) => {
                    const image = item.attachments?.[0]?.image?.src;

                    return (
                        <Link key={item.id} href={`/news/${item.id}`}>
                            <div className="card group">
                                <div className="card-image-wrapper">
                                    {image ? (
                                        <img src={image} alt="" className="card-image" />
                                    ) : (
                                        <span className="card-placeholder">
                                            Нет изображения
                                        </span>
                                    )}
                                </div>
                                <div className="card-content">
                                    <p className="card-type">
                                        {item.type}
                                    </p>
                                    <h3 className="card-title">
                                        {item.text}
                                    </h3>
                                    <p className="card-date">
                                        {new Date(item.date * 1000).toLocaleDateString()}
                                    </p>
                                </div>
                            </div>
                        </Link>
                    );
                })}
            </div>
        </>
    );
}
