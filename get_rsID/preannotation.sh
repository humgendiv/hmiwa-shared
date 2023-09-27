#!/bin/sh

#実行例
#source preannotation.sh 2>&1 | tee -a preannotation.log

cd ~/YOUR/PATH

#hg19は〜.25.gz（hg38は〜.40.gzらしい）
curl https://ftp.ncbi.nih.gov/snp/latest_release/VCF/GCF_000001405.25.gz > GCF_000001405.25.gz
#wgetが使えるならcurlはこれでも良い
#wget https://ftp.ncbi.nih.gov/snp/latest_release/VCF/GCF_000001405.25.gz


#中身はVCF形式なので拡張子を変更する
gunzip -c GCF_000001405.25.gz | bgzip -c > GCF_000001405.25.vcf.gz
bcftools index GCF_000001405.25.vcf.gz

#上記はCHROMがalias sequence namesになっているので変更する
curl http://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.chromAlias.txt > hg19.chromAlias.txt
Rscript aliasrename.R

echo "start annotating"
bcftools annotate --rename-chrs alias.new.ids -Oz -o GCF_000001405.25.annotated.vcf.gz GCF_000001405.25.vcf.gz
echo "... annotated"
echo "start indexing"
bcftools index GCF_000001405.25.annotated.vcf.gz
echo "... indexed"

echo "start separating by chromosomes"
for i in {1..22}
do
bcftools view -r chr${i} GCF_000001405.25.annotated.vcf.gz | sed -e s/^chr//g | bgzip -c > GCF_000001405.25.annotated.chr${i}.vcf.gz
echo "... chr${i} separated"
bcftools index GCF_000001405.25.annotated.chr${i}.vcf.gz
echo "... chr${i} indexed"
done