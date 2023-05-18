//
//  Iris.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 16/05/23.
//

import Foundation


class Iris {
    var id: Int
    var sepalLenghtCm: Double
    var sepalWidthCm: Double
    var petalLenghtCm: Double
    var petalWidthCm: Double
    var species: String
    var vector: SIMD4<Double>? {
        return SIMD4(sepalLenghtCm, sepalWidthCm, petalLenghtCm, petalWidthCm)
    }

    internal init(id: Int, sepalLenghtCm: Double, sepalWidthCm: Double, petalLenghtCm: Double, petalWidthCm: Double, species: String) {
        self.id = id
        self.sepalLenghtCm = sepalLenghtCm
        self.sepalWidthCm = sepalWidthCm
        self.petalLenghtCm = petalLenghtCm
        self.petalWidthCm = petalWidthCm
        self.species = species
    }
}
