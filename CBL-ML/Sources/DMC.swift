//
//  DMC.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 17/05/23.
//

import Foundation
import simd


class DMCClassifier {
    var dataset: [Iris] = [Iris]()
    var trainingData: [Iris] = [Iris]()

    func meanOf(data:[Iris]) -> SIMD4<Double> {
        let simdSum = data.reduce(SIMD4()) { partialResult, value in
            return partialResult + value.vector!
        }

        let meanSimd = simdSum / Double(data.count)
        return meanSimd
    }

    func getClass(_ integer: Int) -> String {
        switch integer {
            case 0:
                return "Iris-setosa"
            case 1:
                return "Iris-virginica"
            default:
                return "Iris-versicolor"
        }
    }

    func training() {
        for i in 0..<3 {
            var speciesArray: [Iris] = [Iris]()
            let currentItem = getClass(i)
            for item in dataset {
                if item.species == currentItem { speciesArray.append(item) }
            }
            let meanSimd = meanOf(data: speciesArray)
            trainingData.append(
                Iris(
                    id: i,
                    sepalLenghtCm: meanSimd.x,
                    sepalWidthCm: meanSimd.y,
                    petalLenghtCm: meanSimd.z,
                    petalWidthCm: meanSimd.w,
                    species: currentItem
                )
            )
        }
    }

    func predictClassification(trainingRow: SIMD4<Double>) -> String {
        var distances: [(Iris, Double)] = []
        var outputValues: [String] = []

        for row in trainingData {
            let distance = simd_distance(trainingRow, row.vector!)
            distances.append((row, distance))
        }

        let sortedDistances = distances.sorted(by: { $0.1 < $1.1 } )

        return sortedDistances.first!.0.species
    }
}
