import csv

file_path = 'c-work\FOD\employees.csv'

try:
    with open(file_path, 'r', newline='') as file:
        reader = csv.DictReader(file)
        print("Employee Data:")
        print(f"{'EmployeeID':<12}{'FirstName':<12}{'LastName':<12}{'Department':<15}{'Salary':<8}")
        for row in reader:
            print(f"{row['EmployeeID']:<12}{row['FirstName']:<12}{row['LastName']:<12}{row['Department']:<15}{row['Salary']:<8}")
except FileNotFoundError:
    print(f"File '{file_path}' not found.")
except Exception as e:
    print(f"An error occurred: {e}")
