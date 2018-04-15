# 2D
edist <- dist(lda@gamma,method="euclidean")
edistMat <- as.matrix(edist)
point <- cmdscale(edistMat)

plot(point, pch = 21, col = c(2:4))

# 3D
library(rgl)
point <- cmdscale(edistMat,3)
plot3d(point, pch = 21, col = c(2:5))
