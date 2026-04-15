from utils import generate_prime, generate_e, mod_inverse
from attacks import cyclic_attack, meet_in_the_middle_attack


def main():
    print(f"Сгенерированные параметры:")
    p = generate_prime(8)
    q = generate_prime(8)
    N = p * q
    phi = (p - 1) * (q - 1)
    e = generate_e(phi)
    print(f"p = {p}; q = {q}; N = {N}; e = {e}.")
    print()

    x = "D"
    print(f"Исходное сообщение (число): x = {x}")
    y = pow(ord(x), e, N)
    print(f"Шифртекст: y = {y}")
    print()

    print("Циклическая атака:")
    x_cyclic = chr(cyclic_attack(y, e, N))
    print(f"Найденное x: {x_cyclic}")
    print(f"Совпадает с исходным? {x_cyclic == x}")
    print()

    print("Атака \"встреча посередине\":")
    x_meet = chr(meet_in_the_middle_attack(y, e, N))
    if x_meet is not None:
        print(f"Найденное x: {x_meet}")
        print(f"Совпадает с исходным? {x_meet == x}")
    else:
        print("Не удалось найти x (диапазон перебора слишком мал или y не обратим).")
    print()

    d = mod_inverse(e, phi)
    print(f"Вычислен секретный ключ d = {d} (для проверки расшифрования).")
    x_d = chr(pow(y, d, N))
    print(f"Расшифрование y с помощью d: {x_d}")
    print(f"Совпадает с исходным? {x_d == x}")
    print()

if __name__ == "__main__":
    main()
