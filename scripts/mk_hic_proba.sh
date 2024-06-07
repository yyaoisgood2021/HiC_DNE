#!/bin/bash




java -jar /stg3/data3/peiyao/software/juicer-1.6/CPU/scripts/common/juicer_tools.jar \
dump observed VC $hic_file ${chrid} ${chrid} BP ${res} \
${out_base}/VC_observed.${chrid}.${res}.txt

java -jar /stg3/data3/peiyao/software/juicer-1.6/CPU/scripts/common/juicer_tools.jar \
dump oe VC $hic_file ${chrid} ${chrid} BP ${res} \
${out_base}/VC_oe.${chrid}.${res}.txt

paste ${out_base}/VC_observed.${chrid}.${res}.txt ${out_base}/VC_oe.${chrid}.${res}.txt | \
awk '{print $1 "\t" $2 "\t" $3 "\t" $6 "\t" $3 / $6}' > ${out_base}/VC_combined.${chrid}.${res}.txt


${python_path} /stg3/data3/peiyao/work/from_Lina/calc_pvalue.py \
${out_base}/VC_combined.${chrid}.${res}.txt \
${out_base_2}/${chrid}_prob.${res}.txt
