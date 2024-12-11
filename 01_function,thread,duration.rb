use_bpm 110

print sample_duration :loop_amen

define :nd do |n, t, d|
  use_synth :dpulse
  play n, attack: 0.3, attack_level: 1, decay: d, decay_level: 4, release: 0
  sleep t
end

define :tempo do
  play 70, amp: 5
  sleep 1
end


define :nada do
  nd :e5, 0.75, 0.2
  nd :g5, 0.75, 0.05
  nd :c5, 0.75, 0.2
  nd :e5, 0.75, 0.05
  nd :a4, 0.75, 0.2
  nd :c5, 0.75, 0.05
  nd :g4, 0.75, 0.2
  nd :a4, 0.75, 0.05
  nd :e4, 0.75, 0.2
  nd :g4, 1.25, 0.05
end

in_thread(name: :melody) do loop do nada end end


in_thread(name: :drum) do
  loop do
    sample :loop_amen, amp: 2, rate: (sample_duration :loop_amen)/4
    sleep 4
  end
end