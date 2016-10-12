
return function(opt, model, dataset, confusion)
   opt.pixelNearestNeighbor = true
   opt.embedFunction = function(lopt)
      local trainData = lopt.trainData
      local testData = lopt.testData
   
      -- embeddings are flattened pixel values
      local size = trainData:size()
      local trainEmbedding = torch.reshape(trainData:clone(), size[1], size[2]*size[3]*size[4])
      size = testData:size()
      local testEmbedding = torch.reshape(testData:clone(), size[1], size[2]*size[3]*size[4])

      return trainEmbedding, testEmbedding
   end
   
   return require(opt.homePath .. 'model.baselines.nearest-neighbor')(opt, model, dataset, confusion)
end
