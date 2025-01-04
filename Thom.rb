define :thom do |n=60, a=1, s=1|
  with_fx :gverb, mix: 0.7 do
    with_fx :bpf, mix: 0.5 do
      synth :tri, note: n, attack: 0.3*s, release: 1.01*s, amp: 1*a
      ##| synth :beep, note: n, attack: 0.35*s, release: 1.01*s, amp: 1.5*a
    end
  end
  sleep s
end

use_bpm 108


thomNote = [:c4, :c4, :d4, :g4,].ring
thomAmp = [1.0, 0.6, 0.65, 0.35,].ring
thomSleep = [1.25, 4.75, 1.8, 4,].ring


in_thread(name: :thomSing) do
  thomNote.length().times do
    thom thomNote.tick(:tN), thomAmp.tick(:tA), thomSleep.tick(:tS)
  end
end



