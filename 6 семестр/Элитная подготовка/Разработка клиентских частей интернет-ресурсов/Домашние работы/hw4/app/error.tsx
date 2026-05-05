'use client';

export default function Error({ error, reset }: { error: Error; reset: () => void }) {
    return (
        <div className="fullscreen">
            <div className="centered">
                <div className="text-center">
                    <h1 className="title">
                        Ошибка
                    </h1>
                    <p className="text">
                        {error.message || 'Что-то пошло не так'}
                    </p>
                    <button onClick={reset} className="mt-4 px-4 py-2 bg-blue-600 text-white rounded-lg">
                        Перезагрузить
                    </button>
                </div>
            </div>
        </div>
    );
}
