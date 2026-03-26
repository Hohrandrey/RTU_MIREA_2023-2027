import React, { useState } from 'react';
import Header from './components/Header/Header';
import Information from './components/Information/Information';
import EntertainmentPlaces from './components/EntertainmentPlaces/EntertainmentPlaces';
import Monuments from './components/Monuments/Monuments';
import HistoryFact from './components/HistoryFact/HistoryFact';
import Footer from './components/Footer/Footer';
import styles from './App.module.css';
import { cityInfo, places, monuments, historyFacts } from './data';

const App: React.FC = () => {
    const [theme, setTheme] = useState<'light' | 'dark'>('light');

    const toggleTheme = () => {
        setTheme((prev) => (prev === 'light' ? 'dark' : 'light'));
    };

    return (
        <div className={`${styles.app} ${styles[theme]}`}>
            <Header title={cityInfo.name} />
            <button onClick={toggleTheme} className={styles.themeButton}>
                {theme === 'light' ? '🌙 Тёмная тема' : '☀️ Светлая тема'}
            </button>
            <Information
                description={cityInfo.description}
                population={cityInfo.population}
                founded={cityInfo.founded}
            />
            <EntertainmentPlaces places={places} />
            <Monuments monuments={monuments} />
            <HistoryFact facts={historyFacts} />
            <Footer />
        </div>
    );
};

export default App;
