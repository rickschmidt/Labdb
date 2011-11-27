pdf.text "Experiment #{@project.id} and #{@pcrs[0]}"

pdf.text "PCRs #{@pcrs.id}"




if @pcrs
@array=Array.new
@pcrs.each do |pcr|
  @l=Pcr.find(pcr)
  @array<<@l
end


p=@array.map do |pcr|
    [
        pcr.pcr_tube_number,
        pcr.dnasamples.first.dna_accession_number,
        pcr.primerl,
        pcr.primerh,
        pcr.success,
        pcr.ready
        ]
    end
    pdf.table p, :border_style=>:grid,
    :row_colors=>["FFFFFF", "DDDDDD"],
    :headers=>["Tube  ", "DNA Accession", "Primer H", "Primer L", "Success", "Ready"],
    :align=>{0=>:center, 1=>:center, 2=>:center, 3=>:center,4=>:center,5=>:center}
pdf.move_down(30)
end




 

