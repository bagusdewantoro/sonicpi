

$sol1 = [
  [:r, :d4, :cs4, :d4, :fs4, :r, :d5, [:cs5, :fs4]],
  [:fs4, :g4, :fs4, :g4, :fs4, :fs4, :g4, :fs4],
]


use_bpm 60
use_synth :piano

live_loop :seq do
  tick
  $sol1.each { |list|
    puts look
    puts list.ring[look]
    play list.ring[look], release: 0.5, amp: 3
  }
  sleep 0.5
end

