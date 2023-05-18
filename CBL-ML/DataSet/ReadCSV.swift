//
//  ReadCSV.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 16/05/23.
//

import Foundation

class ReadCSV {
    func loadCSV() -> [Iris] {
        var plants: [Iris] = []
        var data: String!

//        guard let filePath = Bundle.main.path(forResource: "Iris", ofType: "csv") else {
//            print("Não achou o caminho")
//            return []
//        }


        guard let url = Bundle.main.url(forResource: "Iris", withExtension: "csv") else {
            print("Não achou o caminho")
            return []
        }

        do {
            data = try String(contentsOf: url)
        } catch {
            print(error)
            return []
        }

        var rows = data.components(separatedBy: "\n")

        rows.removeFirst()

        for row in rows {
            let columns = row.components(separatedBy: ",")
            if columns.count == 6 {
                let id = Int(columns[0]) ?? 0
                let sepalLenghtCm = Double(columns[1]) ?? 0
                let sepalWidthCm = Double(columns[2]) ?? 0
                let petalLenghtCm = Double(columns[3]) ?? 0
                let petalWidthCm = Double(columns[4]) ?? 0
                let species = columns[5]

                let iris = Iris(id: id, sepalLenghtCm: sepalLenghtCm, sepalWidthCm: sepalWidthCm, petalLenghtCm: petalLenghtCm, petalWidthCm: petalWidthCm, species: species)

                plants.append(iris)
            }
        }
        return plants
    }
}
