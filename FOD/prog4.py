# Rohit Kumar Saxena
# AI-DS A (2022-26)
# Printing the max of three number

lst = []

for i in range(3):
    num = int(input(f"Enter Number {i+1} : "))
    lst.append(num)

print(f"list = {lst}")

def method1(lst):
    max = lst[0]
    for i in range(3):
        if lst[i] > max:
            max=lst[i]
    return max

def method2(lst):
    max = list(set(lst))[-1]
    return max

print(f"Maximum Number = {method2(lst)}")
