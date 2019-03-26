names(LC)
names(LCIS)
names(LP)
names(LC_IS)

summary(LC)
summary(LCIS)
summary(LP)

summary(LC$credit_score)


LC$credit_score <- 0
LC$credit_score <- with(LC, ifelse(`手机认证` == "成功认证", credit_score + 2, credit_score))
LC$credit_score <- with(LC, ifelse(`学历认证` == "成功认证", credit_score + 5, credit_score))
LC$credit_score <- with(LC, ifelse(`视频认证` == "成功认证", credit_score + 7, credit_score))
LC$credit_score <- with(LC, ifelse(`户口认证` == "成功认证", credit_score + 8, credit_score))
LC$credit_score <- with(LC, ifelse(`征信认证` == "成功认证", credit_score + 9, credit_score))
LC$credit_score <- with(LC, ifelse(`淘宝认证` == "成功认证", credit_score + 12, credit_score))
LC$credit_score.bucket <- cut(LC$credit_score, c(0, 7, 15, 25, 43))

temp = subset(LC, `借款金额` >= 10000 & `历史逾期还款期数` > 40)
temp


LC$credit_score <- with(LC, ifelse(`手机认证` == "成功认证", credit_score + 10, credit_score))
LC$credit_score <- with(LC, ifelse(`学历认证` == "成功认证", credit_score + 3, credit_score))
LC$credit_score <- with(LC, ifelse(`视频认证` == "成功认证", credit_score + 7, credit_score))
LC$credit_score <- with(LC, ifelse(`户口认证` == "成功认证", credit_score + 10, credit_score))
LC$credit_score <- with(LC, ifelse(`征信认证` == "成功认证", credit_score + 5, credit_score))
LC$credit_score <- with(LC, ifelse(`淘宝认证` == "成功认证", credit_score + 5, credit_score))

qplot(x = `历史逾期还款期数`, data = LC)

LC$`历史成功借款次数.bucket` <- cut(LC$`历史成功借款次数`, c(0, 5, 10, 20, 100))


LC$credit_score <- 0
LC$credit_score <- with(LC, ifelse(`手机认证` == "成功认证", credit_score + 8, credit_score))
LC$credit_score <- with(LC, ifelse(`学历认证` == "成功认证", credit_score + 10, credit_score))
LC$credit_score <- with(LC, ifelse(`视频认证` == "成功认证", credit_score + 5, credit_score))
LC$credit_score <- with(LC, ifelse(`户口认证` == "成功认证", credit_score + 3, credit_score))
LC$credit_score <- with(LC, ifelse(`征信认证` == "成功认证", credit_score + 6, credit_score))
LC$credit_score <- with(LC, ifelse(`淘宝认证` == "成功认证", credit_score + 3, credit_score))


table(LC$借款利率)


```{r echo=FALSE}
# 借款金额和借款利率关系的折线图
ggplot(aes(x = `借款利率`, y = `借款金额`, color = credit_score.bucket), data = LC) +
  geom_point(position = position_jitter(height = 0, width = 0.3)) +
  scale_color_brewer(type = "div", palette = 1) +
  scale_y_log10() +
  ggtitle("借款金额和借款利率关系的散点图")
```
