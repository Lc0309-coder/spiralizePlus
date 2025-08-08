# spiralizePlus: ​Object-Oriented and Additive Operator-Based Spiralization

[![R-CMD-check](https://github.com/CaoTianze/spiralizePlus/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/CaoTianze/spiralizePlus/actions/workflows/R-CMD-check.yaml)

spiralizePlus provides an object-oriented interface extension for the 'spiralize' package. It implements a modular architecture where spiral visualization components (axes, tracks, layers, etc.) are encapsulated as R S4 objects with class-specific methods. Users construct complex spiral plots by combining these components through additive operators (+) in a declarative syntax.