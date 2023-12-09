import math

def distance(city1, city2):
    return math.sqrt((city1[0] - city2[0])**2 + (city1[1] - city2[1])**2)

def nearest_neighbor(cities):
    num_cities = len(cities)
    visited = [False] * num_cities
    path = [0]
    visited[0] = True

    for i in range(num_cities - 1):
        last_city = path[-1]
        min_distance = float('inf')
        nearest_city = None

        for j in range(num_cities):
            if not visited[j] and j != last_city:
                dist = distance(cities[last_city], cities[j])
                if dist < min_distance:
                    min_distance = dist
                    nearest_city = j

        path.append(nearest_city)
        visited[nearest_city] = True

    path.append(0)
    return path

cities = [(0, 0), (1, 2), (2, 3), (5, 2), (7, 8)]

optimal_path = nearest_neighbor(cities)

print("Optimal path using Nearest Neighbor algorithm:")
print(optimal_path)
