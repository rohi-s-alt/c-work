from constraint import Problem

problem = Problem()

regions = ['A', 'B', 'C']
colors = ['Red', 'Green', 'Blue']

for region in regions:
    problem.addVariable(region, colors)

problem.addConstraint(lambda a, b: a != b, ('A', 'B'))
problem.addConstraint(lambda a, c: a != c, ('A', 'C'))
problem.addConstraint(lambda b, c: b != c, ('B', 'C'))

solutions = problem.getSolutions()

print("Solutions:")
for solution in solutions:
    print(solution)
