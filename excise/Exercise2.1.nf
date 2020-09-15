/*
 * pipeline input parameters
 */
params.reads = "$baseDir/data/ggal/gut_{1,2}.fq"
params.transcript = "$baseDir/data/ggal/transcriptome.fa"
params.multiqc = "$baseDir/multiqc"
params.outdir = "results"

log.info """\
        RNASEQ - NF PIPELINE
        ====================
        transcriptome: ${params.transcript}
        reads        : ${params.reads}
        outdir       : ${params.outdir}
        """
        .stripIndent()
        
/*
 * define the `index` process that create a binary index
 * given the transcriptome file
 */
process index {

    input:
    path transcriptome from params.transcript
    
    output:
    path 'index' into index_ch
    
    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i index
    """    
}

Channel
    .from index_ch
    .view ()
        
