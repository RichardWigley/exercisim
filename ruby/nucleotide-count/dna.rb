require 'pry'


class DNA
  def initialize strand
    validate_arguments(strand)
    @nucleotides = build_nucleotide_frequency strand
  end

  def count match_nucleotide
    validate_arguments match_nucleotide
    @nucleotides.fetch(match_nucleotide, 0)
  end

  def nucleotide_counts
    {
    'A' => @nucleotides.fetch('A',0),
    'T' => @nucleotides.fetch('T',0),
    'C' => @nucleotides.fetch('C',0),
    'G' => @nucleotides.fetch('G',0),
    }
  end

  private

  def validate_arguments strand
    raise(ArgumentError, 'Strands should only contain ACGT') unless nucleic_sequence(strand)
  end

  def build_nucleotide_frequency strand
    strand.chars.each_with_object(Hash.new(0)) do |nucleotide, nucleotide_frequency|
      nucleotide_frequency[nucleotide] += 1
    end
  end

  def nucleic_sequence sequence
    sequence.scan(/[ACGT]/).count == sequence.size
  end
end