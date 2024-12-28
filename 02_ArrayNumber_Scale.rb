

notes1 = [
  0, 4, 7,
  12, 16, 19,
  24, 28, 31
].ring

num = 1.to_f / 3

sleeps1 = [num].ring



use_bpm 60

##| ======= Test each key below!  (Change key variable inside live_loop)

key1 = scale(:C4, :chromatic, num_octaves: 3)
key2 = scale(:C4, :chromatic, num_octaves: 2)
key3 = scale(:C4, :chromatic, num_octaves: 1)

live_loop :ageis do
  use_synth :tri
  play key1[notes1.tick(:one)], release: 0.55, amp: 3;
  sleep sleeps1.tick(:two)
  puts sleeps1
end