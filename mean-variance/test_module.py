import numpy as np

def calculate(numbers):
    if len(numbers) != 9:
        raise ValueError("List must contain nine numbers")


    matrix = np.array(numbers).reshape(3, 3)

    
    mean = [list(matrix.mean(axis=0)), list(matrix.mean(axis=1)), matrix.mean()]
    variance = [list(matrix.var(axis=0)), list(matrix.var(axis=1)), matrix.var()]
    std_deviation = [list(matrix.std(axis=0)), list(matrix.std(axis=1)), matrix.std()]
    max_val = [list(matrix.max(axis=0)), list(matrix.max(axis=1)), matrix.max()]
    min_val = [list(matrix.min(axis=0)), list(matrix.min(axis=1)), matrix.min()]
    sum_val = [list(matrix.sum(axis=0)), list(matrix.sum(axis=1)), matrix.sum()]

    
    result = {
        'mean': mean,
        'variance': variance,
        'standard deviation': std_deviation,
        'max': max_val,
        'min': min_val,
        'sum': sum_val
    }

    return result


result = calculate([0, 1, 2, 3, 4, 5, 6, 7, 8])
print(result)
