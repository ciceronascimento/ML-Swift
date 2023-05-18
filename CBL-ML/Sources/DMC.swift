//
//  DMC.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 17/05/23.
//

import Foundation
import simd


class DMCClassifier {


    var distance: [(Iris, Double)] = []

    var outputValues: [String] = []

    func meanOf(data:[Iris]) {

    }

    func predictClassification(data: [Iris], trainingRow: [SIMD4<Double>], k: Int) {
        let mean = meanOf(data: data)
    }
}
