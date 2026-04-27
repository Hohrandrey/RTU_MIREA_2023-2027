import React from 'react';
import styles from './Information.module.css';

interface InformationProps {
    description: string;
    population: number;
    founded: number;
}

const Information: React.FC<InformationProps> = ({ description, population, founded }) => {
    return (
        <section className={styles.info}>
            <h2>О городе</h2>
            <p>{description}</p>
            <ul>
                <li>Основан: {founded} г.</li>
                <li>Население: {population.toLocaleString()} чел.</li>
            </ul>
        </section>
    );
};

export default Information;
