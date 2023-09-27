#!/bin/sh

#実行例
#source annotation.sh 2>&1 | tee -a annotation.log

cd ~/YOUR/PATH/

echo START: `date`
#常染色体すべてにrsIDを付与する場合
for i in {1..22}
do
INFILE=YOUR/INPUT/FILE
REFFILE=WHERE/YOU/PUT/GCF_000001405.25.annotated.chr${i}.vcf.gz
OUTFILE=YOUR/OUTPUT/FILE
bcftools index $INFILE
bcftools annotate -a $REFFILE -Oz -o $OUTFILE -c ID $INFILE --threads 16
bcftools index $OUTFILE
done
echo END: `date`
