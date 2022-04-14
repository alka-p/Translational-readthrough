#!/bin/perl -w
 
use Bio::SeqIO;

use Bio::Tools::CodonTable;
 


$seq_in = Bio::SeqIO->new(-file => "human_build36_vh.fa", -format => "fasta" );

$prot_out = Bio::SeqIO->new(-file=>'>trans',-format=>"fasta");
 
while ($seq_obj = $seq_in->next_seq){

$prot_obj = $seq_obj->translate;

# $prot_out = Bio::SeqIO->new(-file=>'>trans',-format=>"fasta");

$prot_out->write_seq($prot_obj);

}
