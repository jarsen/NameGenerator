# NameGenerator

A markov chain name generator written in Swift.

## Usage

```swift
let dwarfNames: Set<Name> = ["Balur", "Belri", "Ddri", "Gorgrim", "Ketkk", "Thri", "Gilond", "Simkon", "Bildri", "Harund", "Ketund", "Broil", "Rundri", "Dalor", "Druond", "Storrim", "Fimund", "Ovur", "Klak", "Duri", "Ketgol", "Thorri", "Durunn", "Ragtil", "Kili", "Munond", "Gildri", "Simgol", "Mundri", "Klain", "Grirund", "Bofgrim", "Kilund", "Munzad", "Thrdri", "Thond", "Thintil", "Bofil", "Balri", "Dtri"]
let generator = NameGenerator(names: dwarfNames)
let dwarvenStoreKeeperName = generator.generateName()
```
