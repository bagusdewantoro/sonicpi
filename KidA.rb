use_bpm 113

define :tempo do
  play :f5
  sleep 1
end

# in_thread(name: :threadTempo) do loop do tempo end end

define :piano do
  use_synth :beep
  play :bb
  sleep 1
end

in_thread(name: :threadPiano) do loop do piano end end