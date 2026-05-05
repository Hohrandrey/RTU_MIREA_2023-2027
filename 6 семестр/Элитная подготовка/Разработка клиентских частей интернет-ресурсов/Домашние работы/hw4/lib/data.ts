import data from "@/data.json";

export const getAllNews = () => data;
export const getNewsById = (id: number) =>
    data.find((item) => item.id === id);
