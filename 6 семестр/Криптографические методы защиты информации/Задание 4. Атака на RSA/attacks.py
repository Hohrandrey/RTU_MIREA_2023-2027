from math import isqrt
from utils import mod_inverse


def cyclic_attack(y, e, N):
    cur = y
    while True:
        prev = cur
        cur = pow(cur, e, N)
        if cur == y:
            return prev

def meet_in_the_middle_attack(y, e, N):
    bound = int(isqrt(N)) + 1
    try: mod_inverse(y, N)
    except ValueError: return None
    table = {}
    for x1 in range(1, bound):
        val = pow(x1, e, N)
        if val not in table:
            table[val] = x1
    for x2 in range(1, bound):
        x2e = pow(x2, e, N)
        try: x2e_inv = mod_inverse(x2e, N)
        except ValueError: continue
        target = (y * x2e_inv) % N
        if target in table:
            x1 = table[target]
            x = (x1 * x2) % N
            if pow(x, e, N) == y:
                return x
    return None
