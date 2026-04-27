import React, { useState } from 'react';
import type {HistoryFactType} from '../../types.ts';
import styles from './HistoryFact.module.css';

interface HistoryFactProps {
    facts: HistoryFactType[];
}

const HistoryFact: React.FC<HistoryFactProps> = ({ facts }) => {
    const [currentFact, setCurrentFact] = useState<HistoryFactType | null>(null);

    const getRandomFact = () => {
        const randomIndex = Math.floor(Math.random() * facts.length);
        setCurrentFact(facts[randomIndex]);
    };

    return (
        <section className={styles.fact}>
            <h2>Исторический факт</h2>
            <button onClick={getRandomFact} className={styles.button}>
                Показать случайный факт
            </button>
            {currentFact && (
                <div className={styles.card}>
                    <p>
                        <strong>{currentFact.year} год:</strong> {currentFact.fact}
                    </p>
                </div>
            )}
        </section>
    );
};

export default HistoryFact;
