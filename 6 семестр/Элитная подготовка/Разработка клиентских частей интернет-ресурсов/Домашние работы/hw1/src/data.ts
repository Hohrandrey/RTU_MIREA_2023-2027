import type {Place, Monument, HistoryFactType} from './types.ts';

export const cityInfo = {
    name: 'Старый Оскол',
    description: 'Старый Оскол — город в Белгородской области, крупный центр горнодобывающей промышленности и металлургии. Известен своей богатой историей, культурными традициями и современными предприятиями.',
    population: 215937,
    founded: 1593,
};

export const places: Place[] = [
    {
        id: 1,
        name: 'Парк "Зелёный лог"',
        description: 'Любимое место отдыха горожан: живописные аллеи, фонтаны, аттракционы и кафе.',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5WHv3GZgHhV9HCPpPO5reoXzga6dD_9GzjA&s',
    },
    {
        id: 2,
        name: 'Набережная реки Оскол',
        description: 'Благоустроенная набережная с велодорожками, зонами для пикников и спортивными площадками.',
        image: 'https://nashural.ru/assets/uploads/Staryj-Oskol.-TSentralnaya-naberezhnaya1.jpg',
    },
    {
        id: 3,
        name: 'Торгово-развлекательный центр "Маскарад"',
        description: 'Современный ТРЦ с кинотеатром, фуд-кортом и магазинами.',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCgsq9vRM2K19XYTS_LOFGdBU1WtSjgy5dzw&s',
    },
    {
        id: 4,
        name: 'Торгово-развлекательный центр "БОШЕ"',
        description: 'Современный ТРЦ с игровыми и спортивными зонами, кинотеатром, фуд-кортом и магазинами.',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3StRUs9ntjyGYu141Rut0Qyjgoebck7grhQ&s',
    },
    {
        id: 5,
        name: 'Сквер имени А.С. Пушкина',
        description: 'Уютный сквер в самом сердце Старого Оскола — любимое место прогулок горожан.',
        image: 'https://avatars.mds.yandex.net/get-altay/1987173/2a000001725ef091db17bbde72ee827e70cf/orig',
    }
];

export const monuments: Monument[] = [
    {
        id: 1,
        name: 'Памятник Александру Невскому',
        year: 2010,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZtOnHunhgL8mv8SmPVIITnGQN9MS1g0MmMg&s',
    },
    {
        id: 2,
        name: 'Мемориал "Слава героям"',
        year: 1975,
        image: 'https://avatars.mds.yandex.net/get-altay/12820607/2a0000019442d7b05747914365a0d65646e3/L_height',
    },
    {
        id: 3,
        name: 'Памятник "Строителям железной дороги Старый Оскол - Ржава"',
        year: 2008,
        image: 'https://www.osk-cbs.ru/project/images/p18_clip_imagey001.jpg',
    },
    {
        id: 4,
        name: 'Памятник огурцу',
        year: 2009,
        image: 'https://www.osk-cbs.ru/project/images/p34_ofyigurec.jpg'
    }
];

export const historyFacts: HistoryFactType[] = [
    { id: 1, year: 1593, fact: 'Первое упоминание Старого Оскола как сторожевого пункта на южных рубежах Московского государства.' },
    { id: 2, year: 1655, fact: 'Город переименован в Старый Оскол после основания Нового Оскола.' },
    { id: 3, year: 1785, fact: 'Старый Оскол получает герб — «в голубом поле копьё и летящий аист» (символ мужества и плодородия).' },
    { id: 4, year: 1943, fact: 'В ходе Воронежско-Касторненской операции город освобождён от немецко-фашистских захватчиков (5 февраля).' },
    { id: 5, year: 1969, fact: 'Начало строительства Оскольского электрометаллургического комбината (ОЭМК), градообразующего предприятия.' },
    { id: 6, year: 2007, fact: 'Открыт памятник «Александр Невский» — небесный покровитель города.' },
    { id: 7, year: 2011, fact: 'Старый Оскол признан самым благоустроенным городом России в категории до 250 тысяч жителей.' },
    { id: 8, year: 2015, fact: 'Введена в эксплуатацию первая очередь Оскольского водозабора, решившая проблему водоснабжения.' },
    { id: 9, year: 2020, fact: 'Старый Оскол получил почётное звание «Город воинской славы» за мужество жителей в годы Великой Отечественной войны.' },
    { id: 10, year: 2023, fact: 'Завершена масштабная реконструкция набережной реки Оскол — новой зоны отдыха горожан.' },
];
