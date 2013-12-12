class Hamming
  def self.compute strand, other_strand
    new(strand, other_strand).hamming_distance
  end

  def initialize strand, other_strand
    @strand = strand.chars
    @other_strand = other_strand.chars
  end

  def hamming_distance
    paired_strands.count do |nucleotide, other_nucleotide|
      mutation?(nucleotide, other_nucleotide)
    end
  end

  def paired_strands
    truncate(@strand).zip truncate(@other_strand)
  end

  def truncate strand
    strand.take shortest_sequence_size
  end

  def shortest_sequence_size
    [@strand.size, @other_strand.size].min
  end

  def mutation? left, right
    left != right
  end
end
