alias=read.table("hg19.chromAlias.txt", fill=T)
alias1=alias[,c(2,1)]
alias2=alias[,c(3,1)]
alias3=alias[,c(4,1)]
colnames(alias1) <- c("alias","seq_name")
colnames(alias2) <- c("alias","seq_name")
colnames(alias3) <- c("alias","seq_name")
alias.new=rbind(alias1,alias2,alias3)
alias.new=subset(alias.new,alias.new$alias!="")
write.table(alias.new,"alias.new.ids",row.names = F,col.names = F,quote = F)