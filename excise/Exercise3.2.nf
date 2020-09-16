/*
 * pipeline input parameters
 */
params.reads = "$baseDir/data/ggal/gut_{1,2}.fq"
params.transcript = "$baseDir/data/ggal/transcriptome.fa"
params.multiqc = "$baseDir/multiqc"
params.outdir = "results"

log.info """
        RNASEQ - NF PIPELINE
        ====================
        transcriptome: ${params.transcript}
        reads        : ${params.reads}
        outdir       : ${params.outdir}
        """
        .stripIndent()

Channel
    .fromFilePairs(params.reads, checkIfExists: true)
    .set{read_pairs_ch}
read_pairs_ch.view()

