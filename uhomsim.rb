#!/usr/bin/env/ruby
# Generates a null distribution of microhomology use for a given sequence surrounding a break
# Steve Pettitt, Sanger Institute
# spettitt@gmail.com

# Supply 'left' and 'right' sequence - the break occurs at the end of the 'left' sequence and the start of the 'right' sequence.
left = "AGGCTCTTCTAGTATTTTATATTTGAGAAATAAAATTTAACCAAAATTTGCCAATCTAGTAAGCT"
right = "TTAAATAATAGTTTCTAATTTTTTTATTATTCAGGCGAAGTTACATGCTAGAGCTATCTAATATATTTTAAAGGTTGCATAGCATTCTGTCTTATGG"

n = 0
h = {}

# Supply maximum resection length to simulate and number of trials as command line arguments 0 and 1.
while n < ARGV[1].to_i
	x = -1*rand(ARGV[0].to_i)
	y = rand(ARGV[0].to_i)
	i = 1
	j = 0
	sl = left[0..x-1]
	sr = right[y..-1]
	# Has to step through testing 1nt, 2nt...6nt of uhom.
	while i < 7
		lcom = sl[-1*i,i] 
		rcom = sr[0,i]
		if lcom == rcom
			j = i
		end
		i = i+1
	end
	if h[j]
		h[j] = h[j] + 1
	else
		h[j] = 1
	end


n = n+1
end

print "Length\tTimes used by chance\n"
h.each{|k,v| print k.to_s+"\t"+v.to_s+"\n"}
puts n
