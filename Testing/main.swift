import Datasets

let dataset = OxfordIIITPets(batchSize: 32)

print(dataset.training.count)
print(dataset.test.count)