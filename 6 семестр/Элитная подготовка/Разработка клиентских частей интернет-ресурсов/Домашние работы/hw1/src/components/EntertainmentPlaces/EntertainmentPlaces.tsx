import React, { useState } from 'react';
import type {Place} from '../../types.ts';
import styles from './EntertainmentPlaces.module.css';

interface EntertainmentPlacesProps {
    places: Place[];
}

const EntertainmentPlaces: React.FC<EntertainmentPlacesProps> = ({ places }) => {
    const [sortAsc, setSortAsc] = useState(true);

    const sortedPlaces = [...places].sort((a, b) =>
        sortAsc ? a.name.localeCompare(b.name) : b.name.localeCompare(a.name)
    );

    return (
        <section className={styles.places}>
            <h2>Места для отдыха</h2>
            <button onClick={() => setSortAsc(!sortAsc)} className={styles.sortButton}>
                Сортировать по имени {sortAsc ? '↓' : '↑'}
            </button>
            <div className={styles.grid}>
                {sortedPlaces.map((place) => (
                    <div key={place.id} className={styles.card}>
                        <img src={place.image} alt={place.name} />
                        <h3>{place.name}</h3>
                        <p>{place.description}</p>
                    </div>
                ))}
            </div>
        </section>
    );
};

export default EntertainmentPlaces;
