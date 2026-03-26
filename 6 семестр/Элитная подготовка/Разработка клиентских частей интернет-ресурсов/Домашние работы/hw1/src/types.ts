export interface Place {
    id: number;
    name: string;
    description: string;
    image: string;
}

export interface Monument {
    id: number;
    name: string;
    year: number;
    image: string;
}

export interface HistoryFactType {
    id: number;
    year: number;
    fact: string;
}
