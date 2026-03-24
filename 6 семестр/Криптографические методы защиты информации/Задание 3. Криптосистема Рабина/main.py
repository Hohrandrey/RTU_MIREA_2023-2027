def calculate_n(p: int, q: int) -> int:
    if p % 4 == q % 4 == 3:
        return p * q
    else:
        raise ValueError('Параметры p и q должны быть простыми и сравнимыми, а их остаток от деления на 4 должен равняться 3')

def encrypt(m: str, n: int) -> int:
    return pow(int(bin(ord(m))[2:] * 2, 2), 2, n)

def decrypt(c: int, p: int, q: int) -> list:
    c_p14modp = pow(c, (p+1)//4, p)
    q_1modp = pow(q, -1, p)
    c_q14modq = pow(c, (q+1)//4, q)
    p_1modq = pow(p, -1, q)
    n = calculate_n(p, q)
    result1 = (c_p14modp * q * q_1modp + c_q14modq * p * p_1modq) % n
    result2 = (c_p14modp * q * q_1modp - c_q14modq * p * p_1modq) % n
    result3 = (-c_p14modp * q * q_1modp + c_q14modq * p * p_1modq) % n
    result4 = (-c_p14modp * q * q_1modp - c_q14modq * p * p_1modq) % n
    returns = []
    for i in [result1, result2, result3, result4]:
        i_bin = bin(i)[2:]
        if len(i_bin)%2 == 0:
            mid = len(i_bin) // 2
            left_part = i_bin[:mid]
            if left_part == i_bin[mid:]:
                returns.append(chr(int(left_part, 2)))
    return returns


def main():
    p, q = 139, 191
    try:
        n = calculate_n(p, q)
    except ValueError as e:
        print(f"Ошибка инициализации: {e}")
        return
    while True:
        print(f"\np={p}, q={q}, n={n}")
        print("1. Зашифровать символ")
        print("2. Расшифровать число")
        choice = input("Выберите действие: ")
        if choice == '1':
            char = input("Введите один символ для шифрования: ")
            ciphertext = encrypt(char, n)
            print(f"Зашифрованный результат (число): {ciphertext}")
        elif choice == '2':
            val = int(input("Введите число для расшифровки: "))
            result = decrypt(val, p, q)
            print(f"Расшифрованный символ: {result}")
        else:
            break


if __name__ == "__main__":
    main()
