

define :marimba do |note|
  with_fx :echo, phase: 0.5, mix: 0.5, pre_amp: 1.0, release: 7 do
    synth :beep, note: note, attack: 0, decay: 0.5, sustain_level: 1, release: 1, amp: (1.5)
  end
  sleep 0.5
end

bassNote1 = [
  [:a2, :f3], [:a2, :f3], :r, [:bf2, :g3], [:bf2, :g3], :r, [:d3, :bf3], [:d3, :bf3],
  :r, [:c3, :a3], [:c3, :a3], :r, :r, :r, :r, :r,
  [:c3, :a3], [:c3, :a3], :r, [:bf2, :g3], [:bf2, :g3], :r, :r, :r,
  :r, :r, :r, :r, :r, :r, :r, :r,
].ring



use_bpm 110

live_loop :metronome do
  ##| synth :beep, note: 67
  sleep 4
end


##| ======== CHOOSE ONE BELOW ===========

##| First, success with metronome sync:

live_loop :bassIntro do
  sync :metronome
  bassNote1.length().times do
    marimba bassNote1.tick(:three)
  end
end


##| Second, the tempo is messed up:

##| live_loop :bassIntro do
##|   sync :metronome
##|   marimba bassNote1.tick(:three)
##| end


