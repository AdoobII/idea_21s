"""
This script is used to generate vector positions for the keygen module without using the roll operation in the 
"""

ROTATIONS = [0, 25, 50, 75, 100, 125, 150]
KEY_SIZE = 128
KEY_INDICIES = list(range(KEY_SIZE)) # a list which contains all indicies for a vector of length KEY_SIZE
SUB_KEY_SIZE = 16 # small key size in bits
AMT_OF_KEYS = 6 # amount of keys for each round

def rotate(list, amt):
    amt = amt % len(list)
    return list[-amt:] + list[:-amt]

def sub_list(list, chunk_size):
    slices_amt = int(len(list)/chunk_size)
    sliced_list = []
    for slice_index in range(slices_amt):
        start_index = slice_index*chunk_size
        end_index = (slice_index+1)*chunk_size
        if end_index > (len(list) - 1):
            end_index = len(list)
        sliced_list.append(list[start_index:end_index])
    return sliced_list

def get_vector_indicies(chunked_list):
    indicies = []
    for chunk in chunked_list:
        indicies.append((chunk[-1], chunk[0]))
    return indicies

if __name__ == '__main__':
    indicies = []
    for rot in ROTATIONS:
        indicies.extend(get_vector_indicies(sub_list(rotate(KEY_INDICIES, rot), SUB_KEY_SIZE))[::-1])
    indicies = sub_list(indicies, AMT_OF_KEYS)
    for i in indicies:
        print(i)
    