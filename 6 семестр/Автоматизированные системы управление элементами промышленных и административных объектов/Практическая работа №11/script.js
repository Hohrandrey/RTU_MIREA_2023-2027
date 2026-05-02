const tabButtons = document.querySelectorAll('.tab-link');
const tabContents = document.querySelectorAll('.tab-content');

tabButtons.forEach(btn => {
    btn.addEventListener('click', () => {
        tabButtons.forEach(b => b.classList.remove('active'));
        tabContents.forEach(c => c.classList.remove('active'));
        btn.classList.add('active');
        document.getElementById(btn.dataset.tab).classList.add('active');
    });
});

const contentBase = [
    { title: "Программирование на Python для начинающих", type: "книга", author: "Марк Лутц", level: "начальный", rating: 4.5, keywords: ["python", "изучить", "начинающий"] },
    { title: "Машинное обучение: алгоритмы и практика", type: "видео", author: "Андрей Себрант", level: "средний", rating: 4.8, keywords: ["машинное обучение", "ml", "алгоритмы"] },
    { title: "Аудиокнига «Чистый код»", type: "аудио", author: "Роберт Мартин", level: "продвинутый", rating: 4.9, keywords: ["чистый код", "clean code", "скачать"] },
    { title: "Основы SQL и реляционных баз данных", type: "курс", author: "Иван Петров", level: "начальный", rating: 4.3, keywords: ["sql", "базы данных", "изучить"] },
    { title: "React для профессионалов", type: "видео", author: "Максим Иванов", level: "продвинутый", rating: 4.4, keywords: ["react", "фронтенд", "профессионал"] },
    { title: "Психология влияния", type: "аудио", author: "Роберт Чалдини", level: "начальный", rating: 4.6, keywords: ["психология", "влияние"] },
    { title: "Микросервисы: паттерны и практики", type: "книга", author: "Крис Ричардсон", level: "продвинутый", rating: 4.9, keywords: ["микросервисы", "архитектура"] },
    { title: "Английский для IT", type: "курс", author: "Lingualeo", level: "средний", rating: 4.2, keywords: ["английский", "it"] },
    { title: "Подкаст «Люди и код» выпуск 45", type: "подкаст", author: "Алексей Котов", level: "начальный", rating: 4.0, keywords: ["подкаст", "it", "стартапы"] },
    { title: "Глубокое обучение с PyTorch", type: "книга", author: "Eli Stevens", level: "продвинутый", rating: 4.7, keywords: ["глубокое обучение", "pytorch", "нейросети"] }
];

const ITEMS_PER_PAGE = 6;
let currentPage = 1;
let currentFilteredResults = [];

function getFilteredData() {
    const query = document.getElementById('searchInput').value.toLowerCase().trim();
    const typeFilter = document.getElementById('typeFilter').value;

    let results = contentBase;

    if (query !== '') {
        results = results.filter(item =>
            item.keywords.some(kw => query.includes(kw)) ||
            item.title.toLowerCase().includes(query) ||
            item.author.toLowerCase().includes(query)
        );
    }

    if (typeFilter !== 'all') {
        results = results.filter(item => item.type === typeFilter);
    }
    return results;
}

function displayResults(results) {
    const container = document.getElementById('searchResults');
    const paginationDiv = document.getElementById('pagination');
    
    if (results.length === 0) {
        container.innerHTML = '<p>По вашему запросу ничего не найдено. Возможно, потребуется внешний поиск.</p>';
        paginationDiv.innerHTML = '';
        return;
    }

    const totalPages = Math.ceil(results.length / ITEMS_PER_PAGE);
    if (currentPage > totalPages) currentPage = totalPages;
    const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
    const paginatedItems = results.slice(startIndex, startIndex + ITEMS_PER_PAGE);

    let html = '';
    paginatedItems.forEach(item => {
        html += `
        <div class="content-card">
            <h3>${item.title}</h3>
            <span class="badge">${item.type}</span>
            <span style="color:#555;">Уровень: ${item.level}</span>
            <p style="margin-top:0.5rem;">Автор: ${item.author}</p>
            <p>⭐ ${item.rating}</p>
        </div>`;
    });
    container.innerHTML = html;

    let paginationHtml = '';
    if (totalPages > 1) {
        paginationHtml += `<button ${currentPage === 1 ? 'disabled' : ''} onclick="goToPage(${currentPage - 1})">◀ Предыдущая</button>`;
        paginationHtml += `<span>Страница ${currentPage} из ${totalPages}</span>`;
        paginationHtml += `<button ${currentPage === totalPages ? 'disabled' : ''} onclick="goToPage(${currentPage + 1})">Следующая ▶</button>`;
    }
    paginationDiv.innerHTML = paginationHtml;
}

function goToPage(page) {
    currentPage = page;
    displayResults(currentFilteredResults);
}

function executeSearch() {
    currentFilteredResults = getFilteredData();
    currentPage = 1;
    displayResults(currentFilteredResults);
}

document.getElementById('searchInput').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        e.preventDefault();
        executeSearch();
    }
});

function initialLoad() {
    currentFilteredResults = getFilteredData();
    currentPage = 1;
    displayResults(currentFilteredResults);
}

document.addEventListener('DOMContentLoaded', initialLoad);

function refreshStats() {
    const total = Math.floor(12540 + Math.random() * 200);
    const accuracy = (92.3 + (Math.random() * 2 - 1)).toFixed(1);
    const content = Math.floor(4320 + Math.random() * 50);
    const purchases = Math.floor(28 + Math.random() * 5);

    document.getElementById('totalQueries').textContent = total.toLocaleString();
    document.getElementById('nlpAccuracy').textContent = accuracy;
    document.getElementById('contentCount').textContent = content.toLocaleString();
    document.getElementById('purchaseOrders').textContent = purchases;

    const btn = document.querySelector('.btn');
    btn.textContent = '✅ Обновлено';
    setTimeout(() => { btn.textContent = 'Обновить сводку'; }, 1500);
}
