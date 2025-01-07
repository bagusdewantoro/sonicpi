
use_bpm 112

##| All Synth :

##| synth_names.each do |name|
##|   notes = [50, 54, 57, 62,]
##|   notes.each do |n|
##|     use_synth name
##|     play n
##|     sleep 0.3
##|   end
##| end


##| Choose Specific Synth :

[:chipbass, :sine,  :dpulse, :pulse, :dsaw, :saw, :dtri, :tri, :square, :pluck, :pretty_bell].each do |name|
  notes = [53, 53, :r, 55, 55, :r, 58, 58, :r, 57, 57, :r, :r, :r, :r, :r, ]
  notes.each do |n|
    with_fx :echo, phase: 0.5, mix: 0.2 do
      with_fx  :eq, low: 0.8, mid: 0.5, mid_q: 0.7 do
        use_synth name
        play n
        sleep 0.5
      end
    end
  end
end