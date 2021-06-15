indices = [(127, 112), (111, 96), (95, 80), (79, 64), (63, 48), (47, 32),
           (31, 16), (15, 0), (102, 87), (86, 71), (70, 55), (54, 39),
           (38, 23), (22, 7), (6, 119), (118, 103), (77, 62), (61, 46),
           (45, 30), (29, 14), (13, 126), (125, 110), (109, 94), (93, 78),
           (52, 37), (36, 21), (20, 5), (4, 117), (116, 101), (100, 85),
           (84, 69), (68, 53), (27, 12), (11, 124), (123, 108), (107, 92),
           (91, 76), (75, 60), (59, 44), (43, 28), (2, 115), (114, 99), (98, 83),
           (82, 67), (66, 51), (50, 35), (34, 19), (18, 3), (105, 90), (89, 74),
           (73, 58), (57, 42), (41, 26), (25, 10)]

keys = [0x00010002000300040005000600070008,
        0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA]


def extract_key_from_indices(key, index):
    if index[1] < index[0]:
        return ((0xFFFF << index[1]) & key) >> index[1]
    else:
        first_part = (((1 << (index[0] + 1)) - 1) & key) << (15 - index[0])
        second_part = ((((1 << (15 - index[0])) - 1) << index[1]) & key) >> index[1]
        return first_part + second_part


if __name__ == "__main__":
    for key in keys:
        print(f"===extracting keys from key: {hex(key)}===")
        for index in indices:
            print(hex(extract_key_from_indices(key, index)))
