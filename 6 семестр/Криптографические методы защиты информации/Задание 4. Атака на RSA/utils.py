from math import sqrt, gcd
from random import getrandbits, randint


def is_prime(n):
    if n < 2: return False
    if n == 2: return True
    if n % 2 == 0: return False
    for i in range(3, int(sqrt(n)) + 1, 2):
        if n % i == 0: return False
    return True

def generate_prime(bits):
    while True:
        n = getrandbits(bits)
        n = n | (1 << (bits - 1)) | 1
        if is_prime(n): return n

def extended_gcd(a, b):
    r_prev, r_cur = a, b
    s_prev, s_cur = 1, 0
    t_prev, t_cur = 0, 1
    while r_cur != 0:
        count = r_prev // r_cur
        r_prev, r_cur = r_cur, r_prev - count * r_cur
        s_prev, s_cur = s_cur, s_prev - count * s_cur
        t_prev, t_cur = t_cur, t_prev - count * t_cur
    return r_prev, s_prev, t_prev

def mod_inverse(a, N):
    g, x, _ = extended_gcd(a, N)
    if g != 1:
        raise ValueError(f"Обратного элемента для {a} по модулю {N} не существует")
    return x % N

def generate_e(phi):
    while True:
        e = randint(3, phi - 1)
        if gcd(e, phi) == 1:
            return e
