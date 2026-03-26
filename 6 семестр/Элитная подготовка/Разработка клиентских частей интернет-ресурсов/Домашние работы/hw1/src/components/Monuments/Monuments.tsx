import React, { useState } from 'react';
import type {Monument} from '../../types.ts';
import styles from './Monuments.module.css';

interface MonumentsProps {
    monuments: Monument[];
}

const Monuments: React.FC<MonumentsProps> = ({ monuments }) => {
    const [favorites, setFavorites] = useState<number[]>([]);

    const toggleFavorite = (id: number) => {
        setFavorites((prev) =>
            prev.includes(id) ? prev.filter((favId) => favId !== id) : [...prev, id]
        );
    };

    return (
        <section className={styles.monuments}>
            <h2>Памятники</h2>
            <div className={styles.grid}>
                {monuments.map((mon) => (
                    <div key={mon.id} className={styles.card}>
                        <img src={mon.image} alt={mon.name} />
                        <h3>{mon.name}</h3>
                        <p>Год: {mon.year}</p>
                        <button
                            onClick={() => toggleFavorite(mon.id)}
                            className={favorites.includes(mon.id) ? styles.active : ''}
                        >
                            {favorites.includes(mon.id) ? '❤️ В избранном' : '🤍 В избранное'}
                        </button>
                    </div>
                ))}
            </div>
        </section>
    );
};

export default Monuments;
