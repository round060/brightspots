MixRF = function(Y, X, random, data, initialRandomEffects = 0, 
                 ErrorTolerance = 0.001, MaxIterations = 1000, 
                 importance = FALSE, ntree = 500, 
                 mtry = max(floor(ncol(X)/3), 1), nodesize = 5, maxnodes = NULL) {
  
  Target = Y
  
  # Condition that indicates the loop has not converged or run out of iterations
  ContinueCondition = TRUE
  
  iterations <- 0
  
  # Get initial values
  AdjustedTarget <- Target - initialRandomEffects
  oldLogLik <- -Inf
  
  while(ContinueCondition){
    iterations <- iterations+1
    # randomForest
    rf = randomForest(X, AdjustedTarget, 
                      importance = importance, ntree = ntree, mtry = mtry, 
                      nodesize = nodesize, maxnodes = maxnodes)
    # y - X*beta (out-of-bag prediction)
    resi = Target - rf$predicted
    ## Estimate New Random Effects and Errors using lmer
    f0 = as.formula(paste0('resi ~ -1 + ',random))
    lmefit <- lmer(f0, data=data)
    # check convergence
    newLogLik <- as.numeric(logLik(lmefit))
    ContinueCondition <- (abs(newLogLik-oldLogLik) > ErrorTolerance & iterations < 
                            MaxIterations)
    oldLogLik <- newLogLik
    
    # Extract random effects to make the new adjusted target
    AllEffects <- predict(lmefit)
    
    #  y-Zb
    AdjustedTarget <- Target - AllEffects
  }
  
  result <- list(forest=rf, MixedModel=lmefit, RandomEffects=ranef(lmefit),
                 IterationsUsed=iterations)
  return(result)
} # end Function

predict.MixRF = function(object, newdata, EstimateRE=TRUE){
  forestPrediction <- predict(object$forest, newdata = newdata, OOB = T)
  # If not estimate random effects, just use the forest for prediction.
  if (!EstimateRE) return(forestPrediction)
  RandomEffects <- predict(object$MixedModel, newdata = newdata, allow.new.levels = T)
  completePrediction = forestPrediction + RandomEffects
  return(completePrediction)
}