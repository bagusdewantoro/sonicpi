

notes1 = [
  0, 4, 7
].ring

notes2 = [
  2, 5, 9
].ring

num = 1.to_f / 3

sleeps1 = [num].ring

use_bpm 60

key1 = scale(:C4, :chromatic, num_octaves: 1)


live_loop :ageis do
  use_synth :tri
  
  ##| ======== Below is for the same release and amp:
  play [key1[notes1.tick(:one)], key1[notes2.tick(:two)]], amp: 3
  
  ##| ======== Below is for independet release and amp:
  ##| play key1[notes1.tick(:one)], release: 0.55, amp: 3;
  ##| play key1[notes2.tick(:two)], release: 0.55, amp: 2;
  
  sleep sleeps1.tick(:three)
end





