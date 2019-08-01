names(pm0) <- make.names (cnames[[1]][wcol])
both <- intersect(site0, site1)
cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)
sapply(split(cnt0, cnt0$county.site), nrow)

dates1 <- as.Date(as.character(pm1sub$Date), "%Y%m%d")


par(mfrow = c(1,2), mar = c(4,4,2,1))
plot(dates0, x0sub, pch = 20)
abline(h = median(x0sub, na.rm=TRUE), lwd = 2)


mn0 <- with(pm0, tapply(Sample.Value, State.Code, mean, na.rm = TRUE))
mn1 <- with(pm1, tapply(Sample.Value, State.Code, mean, na.rm = TRUE))

d0 <- data.frame(state = names(mn0), mean = mn0)
d1 <- data.frame(state = names(mn1), mean = mn1)
mrg <-merge(d0,d1,by = "state")

with(mrg, plot(rep(1,52), mrg[,2], xlim = c(.5,2.5)))
with(mrg, points(rep(1,52), mrg[,3]))

segments(rep(1,52), mrg[,2], rep(2,52), mrg[,3])##Connect dots
