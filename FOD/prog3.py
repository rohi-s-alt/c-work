
print("Example of a for loop with break statement:")
for i in range(1, 11):
    if i == 6:
        break
    print(i, end=" ")
print("\n")

print("Example of a while loop with continue statement to print odd numbers:")
count = 0
while count < 10:
    count += 1
    if count % 2 == 0:
        continue
    print(count, end=" ")
print("\n")
