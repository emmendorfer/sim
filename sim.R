

#Self-interpolation method (SIM)
#Iterative approach for building a DTM from a DSM
# 
#Requires the "raster" R package


# Input :
# - dsm : dsm to be filtered in raster R format
# Parameters :
# - d : window size
# - k : number of iterations to be performed


#  Output :
#  - filtered dtm 


idw<-function(x,p) {


n<-dim(x)[1]
m<-dim(p)[1]

yidwr=matrix(0,m,1)
yidw=matrix(0,m,1)

for (j in 1:m) {
ddist<-matrix(0,n,1)
for (i in 1:n) {
  xc<-c(x[i,1],x[i,2],
        p[j,])
  xdist <- matrix(data=xc,nrow=2,ncol=2,byrow=T)
  dm<-dist(xdist)
  ddist[i]=as.matrix(dm)[2,1]
}

y=x[,3]
w=ddist^(-2)
s=1/sum(w)
w=w*s
yidw[j]<-sum(w*y)
#yidwr[j]<-yidw[j]+n*(sum(y)-n*yidw[j])/(n^2-sum(ddist^(-2))*sum(ddist^2))

}
return(yidw)

}



sim <-function(DSM,k=3,d=5) {
#Self-interpolation method (SIM)
#Iterative approach for building a DTM from a DSM


tamq=d
DTM <- DSM
MNS<-as.matrix(DTM)
MNS_new=MNS

for (rep in 1:k){
   for (i in 1:nrow(MNS))  # i: row.index
   {
	for (j in 1:ncol(MNS))   # j: col.index
	{
		if(!is.na(MNS[i,j]))
		{
		lim1=i-trunc(tamq/2)
		lim3=j-trunc(tamq/2)
		if (lim1<1){lim1=1}
		if (lim3<1){lim3=1}
		lim2=lim1+tamq-1
		lim4=lim3+tamq-1		
		if (lim2>nrow(MNS)){
			lim2=nrow(MNS)
			lim1=lim2-tamq+1
		}
		if (lim4>ncol(MNS)){
			lim4=ncol(MNS)
			lim3=lim4-tamq+1
		}	
            p<-t(c(i,j))  
		xt=matrix(0,tamq*tamq,3)
		post=0
		for (ii in lim1:lim2)
		{
			for (jj in lim3:lim4)
			{
			if(!is.na(MNS[ii,jj]) && !(ii== i && jj==j))
			{
			post=post+1
			xt[post,1]=ii
			xt[post,2]=jj
			xt[post,3]=MNS[ii,jj]
			}
			}
		}
		if (post>4)	
		{	
            	interp=idw(xt[1:post,],p)
            	MNS_new[i,j]=min(interp[1,1],MNS[i,j])
		}
           }
       }
	}
  MNS=MNS_new
 }
values(DTM)<-MNS
return(DTM)
}



