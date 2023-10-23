# hmiwa-shared

ヒトゲノム多様性研究室メンバー向け解析方法の情報共有。使えそうだったら自己責任で使ってください。

連絡先：ラボSlackで三輪宛メンション/DMまたはhmiwa@g.ecc.u-tokyo.ac.jp

## contents

* get_rsID : rsIDが登録されていないVCFファイルにrsIDを付与したいとき

        #パス名などを変えてこの順に実行
        source preannotation.sh 2>&1 | tee -a preannotation.log
        source annotation.sh 2>&1 | tee -a annotation.log

## software

必要なものは適宜インストールしてください。

* bcftools : [Download](http://www.htslib.org/download/) / [Manual1](https://samtools.github.io/bcftools/bcftools.html) / [Manual2](https://samtools.github.io/bcftools/howtos/index.html)

## update

### 2023/09/27

レポジトリ作成。get_rsID作成。
