/*
 
Take in an input of flights and implement a method to find the shortest path. 
Each flight has a origin an destination along with a price. Print out thr price
of the shortest path.
 
*/

struct City { //city has an array of flights
    var value: String
    var flights = [Flight]()
}

struct Flight { //each flight has a from and to, with a price (weight)
    var from: City
    var to: City
    var price: Int
}

class Path { //a path has all flights to a destination, it has a price and the path previous
    var flights = [Flight]()
    var destination: City
    var price: Int
    var previousPath: Path?
    
    init(price: Int, destination: City, previousPath: Path?) {
        self.destination = destination
        self.price = price
        self.previousPath = previousPath
    }
}

//a graph structure implements an addflight method (addEdge) to destination, with a price
struct Graph {
    public func addFlight(source: inout City, destination: City, price: Int) {
        var flight = Flight(from: source, to: destination, price: price)
        source.flights.append(flight)
    }
    
    func shortestPathDijkstra(from origin: City, to destination: City) -> Path? {
        return self.shortestPathDijkstra(from: origin).filter { $0.destination.value == destination.value }.first
    }
    
    func shortestPathDijkstra(from origin: City) -> [Path] {
        var frontier = [Path]()
        var finalPath = [Path]()
        var bestPath: Path? = nil
        
        for edge in origin.flights {
            let path = Path(
                price: edge.price,
                destination: edge.to,
                previousPath: nil
            )
            
            frontier.append(path)
        }
        
        while frontier.count > 0 {
            var bestPathIndex = 0
            
            bestPath = nil
            for index in 0..<frontier.count {
                let path = frontier[index]
                
                if bestPath == nil || path.price < bestPath!.price  {
                    bestPath = path
                    bestPathIndex = index
                }
            }
            
            for edge in bestPath!.destination.flights {
                let path = Path(
                    price: edge.price + bestPath!.price,
                    destination: edge.to,
                    previousPath: bestPath
                )
                frontier.append(path)
            }
            
            let pathsToLocation = finalPath.filter { $0.destination.value == bestPath?.destination.value }
            if pathsToLocation.count == 0 {
                finalPath.append(bestPath!)
            } else {
                for path in pathsToLocation {
                    if (bestPath?.price)! < path.price {
                        finalPath.append(bestPath!)
                    }
                }
            }
            
            frontier.remove(at: bestPathIndex)
        }
        
        return finalPath
    }
}

var detroit = City(value: "Detroit", flights: [])
var miami = City(value: "Miami", flights: [])
var sf = City(value: "SF", flights: [])

var graph = Graph()
graph.addFlight(source: &detroit, destination: miami, price: 100)
graph.addFlight(source: &miami, destination: detroit, price: 150)
graph.addFlight(source: &detroit, destination: sf, price: 120)
graph.addFlight(source: &sf, destination: detroit, price: 150)

graph.shortestPathDijkstra(from: sf, to: detroit)?.price