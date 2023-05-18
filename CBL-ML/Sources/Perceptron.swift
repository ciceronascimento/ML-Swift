//
//  Perceptron.swift
//  CBL-ML
//
//  Created by Cicero Nascimento on 18/05/23.
//

import Foundation

func sign(num: Double) -> Double {
    return num >= 0 ? 1 : -1
}

class PerceptronClassifier {
    private(set) var weights: [Double] = [0,0]
    private(set) var learningRate = 0.1

    init() {
        for iterator in 0..<self.weights.count {
            self.weights[iterator] = Double.random(in: -1..<1)
        }
    }

    /// Aplicaçao da formula: Y = X1*W1 + X2 *W2
    /// - Parameter inputs: Entrada array de duas posições (X1 e X2)
    func classify(inputs: [Double]) -> Double {
        var sum: Double = 0

        // Multiplica cada elemento do vetor de entrada pelos pesos correspondentes e soma esses produtos.
        for iterator in 0..<self.weights.count {
            sum += inputs[iterator] * self.weights[iterator]
        }

        let outputValue = sign(num: sum)
        return outputValue
    }

    func train(inputs: [Double], target: Double) {
        let classify = self.classify(inputs: inputs)

        let error = target - classify

        for iterator in 0..<self.weights.count {
            self.weights[iterator] += error * inputs[iterator] * self.learningRate
        }
    }
}
