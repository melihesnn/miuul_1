rule all:
    input: "output/tRNA_scan_results.txt",
            "output/G_intestinalis.tRNA"

rule tRNAscan:
    input: "resource/G_intestinalis.fasta"
    output: "output/tRNA_scan_results.txt"
    shell: "bash tRNAscan.sh {input} -o {output}"

rule tRNAscan_stats:
    input:
        genome= "resource/G_intestinalis.fasta"
    output:
        tRNA= "output/G_intestinalis.tRNA",
        stats= "output/G_intestinalis.stats"
    params:
        threads= 2
    conda:
        "envs/env.yaml"
    script:
        "scripts/tRNAscan_stats.py"