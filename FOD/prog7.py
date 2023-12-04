import numpy as np

arr = np.array([1, 2, 3, 4, 5, 6])

print("Array:", arr)

print("Maximum value:", np.max(arr))
print("Minimum value:", np.min(arr))

print("Mean:", np.mean(arr))
print("Median:", np.median(arr))
print("Sum:", np.sum(arr))

reshaped_arr = arr.reshape(2, 3)
print("Reshaped array:")
print(reshaped_arr)

arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])

print("\n")
print("Array 1:", arr1)
print("Array 2:", arr2)
print("Addition:", arr1 + arr2)
print("Subtraction:", arr1 - arr2)
print("Multiplication:", arr1 * arr2)
print("Division:", arr1 / arr2)
