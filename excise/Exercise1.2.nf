/*
 * pipeline input parameters
 */
params.reads = "$baseDir/data/ggal/gut_{1,2}.fq"
params.transcript = "$baseDir/data/ggal/transcriptome.fa"
params.multiqc = "$baseDir/multiqc"
params.outdir = "$baseDir/result"

println """
    reads        : $params.reads
    transcriptome: $params.transcript
    multiqc      : $params.multiqc
    outdir       : ${params.outdir}
    ${params}
    """
